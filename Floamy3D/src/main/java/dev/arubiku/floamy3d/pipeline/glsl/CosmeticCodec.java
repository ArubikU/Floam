package dev.arubiku.floamy3d.pipeline.glsl;

import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.FaceUV;
import dev.arubiku.floamy3d.pipeline.model.Mat3;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Data-driven cosmetic codec. Replaces the per-cosmetic GLSL macro cases: every box of every cosmetic
 * is encoded into ONE flat array embedded in GLSL, decoded + ray-marched by a single generic loop
 * ({@code floamy/cosmetic_decode.glsl}) — the same engine idea as the armor's atlas data region, but
 * the source is a GLSL constant array, not a texture (only the marker + overlay live in the skin).
 *
 * <p>ALIGNED WITH THE ARMOR PIPELINE: the decode reproduces ADD_BOX_ROTATE — {@code R*(-center +
 * pos*ms)} with R = euler * PIX (the JEM->CEM base). Same coordinate space as armor / the reference
 * MagicShaders cape; NOT the old Y<->Z-conjugated + bone-pivot path.
 *
 * <p>Every scalar is a 16-bit value (0..65535); TWO are PACKED per {@code uint} ({@code hi<<16 | lo}).
 * Per box = {@value #PPB} scalars:
 * <pre>
 *   [0..2]   pos.xyz           bbmodel centre (bone-localized), fixed-point [-RANGE,RANGE]
 *   [3..5]   size.xyz          half-extent (+sizeadd) * scale, fixed-point
 *   [6..14]  Rown mat3         cube IN-PLACE orientation euler(cube+jp), col-major, fixed-point
 *   [15..23] Rgroup mat3       group/bone euler (orbits gp), col-major, fixed-point
 *   [24..26] gp.xyz            group pivot (bone-localized), fixed-point
 *   [27..50] 6 faces (u,d,n,w,s,e) x (x,y,w,h)  -> relativeUv args, fixed-point
 *   [51]     emissive          intensity 0..1, or -1 = not emissive, fixed-point
 *   [52]     transparency      alpha 0..1, or -1 = opaque, fixed-point
 * </pre>
 * Decode (pre-PIX nested transform, then PIX bridge): mc = gp + Rgroup*(pos-gp);  Rfull = PIX*Rgroup*Rown;
 * box centre = PIX*mc, orientation Rfull. So the GROUP rotates all its cubes rigidly around gp while each
 * cube's OWN rotation stays in place — no splay. Group animation multiplies into Rgroup.
 * Animation: per-box GameTime formulas in generated cos_anim_* functions (rot multiplied on the LEFT
 * of R, like the reference's {@code Rotate3(anim)*PIX}).
 */
public final class CosmeticCodec {

    public static final int PPB = 53;
    public static final double RANGE = 64.0;

    private final List<Integer> vals = new ArrayList<>();   // flat 16-bit scalars (pre-packing)
    private final StringBuilder index = new StringBuilder();
    private final StringBuilder animRot = new StringBuilder();  // cos_anim_rot()  body (mat3 per box)
    private final StringBuilder animPos = new StringBuilder();  // cos_anim_pos()  body (vec3 per box)
    private final StringBuilder animSize = new StringBuilder(); // cos_anim_size() body (vec3 per box)
    private int box = 0;
    private boolean first = true;

    public void add(CemModel m) {
        int start = box;
        for (CemBox b : m.boxes) { encodeBox(b); box++; }
        index.append("    ").append(first ? "if" : "else if").append(" (cemi == CEM_").append(m.id)
             .append(") { start = ").append(start).append("; count = ").append(m.boxes.size()).append("; }\n");
        first = false;
    }

    private void encodeBox(CemBox b) {
        putF(b.center.x); putF(b.center.y); putF(b.center.z);                          // [0..2] pos (bbmodel)
        putF(Math.max(b.half.x, 0.01)); putF(Math.max(b.half.y, 0.01)); putF(Math.max(b.half.z, 0.01)); // [3..5] size (already scaled)
        Mat3 own = b.ownMatrix != null ? b.ownMatrix : Mat3.identity();                // [6..14] Rown (in-place)
        for (double d : own.m) putF(d);
        Mat3 grp = b.orbitMatrix != null ? b.orbitMatrix : Mat3.identity();            // [15..23] Rgroup (orbit gp)
        for (double d : grp.m) putF(d);
        var gp = b.bonePivotRender != null ? b.bonePivotRender : new dev.arubiku.floamy3d.pipeline.model.Vec3(0,0,0);
        putF(gp.x); putF(gp.y); putF(gp.z);                                            // [24..26] gp (group pivot)
        // [27..50] faces in the armor's order (u,d,n,w,s,e) so the decode matches fd_box_faces.
        int[] order = {CemBox.UP, CemBox.DOWN, CemBox.NORTH, CemBox.WEST, CemBox.SOUTH, CemBox.EAST};
        for (int f : order) putFace(b.faces != null && f < b.faces.length ? b.faces[f] : null);
        putF(b.emissive);       // [39] emissive intensity (-1 = none)
        putF(b.transparency);   // [40] alpha (-1 = opaque)
        // animation formulas -> per-box cases in the generated cos_anim_* functions
        if (b.animRot != null) {
            StringBuilder r = new StringBuilder();
            for (int a = 0; a < 3; a++) if (b.animRot[a] != null)
                r.append(r.length() == 0 ? "" : " * ").append("cos_rot(").append(b.animRot[a]).append(", ").append(a).append(")");
            if (r.length() > 0) animRot.append("    if (gid == ").append(box).append(") return ").append(r).append(";\n");
        }
        animVec(animPos, b.animPos);
        animVec(animSize, b.animSize);
    }

    /** Emit a vec3 case (per axis: formula or 0.0) into a cos_anim_pos/size body for this box. */
    private void animVec(StringBuilder out, String[] f) {
        if (f == null || (f[0] == null && f[1] == null && f[2] == null)) return;
        out.append("    if (gid == ").append(box).append(") return vec3(")
           .append(f[0] != null ? f[0] : "0.0").append(", ")
           .append(f[1] != null ? f[1] : "0.0").append(", ")
           .append(f[2] != null ? f[2] : "0.0").append(");\n");
    }

    private void putFace(FaceUV f) {
        if (f == null || !f.enabled) { putF(0); putF(0); putF(0); putF(0); return; }
        putF(f.x); putF(f.y); putF(f.w); putF(f.h);
    }

    private void putF(double v) { putRaw(enc(v)); }
    private void putRaw(int v) { vals.add(clamp16(v)); }

    private static int clamp16(int v) { return Math.max(0, Math.min(65535, v)); }
    private static int enc(double v) { return clamp16((int) Math.round((v + RANGE) / (2 * RANGE) * 65535.0)); }

    public int boxCount() { return box; }

    /** GLSL file: packed uint array (2 scalars/elem) + COS_PPB/COS_RANGE + the cos_index router. */
    public String glsl() {
        StringBuilder sb = new StringBuilder("// generated — data-driven cosmetic geometry (see CosmeticCodec)\n");
        sb.append("#define COS_PPB ").append(PPB).append("\n");
        sb.append("#define COS_RANGE ").append(String.format(Locale.ROOT, "%.1f", RANGE)).append("\n");
        // perf: when NOTHING animates, the decode skips the per-box anim calls + the identity mat3 mult.
        if (animRot.length() == 0 && animPos.length() == 0 && animSize.length() == 0) sb.append("#define COS_NO_ANIM\n");
        int packed = (vals.size() + 1) / 2;
        sb.append("const uint COS_DATA[").append(Math.max(packed, 1)).append("] = uint[](");
        if (vals.isEmpty()) sb.append("0u");
        else for (int i = 0; i < vals.size(); i += 2) {
            int hi = vals.get(i), lo = (i + 1 < vals.size()) ? vals.get(i + 1) : 0;
            long w = ((long) hi << 16) | (lo & 0xFFFF);
            if (i > 0) sb.append(",");
            sb.append(w).append("u");
        }
        sb.append(");\n\n");
        sb.append("void cos_index(int cemi, out int start, out int count) {\n");
        sb.append("    start = 0; count = 0;\n").append(index).append("}\n\n");
        // generated animation from arbitrary GameTime formulas (cos_rot from the decode).
        sb.append("mat3 cos_anim_rot(int gid) {\n").append(animRot).append("    return mat3(1.0);\n}\n");
        sb.append("vec3 cos_anim_pos(int gid) {\n").append(animPos).append("    return vec3(0.0);\n}\n");
        sb.append("vec3 cos_anim_size(int gid) {\n").append(animSize).append("    return vec3(0.0);\n}\n");
        return sb.toString();
    }
}
