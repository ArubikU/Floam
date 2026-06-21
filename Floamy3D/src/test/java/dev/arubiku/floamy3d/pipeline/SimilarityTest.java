package dev.arubiku.floamy3d.pipeline;

import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.regex.*;

import static org.junit.jupiter.api.Assumptions.assumeTrue;

/**
 * Validation: regenerate each real armor from its source JEMs and compare against the
 * hand/converter-made armor.glsl checked into the repo. Reports structural similarity
 * (slot match, box count, position/size deltas, UV-rect overlap) to build/similarity_report.txt.
 *
 * Note: the ground-truth files are artist-tuned (per-box scale, EXT choice, nudged positions),
 * so an exact match is not expected — this quantifies the gap to drive calibration.
 */
class SimilarityTest {

    private record Box(double[] pos, double[] size, double scale, String rot, Set<String> uvs) {}

    @Test
    void compareGeneratedToGroundTruth() throws Exception {
        String[][] armors = {
            {"licorn_fenrir", "0,180,0", "../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir"},
            {"masaki_spike",  "0,180,0", "../FloamArmors/Packs/Masaki_floam/FloamyArmor/armors/masaki_spike"},
        };
        StringBuilder report = new StringBuilder("# Floamy3D armor generation similarity\n\n");
        boolean any = false;

        for (String[] a : armors) {
            File dir = new File(a[2]);
            File l1 = new File(dir, "layer_1.jem"), l2 = new File(dir, "layer_2.jem");
            File truth = new File(dir, "armor.glsl");
            if (!l1.exists() || !truth.exists()) continue;
            any = true;

            String[] ic = a[1].split(",");
            String mine = new ArmorGenerator().generate(a[0], new int[]{Integer.parseInt(ic[0]),
                    Integer.parseInt(ic[1]), Integer.parseInt(ic[2])}, l1, l2.exists() ? l2 : null);
            String theirs = Files.readString(truth.toPath());

            report.append("## ").append(a[0]).append("\n");
            reportArmor(report, parse(theirs), parse(mine));
            report.append("\n");
        }

        assumeTrue(any, "no real armor pairs in this checkout");
        Path out = Path.of("build/similarity_report.txt");
        Files.createDirectories(out.getParent());
        Files.writeString(out, report.toString());
        System.out.println(report);
    }

    private void reportArmor(StringBuilder r, Map<String, List<Box>> truth, Map<String, List<Box>> mine) {
        Set<String> slots = new TreeSet<>();
        slots.addAll(truth.keySet());
        slots.addAll(mine.keySet());
        r.append(String.format("slots: truth=%d mine=%d  (matched names: %d)%n",
                truth.size(), mine.size(), intersect(truth.keySet(), mine.keySet())));
        for (String slot : slots) {
            List<Box> t = truth.getOrDefault(slot, List.of());
            List<Box> m = mine.getOrDefault(slot, List.of());
            if (t.isEmpty() && m.isEmpty()) continue;
            double posErr = avgPosErr(t, m);
            double uvJac = avgUvJaccard(t, m);
            r.append(String.format("  %-22s boxes truth=%d mine=%d | avgPosDelta=%.2f | uvOverlap=%.0f%%%n",
                    slot, t.size(), m.size(), posErr, uvJac * 100));
        }
    }

    private int intersect(Set<String> a, Set<String> b) {
        int n = 0; for (String s : a) if (b.contains(s)) n++; return n;
    }

    /** Average nearest-box position delta (mine vs truth), boxes paired greedily by proximity. */
    private double avgPosErr(List<Box> t, List<Box> m) {
        if (t.isEmpty() || m.isEmpty()) return -1;
        double sum = 0; int n = 0;
        for (Box mb : m) {
            double best = Double.MAX_VALUE;
            for (Box tb : t) best = Math.min(best, dist(mb.pos, tb.pos));
            sum += best; n++;
        }
        return sum / n;
    }

