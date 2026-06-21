package dev.arubiku.floamy3d.pipeline.jem;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.arubiku.floamy3d.pipeline.model.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Parses an OptiFine CEM model (.jem) — the format Blockbench exports armor/cosmetics to,
 * and the proven intermediate the old converter consumed.
 *
 * Handles the hard parts:
 *  - invertAxis ("xy"...): baked into geometry so the result is +Y up CEM space.
 *  - referential nested submodels: translate accumulates down the tree; each submodel's
 *    rotate is applied to its boxes (single composed euler per box; deep nesting approximated).
 *  - mirrorTexture "u": becomes the box mirror flag (left/right symmetry).
 *  - sizeAdd: inflate added to half-extents.
 *  - per-face uv (uvNorth..) OR textureOffset auto-unwrap.
 *
 * One JEM part with geometry -> one {@link CemModel}. A full armor JEM yields several
 * (head/body/arms/legs/shoes), each emitted as its own registry case.
 */
public final class JemParser {
    private static final ObjectMapper MAPPER = new ObjectMapper();

    private final String baseRotation; // e.g. "PIX" for armor (JEM->CEM base transform)
    private JpEngine jp;               // hot-reloadable per-part transforms (parsers/*.jp)
    private String armorId = "";       // for the .jp match key "armorId:partName"
    private String curKey = "";        // current part's match key
    private double[] curT = {0, 0, 0}; // current part's resolved translate (for box-scope exprs)

    public JemParser parsers(JpEngine e) { this.jp = e; return this; }
    public JemParser armor(String id) { this.armorId = id == null ? "" : id.toLowerCase(java.util.Locale.ROOT); return this; }
    private final double scale;         // fit factor applied to box size at emit (armor ~0.75)

    public JemParser() { this(null, 1.0); }
    public JemParser(String baseRotation, double scale) {
        this.baseRotation = baseRotation;
        this.scale = scale;
    }

    /** Convenience: armor parsing with the field-truth base transform + fit scale. */
    public static JemParser forArmor() { return new JemParser("PIX", 0.75); }

    public List<CemModel> parse(File jem) throws IOException {
        return parse(MAPPER.readTree(jem));
    }

    public List<CemModel> parse(String json) throws IOException {
        return parse(MAPPER.readTree(json));
    }

    public List<CemModel> parse(JsonNode root) {
        int texW = 64, texH = 32;
        JsonNode ts = root.get("textureSize");
        if (ts != null && ts.isArray() && ts.size() >= 2) {
            texW = ts.get(0).asInt(64);
            texH = ts.get(1).asInt(32);
        }

        List<CemModel> out = new ArrayList<>();
        JsonNode models = root.get("models");
        if (models == null || !models.isArray()) return out;

        for (JsonNode part : models) {
            String partName = part.path("part").asText(part.path("id").asText("model"));
            CemModel model = new CemModel(partName, Part.fromName(partName), texW, texH);
            model.sourcePart = partName.toLowerCase(java.util.Locale.ROOT);

            // Seed the per-part transform context from the JEM, then let parsers/*.jp edit ALL of it
            // (translate, rotate, invert, mirror, base rotation, scale, sizeadd, bone override).
            JpEngine.PartCtx ctx = new JpEngine.PartCtx();
            ctx.t = part.has("translate") ? arr(part.get("translate")) : new double[]{0, 0, 0};
            ctx.invert = invert(part);
            ctx.mirror = mirror(part);
            ctx.base = baseRotation;
            ctx.scale = scale;
            this.curKey = armorId + ":" + model.sourcePart;
            if (jp != null) jp.applyPart(curKey, ctx);

            model.bone = ctx.bone;
            this.curT = ctx.t;
            this.curSceneRot = ctx.sceneRot; this.curSceneT = ctx.sceneT; this.curSceneScale = ctx.sceneScale;
            this.curBase = ctx.base; this.curScale = ctx.scale; this.curSizeadd = ctx.sizeadd;
            this.curRot = ctx.rot;
            this.curChildRot = ctx.childRot; this.curChildSceneRot = ctx.childSceneRot; this.curScenePivot = ctx.scenePivot;
            this.curCrSwap = ctx.crSwap; this.curCrSet = ctx.crSet; this.curCrMul = ctx.crMul;
            // position hierarchy starts unrotated; rotEuler carries the bone's own accumulated euler.
            Frame frame = new Frame(Vec3.of(ctx.t), Mat3.identity(), new Vec3(0, 0, 0), false, ctx.invert, ctx.mirror, isExt(part));
            walk(part, frame, model);

            // `center <z>`: the hand-made armors place each part's MAIN (biggest) box at X=0,Y=0 on
            // the bone (stdev ~0 across all packs) — only Z (depth) varies. Center the main box and
            // shift the rest with it, so decorations keep their relative offset. Fits every armor.
            if (ctx.centerMain && !model.boxes.isEmpty()) {
                CemBox main = model.boxes.get(0);
                for (CemBox bx : model.boxes)
                    if (bx.half.x * bx.half.y * bx.half.z > main.half.x * main.half.y * main.half.z) main = bx;
                Vec3 shift = new Vec3(-main.center.x, -main.center.y, ctx.centerZ - main.center.z);
                for (int i = 0; i < model.boxes.size(); i++)
                    model.boxes.set(i, model.boxes.get(i).withCenter(model.boxes.get(i).center.add(shift)));
            }
            if (!model.boxes.isEmpty()) out.add(model);
        }
        return out;
    }

