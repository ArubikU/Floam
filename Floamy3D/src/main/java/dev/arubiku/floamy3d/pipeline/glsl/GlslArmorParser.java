package dev.arubiku.floamy3d.pipeline.glsl;

import dev.arubiku.floamy3d.pipeline.model.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Parses an existing HAND-MADE {@code armor.glsl} back into {@link CemModel}s so it can be the
 * direct source of truth (≈Blockbench). ~90% of the armors were authored by hand in GLSL and diverge
 * from their JEM, so for those the only way to reproduce the artist's exact geometry is to read the
 * GLSL itself. The boxes then go through the same data-driven encoder as the JEM path.
 *
 * <p>Each {@code case <PART>: { ADD_BOX_*(vec3 pos, vec3 size *scale, ROT, vec3 pivot,
 * relativeUv(..)×6, faceRot×6 [, mirror]); ... break; }} becomes one CemBox.
 */
public final class GlslArmorParser {

    private static final Pattern CASE = Pattern.compile("case\\s+([A-Za-z0-9_]+)\\s*:\\s*\\{");
    private static final Pattern ADDBOX = Pattern.compile(
            "ADD_BOX(_EXT)?[A-Z_]*\\(\\s*vec3\\(([^)]*)\\)\\s*,\\s*vec3\\(([^)]*)\\)\\s*(\\*\\s*([0-9.]+))?\\s*,\\s*([A-Za-z0-9_*]+)\\s*,\\s*vec3\\(([^)]*)\\)\\s*,(.*?)\\)\\s*;",
            Pattern.DOTALL);
    private static final Pattern RUV = Pattern.compile(
            "relativeUv\\(\\s*(-?[0-9.]+)\\s*,\\s*(-?[0-9.]+)\\s*,\\s*(-?[0-9.]+)\\s*,\\s*(-?[0-9.]+)");

    /** Parse the armor.glsl; returns part-case-name -> its CemModel (boxes). */
    public Map<String, CemModel> parse(Path glsl, int texW, int texH) throws IOException {
        String txt = stripFsh(Files.readString(glsl).replaceAll("//[^\n]*", ""));  // drop // comments
        Map<String, CemModel> out = new LinkedHashMap<>();
        Matcher c = CASE.matcher(txt);
        List<int[]> cases = new ArrayList<>();
        List<String> names = new ArrayList<>();
        while (c.find()) { cases.add(new int[]{c.end()}); names.add(c.group(1)); }
        for (int i = 0; i < cases.size(); i++) {
            int start = cases.get(i)[0];
            int end = i + 1 < cases.size() ? txt.indexOf("case ", start) : txt.length();
            if (end < 0) end = txt.length();
            String body = txt.substring(start, Math.min(end, txt.length()));
            String name = names.get(i);
            CemModel m = new CemModel(name, Part.fromName(name), texW, texH);
            for (CemBox b : boxes(body)) m.boxes.add(b);
            if (!m.boxes.isEmpty()) out.put(name, m);
        }
        return out;
    }

    private List<CemBox> boxes(String body) {
        List<CemBox> list = new ArrayList<>();
        Matcher m = ADDBOX.matcher(body);
        while (m.find()) {
            boolean ext = m.group(1) != null;
            double[] pos = vec(m.group(2));
            double[] sz = vec(m.group(3));
            double scale = m.group(5) != null ? Double.parseDouble(m.group(5)) : 1.0;
            Mat3 rot = rotation(m.group(6).trim());
            // remaining args: 6 relativeUv + 6 faceRot [+ mirror]
            String rest = m.group(8);
            FaceUV[] faces = faces(rest);
            // hand emits the FULL rotation matrix (PIX*..) -> store as rotMatrix, no extra base.
            list.add(new CemBox(new Vec3(pos[0], pos[1], pos[2]),
                    new Vec3(sz[0], sz[1], sz[2]), new Vec3(0, 0, 0), new Vec3(0, 0, 0),
                    false, faces, null, ext, scale, rot));
        }
        return list;
    }

    /** Faces in hand order: up, down, north, west, south, east -> CemBox indices. */
    private FaceUV[] faces(String rest) {
        FaceUV[] f = new FaceUV[6];
        Arrays.fill(f, FaceUV.DISABLED);
        Matcher u = RUV.matcher(rest);
        double[][] uv = new double[6][];
        int n = 0;
        while (u.find() && n < 6) {
            uv[n++] = new double[]{Double.parseDouble(u.group(1)), Double.parseDouble(u.group(2)),
                    Double.parseDouble(u.group(3)), Double.parseDouble(u.group(4))};
        }
        int[] order = {CemBox.UP, CemBox.DOWN, CemBox.NORTH, CemBox.WEST, CemBox.SOUTH, CemBox.EAST};
        for (int i = 0; i < 6 && i < n; i++)
            if (uv[i] != null) f[order[i]] = new FaceUV(uv[i][0], uv[i][1], uv[i][2], uv[i][3], 0, true);
        return f;
    }

    /** Evaluate a rotation macro expression like "PIX*PIX25*PIY12" into a Mat3. */
    static Mat3 rotation(String expr) {
        Mat3 r = Mat3.identity();
        for (String t : expr.split("\\*")) {
            Mat3 m = NAMED.get(t.trim());
            if (m != null) r = r.mul(m);
        }
        return r;
    }

    private static final Map<String, Mat3> NAMED = new HashMap<>();
    static {
        // mirrors matf.glsl PIX/PIY/PIZ + N variants; denom suffixes: bare=1/2, 25=1/4, 12=1/8,
        // 62=1/16, 31=1/32, 16=1/64, 2=1, 3=1.5
        double[][] denom = {{0, 0.5}, {25, 0.25}, {12, 0.125}, {62, 0.0625}, {31, 0.03125},
                {16, 0.015625}, {2, 1.0}, {3, 1.5}};
        String[] ax = {"X", "Y", "Z"};
        for (int a = 0; a < 3; a++) {
            for (double[] d : denom) {
                String suf = d[0] == 0 ? "" : String.valueOf((int) d[0]);
                NAMED.put("PI" + ax[a] + suf, Mat3.rotation(a, Math.PI * d[1]));
                NAMED.put("NI" + ax[a] + suf, Mat3.rotation(a, -Math.PI * d[1]));
            }
        }
        NAMED.put("PINULL", Mat3.identity());
    }

    /** Keep only the #ifdef FSH section if the file is split (else the whole text). */
    private static String stripFsh(String t) {
        int i = t.indexOf("#ifdef FSH");
        if (i < 0) return t;
        int j = t.indexOf("#endif", i);
        return j < 0 ? t.substring(i) : t.substring(i, j);
    }

    private static double[] vec(String s) {
        String[] p = s.split(",");
        return new double[]{Double.parseDouble(p[0].trim()), Double.parseDouble(p[1].trim()), Double.parseDouble(p[2].trim())};
    }
}
