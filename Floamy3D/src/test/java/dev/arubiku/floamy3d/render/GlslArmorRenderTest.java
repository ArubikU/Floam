package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.*;
import org.junit.jupiter.api.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assumptions.assumeTrue;

/**
 * Side-by-side offline render: the HAND-MADE armor.glsl (ground truth) vs the geometry our
 * pipeline generates from the same JEM. Parsing the ground-truth GLSL into boxes and rendering it
 * the same way our boxes render shows exactly where ours differs.
 */
class GlslArmorRenderTest {

    private static final Mat3 PIX = Mat3.rotation(0, Math.PI / 2);
    private static final File DIR =
            new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir");

    @Test
    void renderTheirsVsMine() throws Exception {
        File glsl = new File(DIR, "armor.glsl");
        File jem = new File(DIR, "layer_1.jem");
        File png = new File(DIR, "layer_1.png");
        assumeTrue(glsl.exists() && png.exists(), "assets missing");
        BufferedImage tex = ImageIO.read(png);

        BufferedImage tex2 = new File(DIR, "layer_2.png").exists() ? ImageIO.read(new File(DIR, "layer_2.png")) : tex;
        List<TexturedBox> theirs = parseGlsl(Files.readString(glsl.toPath()), tex);
        List<TexturedBox> mine = new ArrayList<>();
        mine.addAll(mineFromJem(jem, tex));                       // layer_1 (outer)
        mine.addAll(mineFromJem(new File(DIR, "layer_2.jem"), tex2)); // layer_2 (inner/legs)
        System.out.printf("theirs boxes=%d  mine boxes(both layers)=%d%n", theirs.size(), mine.size());

        Path out = Path.of("build/demos/render");
        Files.createDirectories(out);
        TexturedRenderer tr = new TexturedRenderer(220);
        SoftwareRenderer sr = new SoftwareRenderer(220);
        for (SoftwareRenderer.View v : SoftwareRenderer.View.values()) {
            // textured side-by-side
            ImageIO.write(sideBySide(tr.render(theirs, v), tr.render(mine, v)), "png",
                    out.resolve("compare_" + v.name().toLowerCase() + ".png").toFile());
            // silhouette side-by-side (pure geometry)
            ImageIO.write(sideBySide(mask(sr.render(toOriented(theirs), v)), mask(sr.render(toOriented(mine), v))),
                    "png", out.resolve("compare_sil_" + v.name().toLowerCase() + ".png").toFile());
        }
    }

    private List<OrientedBox> toOriented(List<TexturedBox> boxes) {
        List<OrientedBox> o = new ArrayList<>();
        for (TexturedBox b : boxes) o.add(new OrientedBox(b.center, b.half, b.rot));
        return o;
    }
    private BufferedImage mask(boolean[][] m) {
        int n = m.length;
        BufferedImage img = new BufferedImage(n, n, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < n; y++) for (int x = 0; x < n; x++) img.setRGB(x, y, m[y][x] ? 0xFF6A4FC8 : 0x00000000);
        return img;
    }

    private List<TexturedBox> mineFromJem(File jem, BufferedImage tex) throws Exception {
        List<TexturedBox> out = new ArrayList<>();
        if (!jem.exists()) return out;
        for (CemModel m : JemParser.forArmor().parse(jem))
            for (CemBox b : m.boxes) {
                Mat3 R = (b.hasBaseRotation() ? PIX : Mat3.identity())
                        .mul(b.rotMatrix != null ? b.rotMatrix : Mat3.identity());
                out.add(new TexturedBox(R.mul(b.center), b.half.mul(b.scale), R, b.faces, tex));
            }
        return out;
    }