    // Per-part values resolved from the .jp context for the current part being walked.
    private String curBase;
    private double curScale = 1.0;
    private double curSizeadd = 0.0;
    private double[] curSceneRot = {0, 0, 0};
    private double[] curSceneT = {0, 0, 0};
    private double curSceneScale = 1.0;
    private double[] curRot = {0, 0, 0};
    private double[] curChildRot = {0, 0, 0};
    private double[] curChildSceneRot = {0, 0, 0};
    private double[] curScenePivot = {0, 0, 0};
    private int[] curCrSwap = {0, 1, 2};
    private double[] curCrSet = {Double.NaN, Double.NaN, Double.NaN};
    private double[] curCrMul = {1, 1, 1};

    /**
     * Faithful to the proven hand-made / FloamyConverter logic: position is a NAIVE translate sum
     * (pos = box_centre + accumulated translate, NO rotation applied to position), and each box's
     * rotation is PIX * (its immediate submodel's euler) — parent rotation is NOT propagated to
     * nested submodels' position or rotation. This is the base the armors were authored against.
     */
    private static final class Frame {
        final Vec3 pos;       // accumulated world position of this bone's origin
        final Mat3 rot;       // accumulated world rotation (for POSITION hierarchy only)
        final Vec3 rotEuler;  // the immediate submodel's euler (ORIENTATION — unchanged old behaviour)
        final boolean isChild; // true once inside a submodel (sub-bone) — for rotatechilds/rotatescchilds
        final boolean invertX, invertY, invertZ;
        final boolean mirror;
        final boolean ext;
        Frame(Vec3 pos, Mat3 rot, Vec3 rotEuler, boolean isChild, boolean[] inv, boolean mir, boolean ext) {
            this.pos = pos; this.rot = rot; this.rotEuler = rotEuler; this.isChild = isChild;
            this.invertX = inv[0]; this.invertY = inv[1]; this.invertZ = inv[2];
            this.mirror = mir; this.ext = ext;
        }
        boolean[] inv() { return new boolean[]{invertX, invertY, invertZ}; }
    }

