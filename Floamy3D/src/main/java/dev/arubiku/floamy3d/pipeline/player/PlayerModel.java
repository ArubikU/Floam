package dev.arubiku.floamy3d.pipeline.player;

import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * The standard (vanilla) Blockbench player template: the bones (groups), each with its attach
 * pivot and its base cube bounds, in player-template coordinates (Y up, feet at y=0).
 *
 * Used to diff a cosmetic bbmodel against vanilla:
 *  - an element inside a bone group beyond the base cube  -> cosmetic geometry for that bone
 *  - an element that changes the base cube                -> player modification (override)
 *  - an element outside every bone                        -> ignored
 *
 * Cosmetic geometry is localized to the bone by subtracting {@link Bone#pivot}, so it renders
 * relative to that body part (matching the CEM per-part rendering).
 */
public final class PlayerModel {

    public static final class Bone {
        public final Part part;
        public final String name;
        public final Vec3 pivot;     // attach point (subtract to localize)
        public final Vec3 from, to;  // base cube bounds (vanilla)
        Bone(Part part, String name, Vec3 pivot, Vec3 from, Vec3 to) {
            this.part = part; this.name = name; this.pivot = pivot; this.from = from; this.to = to;
        }
        public boolean isBaseCube(Vec3 f, Vec3 t, double eps) {
            return near(from, f, eps) && near(to, t, eps);
        }
    }

    public static final Map<String, Bone> BONES = new LinkedHashMap<>();
    static {
        add(Part.HEAD,      "head",      v(0,24,0),    v(-4,24,-4), v(4,32,4));
        add(Part.BODY,      "body",      v(0,24,0),    v(-4,12,-2), v(4,24,2));
        add(Part.RIGHT_ARM, "right_arm", v(-5,22,0),   v(-8,12,-2), v(-4,24,2));
        add(Part.LEFT_ARM,  "left_arm",  v(5,22,0),    v(4,12,-2),  v(8,24,2));
        add(Part.RIGHT_LEG, "right_leg", v(-1.9,12,0), v(-4,0,-2),  v(0,12,2));
        add(Part.LEFT_LEG,  "left_leg",  v(1.9,12,0),  v(0,0,-2),   v(4,12,2));
    }

    private static void add(Part p, String n, Vec3 piv, Vec3 f, Vec3 t) { BONES.put(n, new Bone(p, n, piv, f, t)); }
    private static Vec3 v(double x, double y, double z) { return new Vec3(x, y, z); }
    private static boolean near(Vec3 a, Vec3 b, double e) {
        return Math.abs(a.x-b.x)<e && Math.abs(a.y-b.y)<e && Math.abs(a.z-b.z)<e;
    }

    /** Resolve a Blockbench group/bone name to a vanilla bone (slim arm names included). */
    public static Bone bone(String groupName) {
        if (groupName == null) return null;
        String s = groupName.toLowerCase(java.util.Locale.ROOT).trim();
        if (BONES.containsKey(s)) return BONES.get(s);
        // tolerant aliases
        if (s.contains("head") || s.contains("hat")) return BONES.get("head");
        if (s.contains("body") || s.contains("torso") || s.contains("chest")) return BONES.get("body");
        if (s.contains("right") && s.contains("arm")) return BONES.get("right_arm");
        if (s.contains("left") && s.contains("arm"))  return BONES.get("left_arm");
        if (s.contains("right") && s.contains("leg")) return BONES.get("right_leg");
        if (s.contains("left") && s.contains("leg"))  return BONES.get("left_leg");
        return null;
    }

    /** Bone whose base-cube region contains a point (fallback when there's no named group). */
    public static Bone boneAt(Vec3 p) {
        Bone best = null; double bestD = Double.MAX_VALUE;
        for (Bone b : BONES.values()) {
            Vec3 c = new Vec3((b.from.x+b.to.x)/2, (b.from.y+b.to.y)/2, (b.from.z+b.to.z)/2);
            boolean inside = p.x>=b.from.x-4 && p.x<=b.to.x+4 && p.y>=b.from.y-4 && p.y<=b.to.y+4;
            double d = Math.abs(p.x-c.x)+Math.abs(p.y-c.y)+Math.abs(p.z-c.z);
            if (inside && d < bestD) { bestD = d; best = b; }
        }
        return best;
    }
}