    // ---- parse the hand-made armor.glsl ----
    private static final Pattern BOX = Pattern.compile(
            "ADD_BOX[A-Z_]*\\(\\s*vec3\\(([^)]*)\\)\\s*,\\s*vec3\\(([^)]*)\\)(\\*[0-9.]+)?\\s*,\\s*" +
            "([A-Za-z0-9_*]+)\\s*,\\s*vec3\\([^)]*\\)\\s*,(.*?)\\);", Pattern.DOTALL);
    private static final Pattern RUV = Pattern.compile(
            "relativeUv\\(\\s*([-0-9.]+)\\s*,\\s*([-0-9.]+)\\s*,\\s*([-0-9.]+)\\s*,\\s*([-0-9.]+)");

    private List<TexturedBox> parseGlsl(String src, BufferedImage tex) {
        int fsh = src.indexOf("#ifdef FSH");
        if (fsh >= 0) src = src.substring(fsh);
        src = src.replaceAll("(?m)//.*$", ""); // strip line comments inside macro calls
        List<TexturedBox> out = new ArrayList<>();
        Matcher m = BOX.matcher(src);
        while (m.find()) {
            Vec3 pos = vec(m.group(1));
            Vec3 size = vec(m.group(2));
            double scale = m.group(3) != null ? Double.parseDouble(m.group(3).substring(1)) : 1.0;
            Mat3 R = parseRot(m.group(4).trim());
            // their faces order: up, down, north, west, south, east
            List<double[]> uv = new ArrayList<>();
            Matcher um = RUV.matcher(m.group(5));
            while (um.find() && uv.size() < 6)
                uv.add(new double[]{Double.parseDouble(um.group(1)), Double.parseDouble(um.group(2)),
                        Double.parseDouble(um.group(3)), Double.parseDouble(um.group(4))});
            if (uv.size() < 6) continue;
            FaceUV[] f = new FaceUV[6];
            f[CemBox.UP]    = fuv(uv.get(0));
            f[CemBox.DOWN]  = fuv(uv.get(1));
            f[CemBox.NORTH] = fuv(uv.get(2));
            f[CemBox.WEST]  = fuv(uv.get(3));
            f[CemBox.SOUTH] = fuv(uv.get(4));
            f[CemBox.EAST]  = fuv(uv.get(5));
            Vec3 worldCenter = R.mul(pos);
            Vec3 half = new Vec3(size.x * scale, size.y * scale, size.z * scale);
            out.add(new TexturedBox(worldCenter, half, R, f, tex));
        }
        return out;
    }

    private FaceUV fuv(double[] a) { return new FaceUV(a[0], a[1], a[2], a[3], 0, true); }

    private Mat3 parseRot(String expr) {
        Mat3 r = Mat3.identity();
        for (String tok : expr.split("\\*")) {
            tok = tok.trim();
            if (tok.isEmpty() || tok.equals("PINULL")) continue;
            r = r.mul(macro(tok));
        }
        return r;
    }

    private Mat3 macro(String t) {
        boolean neg = t.startsWith("NI");
        if (!t.startsWith("PI") && !t.startsWith("NI")) return Mat3.identity();
        char axisC = t.charAt(2);
        int axis = axisC == 'X' ? 0 : axisC == 'Y' ? 1 : 2;
        String suf = t.substring(3);
        double frac = switch (suf) {
            case "" -> 0.5; case "25" -> 0.25; case "12" -> 0.125; case "62" -> 0.0625;
            case "31" -> 0.03125; case "16" -> 0.015625; case "2" -> 1.0; case "3" -> 1.5;
            default -> 0.5;
        };
        return Mat3.rotation(axis, (neg ? -1 : 1) * frac * Math.PI);
    }

    private Vec3 vec(String csv) {
        String[] p = csv.split(",");
        return new Vec3(Double.parseDouble(p[0].trim()), Double.parseDouble(p[1].trim()), Double.parseDouble(p[2].trim()));
    }

    private BufferedImage sideBySide(BufferedImage a, BufferedImage b) {
        int w = a.getWidth(), h = a.getHeight();
        BufferedImage out = new BufferedImage(w * 2 + 8, h, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) { out.setRGB(x, y, a.getRGB(x, y)); out.setRGB(w + 8 + x, y, b.getRGB(x, y)); }
        }
        return out;
    }
}