    private void walk(JsonNode node, Frame frame, CemModel model) {
        JsonNode boxes = node.get("boxes");
        if (boxes != null && boxes.isArray()) {
            for (JsonNode b : boxes) {
                CemBox box = toBox(b, frame, model.boxes.size());
                if (box != null) model.boxes.add(box);
            }
        }
        JsonNode subs = node.get("submodels");
        if (subs != null && subs.isArray()) {
            for (JsonNode s : subs) {
                Vec3 subT = Vec3.of(s.has("translate") ? arr(s.get("translate")) : new double[]{0,0,0});
                Vec3 subR = Vec3.of(s.has("rotate") ? arr(s.get("rotate")) : new double[]{0,0,0});
                // .jp modifiers on each sub-bone's OWN rotation: swap axes -> set (NaN=keep) -> multiply.
                double[] sr = { subR.x, subR.y, subR.z };
                double[] rm = { sr[curCrSwap[0]], sr[curCrSwap[1]], sr[curCrSwap[2]] };
                for (int a = 0; a < 3; a++) {
                    if (!Double.isNaN(curCrSet[a])) rm[a] = curCrSet[a];
                    rm[a] *= curCrMul[a];
                }
                subR = new Vec3(rm[0], rm[1], rm[2]);
                // proper bone hierarchy: the submodel's rotation folds its boxes around the bone pivot
                // (e.g. masaki's spikes angle in via rotate ±22.5). Child offset is rotated by the parent.
                // Armors with no submodel rotation get identity -> same as the old naive sum.
                Mat3 childRot = frame.rot.mul(Mat3.euler(subR));
                Vec3 childPos = frame.pos.add(frame.rot.mul(subT));
                // "child" (for rotatechilds/rotatescchilds) = a submodel that is an ARTICULATED bone
                // (has its own rotation). Unrotated grouping submodels (containers wrapping the main
                // boxes, e.g. fenrir's arm) inherit the parent's flag so root cubes stay root.
                boolean childFlag = frame.isChild || (subR.x != 0 || subR.y != 0 || subR.z != 0);
                walk(s, new Frame(childPos, childRot, subR, childFlag, frame.inv(), frame.mirror || mirror(s), frame.ext || isExt(s)), model);
            }
        }
    }