    private double avgUvJaccard(List<Box> t, List<Box> m) {
        Set<String> tu = new HashSet<>(), mu = new HashSet<>();
        t.forEach(b -> tu.addAll(b.uvs));
        m.forEach(b -> mu.addAll(b.uvs));
        if (tu.isEmpty() && mu.isEmpty()) return 1;
        Set<String> inter = new HashSet<>(tu); inter.retainAll(mu);
        Set<String> uni = new HashSet<>(tu); uni.addAll(mu);
        return uni.isEmpty() ? 0 : (double) inter.size() / uni.size();
    }

    private double dist(double[] a, double[] b) {
        double dx = a[0]-b[0], dy = a[1]-b[1], dz = a[2]-b[2];
        return Math.sqrt(dx*dx + dy*dy + dz*dz);
    }

    // ---- GLSL parsing ----
    private static final Pattern CASE = Pattern.compile("case\\s+(?:CEM_)?([A-Z0-9_]+)\\s*:");
    private static final Pattern BOX = Pattern.compile(
            "ADD_BOX[A-Z_]*\\(\\s*vec3\\(([^)]*)\\)\\s*,\\s*vec3\\(([^)]*)\\)(\\*[0-9.]+)?\\s*,\\s*([^,]+),", Pattern.DOTALL);
    private static final Pattern UV = Pattern.compile("relativeUv\\(([^,]+),([^,]+),([^,]+),([^,]+)");

    /** slotName -> boxes. Slot names normalized by stripping the armor-id prefix + CEM_. */
    private Map<String, List<Box>> parse(String glsl) {
        // keep only FSH
        int fsh = glsl.indexOf("#ifdef FSH");
        if (fsh >= 0) glsl = glsl.substring(fsh);

        Map<String, List<Box>> out = new LinkedHashMap<>();
        Matcher cm = CASE.matcher(glsl);
        List<int[]> spans = new ArrayList<>();
        List<String> names = new ArrayList<>();
        while (cm.find()) { spans.add(new int[]{cm.end()}); names.add(slotSuffix(cm.group(1))); }
        for (int i = 0; i < spans.size(); i++) {
            int start = spans.get(i)[0];
            int end = i + 1 < spans.size() ? spans.get(i + 1)[0] : glsl.length();
            String body = glsl.substring(start, end);
            out.computeIfAbsent(names.get(i), k -> new ArrayList<>()).addAll(parseBoxes(body));
        }
        return out;
    }

    private List<Box> parseBoxes(String body) {
        List<Box> boxes = new ArrayList<>();
        Matcher bm = BOX.matcher(body);
        while (bm.find()) {
            double[] pos = nums(bm.group(1));
            double[] size = nums(bm.group(2));
            double scale = bm.group(3) != null ? Double.parseDouble(bm.group(3).substring(1)) : 1.0;
            String rot = bm.group(4).trim();
            Set<String> uvs = new HashSet<>();
            Matcher um = UV.matcher(body);
            while (um.find())
                uvs.add(norm(um.group(1)) + "," + norm(um.group(2)) + "," + norm(um.group(3)) + "," + norm(um.group(4)));
            boxes.add(new Box(pos, new double[]{size[0]*scale, size[1]*scale, size[2]*scale}, scale, rot, uvs));
        }
        return boxes;
    }

    /** Strip the armor-id prefix so e.g. LICORN_FENRIR_CHESTPLATE -> CHESTPLATE. */
    private String slotSuffix(String name) {
        String[] keys = {"CHESTPLATE","INNER_ARMOR","RIGHT_ARM","LEFT_ARM","RIGHT_LEG","LEFT_LEG",
                "RIGHT_FEET","LEFT_FEET","RIGHT_BOOT","LEFT_BOOT","HELMET"};
        for (String k : keys) if (name.endsWith(k)) return k;
        return name;
    }

    private double[] nums(String csv) {
        String[] p = csv.split(",");
        double[] d = new double[3];
        for (int i = 0; i < 3 && i < p.length; i++) d[i] = Double.parseDouble(p[i].trim());
        return d;
    }
    private String norm(String s) { return String.valueOf((int) Math.round(Double.parseDouble(s.trim()))); }
}