    private CemBox toBox(JsonNode b, Frame frame, int boxIndex) {
        double[] c = arr(b.get("coordinates"));
        if (c == null || c.length < 6) return null;
        double x = c[0], y = c[1], z = c[2], w = c[3], h = c[4], d = c[5];
        double add = b.path("sizeAdd").asDouble(0.0);

        // pos = bone origin + bone rotation applied to the box's local centre (proper hierarchy, so a
        // rotated sub-bone folds its boxes around its pivot). Top-level frame.rot is identity = naive.
        Vec3 localCenter = new Vec3(x + w / 2, y + h / 2, z + d / 2);
        Vec3 worldCenter = frame.pos.add(frame.rot.mul(localCenter));

        // Scene transform (whole part): scalesc -> rotatesc -> translatesc, around scenePivot (default
        // origin). Pivoting matters for OFFSET boxes (e.g. masaki's spikes): rotating around the part
        // origin swings them away; a chosen pivot keeps them folded with the body.
        Vec3 piv = Vec3.of(curScenePivot);
        worldCenter = worldCenter.sub(piv);
        if (curSceneScale != 1.0)
            worldCenter = new Vec3(worldCenter.x * curSceneScale, worldCenter.y * curSceneScale, worldCenter.z * curSceneScale);
        if (curSceneRot[0] != 0 || curSceneRot[1] != 0 || curSceneRot[2] != 0)
            worldCenter = Mat3.euler(Vec3.of(curSceneRot)).mul(worldCenter);
        // rotatescchilds: extra POSITION rotation applied ON TOP, sub-bones only.
        if (frame.isChild && (curChildSceneRot[0] != 0 || curChildSceneRot[1] != 0 || curChildSceneRot[2] != 0))
            worldCenter = Mat3.euler(Vec3.of(curChildSceneRot)).mul(worldCenter);
        worldCenter = worldCenter.add(piv);
        if (curSceneT[0] != 0 || curSceneT[1] != 0 || curSceneT[2] != 0)
            worldCenter = worldCenter.add(Vec3.of(curSceneT));

        // MC entity render frame swaps X<->Z vs JEM/Blockbench coords (confirmed via refmap gizmo:
        // a +X move renders in Z and vice versa). Bridge it so JEM X -> world X.
        worldCenter = new Vec3(worldCenter.z, worldCenter.y, worldCenter.x);

        // Cosmetics (no PIX) bake the JEM axis inverts. Armor's coord convention is handled by PIXᵀ
        // below (Y) + the .jp (right-side `mirror x` for the X mirror) — nothing hardcoded here.
        if (curBase == null) {
            worldCenter = new Vec3(frame.invertX ? -worldCenter.x : worldCenter.x,
                                   frame.invertY ? -worldCenter.y : worldCenter.y,
                                   frame.invertZ ? -worldCenter.z : worldCenter.z);
        }

        // The macro renders R*(-center + pos), R = PIX. The hand-made armor pre-rotates the position
        // by PIXᵀ so the box lands at worldCenter after the macro's PIX. PIXᵀ: (x,y,z)->(x,z,-y).
        // (Verified across all packs: hand = PIXᵀ(worldCenter) + per-part Z-lift, Y offset ~0.)
        // Cosmetics (base none) keep worldCenter as-is.
        Vec3 emitPos = (curBase != null)
                ? new Vec3(worldCenter.x, worldCenter.z, -worldCenter.y)
                : worldCenter;
        double add2 = add + curSizeadd;
        Vec3 half = new Vec3(w / 2 + add2, h / 2 + add2, d / 2 + add2);
        // Orientation: euler(rotatechilds for sub-bones) * euler(rotate) * boneAccumulated. `rotate`
        // spins the whole part (children follow); `rotatechilds` adds extra spin to sub-bones only, ON
        // TOP of everything. `rotatesc`/`rotatescchilds` stay OUT of orientation (position-only).
        Mat3 rOrient = Mat3.euler(Vec3.of(curRot)).mul(frame.rot);
        if (frame.isChild && (curChildRot[0] != 0 || curChildRot[1] != 0 || curChildRot[2] != 0))
            rOrient = Mat3.euler(Vec3.of(curChildRot)).mul(rOrient);
        boolean hasRot = !isIdentity(rOrient);
        Vec3 rotEuler = new Vec3(0, 0, 0);
        Mat3 rotMatrix = hasRot ? rOrient : null;

        boolean perFace = b.has("uvNorth") || b.has("uvUp") || b.has("uvDown");
        FaceUV[] faces = faces(b, w, h, d);

        // Box-scope .jp ops (seat / cube targeting / btranslate / mirror / flipu / flipv). size = the
        // scaled half-extent the shader uses, so `seat` (bz.z = -sz.y) matches posZ = -sizeY.
        if (jp != null) {
            JpEngine.BoxCtx bc = new JpEngine.BoxCtx(
                    new double[]{emitPos.x, emitPos.y, emitPos.z},
                    new double[]{half.x * curScale, half.y * curScale, half.z * curScale},
                    boxIndex, curT);
            bc.perFace = perFace;
            jp.applyBox(curKey, bc);
            emitPos = new Vec3(bc.pos[0], bc.pos[1], bc.pos[2]);
            // switchface: remap face UVs (swap[i] = which source face's UV face i takes)
            boolean reorder = false;
            for (int i = 0; i < 6; i++) if (bc.swap[i] != i) { reorder = true; break; }
            if (reorder) {
                FaceUV[] src = faces.clone();
                for (int i = 0; i < 6 && i < faces.length; i++) faces[i] = src[bc.swap[i]];
            }
            if (bc.flipU || bc.flipV) faces = flipFaces(faces, bc.flipU, bc.flipV);
            // per-face UV flips (flipface op)
            for (int i = 0; i < 6 && i < faces.length; i++)
                if ((bc.faceU[i] || bc.faceV[i]) && faces[i] != null && faces[i].enabled)
                    faces[i] = flipOne(faces[i], bc.faceU[i], bc.faceV[i]);
        }


        return new CemBox(emitPos, half, rotEuler, new Vec3(0, 0, 0), frame.mirror, faces,
                curBase, frame.ext, curScale, rotMatrix);
    }

    private static boolean isIdentity(Mat3 m) {
        double[] a = m.m;
        for (int i = 0; i < 9; i++) {
            double exp = (i % 4 == 0) ? 1.0 : 0.0;   // diagonal entries at 0,4,8
            if (Math.abs(a[i] - exp) > 1e-9) return false;
        }
        return true;
    }

    /** Mirror a box's UVs in place: flipU negates each face width, flipV its height (engine reads
     *  negative w/h in relativeUv as a flipped sample — same trick the hand-made packs use). */
    /** Flip a single face's UV (u = horizontal, v = vertical) in place, keeping the same region. */
    private FaceUV flipOne(FaceUV s, boolean u, boolean v) {
        double x = s.x, y = s.y, w = s.w, h = s.h;
        if (u) { x = x + w; w = -w; }
        if (v) { y = y + h; h = -h; }
        return new FaceUV(x, y, w, h, 0, true);
    }

    private FaceUV[] flipFaces(FaceUV[] f, boolean u, boolean v) {
        FaceUV[] out = new FaceUV[f.length];
        for (int i = 0; i < f.length; i++) {
            FaceUV s = f[i];
            if (s == null || !s.enabled) { out[i] = s; continue; }
            double x = s.x, y = s.y, w = s.w, h = s.h;
            if (u) { x = x + w; w = -w; }   // flip horizontal, keep the same region
            if (v) { y = y + h; h = -h; }   // flip vertical
            out[i] = new FaceUV(x, y, w, h, 0, true);
        }
        return out;
    }

    /** Inverted/shell geometry flagged by a node id convention (inv / inside / shell / ext). */
    private boolean isExt(JsonNode node) {
        String id = node.path("id").asText("").toLowerCase(java.util.Locale.ROOT);
        return id.contains("inv") || id.contains("inside") || id.contains("shell") || id.contains("_ext");
    }

    private FaceUV[] faces(JsonNode b, double w, double h, double d) {
        FaceUV[] f = new FaceUV[6];
        if (b.has("uvNorth") || b.has("uvUp") || b.has("uvDown")) {
            f[CemBox.DOWN]  = faceUv(b, "uvDown");
            f[CemBox.UP]    = faceUv(b, "uvUp");
            f[CemBox.NORTH] = faceUv(b, "uvNorth");
            f[CemBox.EAST]  = faceUv(b, "uvEast");
            f[CemBox.SOUTH] = faceUv(b, "uvSouth");
            f[CemBox.WEST]  = faceUv(b, "uvWest");
            // Stored LITERAL — the WEST/SOUTH shader-mirror compensation is applied AFTER the user's
            // box-ops (in toBox), by final slot, so switchface/flipface operate on clean per-face data.
            return f;
        }
        // textureOffset auto-unwrap (standard MC box layout).
        double[] off = arr(b.get("textureOffset"));
        double u = off != null ? off[0] : 0, v = off != null && off.length > 1 ? off[1] : 0;
        // rects: x, y, w, h
        f[CemBox.UP]    = new FaceUV(u + d,           v,       w, d, 0, true);
        f[CemBox.DOWN]  = new FaceUV(u + d + w,       v,       w, d, 0, true);
        f[CemBox.EAST]  = new FaceUV(u,               v + d,   d, h, 0, true);
        f[CemBox.NORTH] = new FaceUV(u + d,           v + d,   w, h, 0, true);
        f[CemBox.WEST]  = new FaceUV(u + d + w,       v + d,   d, h, 0, true);
        f[CemBox.SOUTH] = new FaceUV(u + d + w + d,   v + d,   w, h, 0, true);
        return f;
    }

    private FaceUV faceUv(JsonNode b, String key) {
        double[] uv = arr(b.get(key));
        if (uv == null || uv.length < 4) return FaceUV.DISABLED;
        if (uv[0] == 0 && uv[1] == 0 && uv[2] == 0 && uv[3] == 0) return FaceUV.DISABLED;
        return FaceUV.fromBbUv(uv, 0);
    }

    private boolean[] invert(JsonNode node) {
        String a = node.path("invertAxis").asText("");
        return new boolean[]{ a.contains("x"), a.contains("y"), a.contains("z") };
    }

    private boolean mirror(JsonNode node) {
        String m = node.path("mirrorTexture").asText("");
        return m.contains("u");
    }

    private double[] arr(JsonNode n) {
        if (n == null || !n.isArray()) return null;
        double[] a = new double[n.size()];
        for (int i = 0; i < n.size(); i++) a[i] = n.get(i).asDouble();
        return a;
    }
}
