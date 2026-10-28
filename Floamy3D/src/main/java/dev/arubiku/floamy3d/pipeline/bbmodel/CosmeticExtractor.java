package dev.arubiku.floamy3d.pipeline.bbmodel;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.arubiku.floamy3d.pipeline.model.*;
import dev.arubiku.floamy3d.pipeline.player.PlayerModel;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Extracts cosmetics + player modifications from a bbmodel authored on the standard player
 * template (see {@link PlayerModel}):
 *  - extra cubes inside a vanilla bone group  -> cosmetic geometry for that bone (localized to it)
 *  - a changed base cube                       -> player modification (override) for that bone
 *  - cubes outside every bone                  -> ignored
 *
 * Returns one {@link CemModel} per bone that gained geometry, attached to that bone's part.
 */
public final class CosmeticExtractor {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private static final double EPS = 0.01;

    public static final class Result {
        public final List<CemModel> cosmetics = new ArrayList<>();
        public final List<CemModel> modifications = new ArrayList<>();
        public final int ignored;
        Result(int ignored) { this.ignored = ignored; }
    }

    public Result extract(File bbmodel, String id) throws IOException {
        return extract(MAPPER.readTree(bbmodel), id);
    }

    public Result extract(JsonNode root, String id) {
        int texW = 64, texH = 64;
        JsonNode res = root.get("resolution");
        if (res != null) { texW = res.path("width").asInt(64); texH = res.path("height").asInt(64); }

        // index elements by uuid
        Map<String, JsonNode> byUuid = new HashMap<>();
        JsonNode elements = root.get("elements");
        if (elements != null) for (JsonNode e : elements) byUuid.put(e.path("uuid").asText(), e);

        // Modern Blockbench stores group metadata (name/rotation/origin) in a SEPARATE top-level
        // "groups" array keyed by uuid; the outliner only holds the uuid hierarchy. Index it so
        // walkOutliner can resolve a group's rotation/pivot (older files inline it — handled too).
        groupMeta.clear();
        JsonNode groups = root.get("groups");
        if (groups != null) for (JsonNode g : groups) groupMeta.put(g.path("uuid").asText(), g);

        // map each element uuid -> bone (via the outliner group it lives under)
        Map<String, PlayerModel.Bone> elementBone = new HashMap<>();
        JsonNode outliner = root.get("outliner");
        if (outliner != null) walkOutliner(outliner, null, elementBone);

        // bucket extras per bone; count ignored / modifications
        Map<PlayerModel.Bone, List<CemBox>> cosmeticBoxes = new LinkedHashMap<>();
        Map<PlayerModel.Bone, List<CemBox>> modBoxes = new LinkedHashMap<>();
        int ignored = 0;

        for (Map.Entry<String, JsonNode> en : byUuid.entrySet()) {
            JsonNode el = en.getValue();
            if (el.has("type") && !"cube".equals(el.path("type").asText("cube"))) { ignored++; continue; }
            Vec3 from = vec(el.get("from")), to = vec(el.get("to"));
            if (from == null || to == null) { ignored++; continue; }
            Vec3 center = from.mid(to);

            // Default player template cube? Ignore it (model authored ON the template; keep only ADDED geo).
            PlayerModel.Bone baseBone = PlayerModel.boneAt(center);
            String gName = groupName.getOrDefault(en.getKey(), "");
            if (baseBone != null && baseBone.isBaseCube(from, to, 0.5)) {
                if (!baseBone.isBaseCube(from, to, EPS)) {
                    Vec3 gr0 = groupRot.get(en.getKey()), gp0 = groupPivot.get(en.getKey());
                    CemBox mb = toBox(el, from, to, baseBone, gr0, gp0); mb.name = gName;
                    mb.emissive = CemBox.parseEmissive(gName); mb.transparency = CemBox.parseTransparency(gName);
                    modBoxes.computeIfAbsent(baseBone, k -> new ArrayList<>()).add(mb);
                }
                continue; // unchanged default cube -> skip
            }

            // Added cosmetic geometry. Named group -> its bone; unnamed group -> default BODY
            // (capes/back items hang off body; a spatial guess sends a long cape to a leg).
            PlayerModel.Bone bone = elementBone.get(en.getKey());
            if (bone == null) bone = PlayerModel.BONES.get("body");
            Vec3 gRot = groupRot.get(en.getKey()), gPivot = groupPivot.get(en.getKey());
            CemBox cb = toBox(el, from, to, bone, gRot, gPivot); cb.name = gName;
            cb.emissive = CemBox.parseEmissive(gName); cb.transparency = CemBox.parseTransparency(gName);
            cosmeticBoxes.computeIfAbsent(bone, k -> new ArrayList<>()).add(cb);
        }

        Result r = new Result(ignored);
        for (var en : cosmeticBoxes.entrySet()) r.cosmetics.add(model(id, en.getKey(), en.getValue(), texW, texH));
        for (var en : modBoxes.entrySet()) r.modifications.add(model(id + "_MOD", en.getKey(), en.getValue(), texW, texH));
        return r;
    }

    private CemModel model(String id, PlayerModel.Bone bone, List<CemBox> boxes, int texW, int texH) {
        CemModel m = new CemModel(id + "_" + bone.name, bone.part, texW, texH);
        m.kind = CemModel.Kind.COSMETIC;
        m.sourcePart = bone.name;
        m.boxes.addAll(boxes);
        return m;
    }

    /** Element -> CemBox, localized to the bone (subtract the bone pivot), with the group's rotation
     *  baked in (Blockbench groups rotate children around their origin). */
    private CemBox toBox(JsonNode el, Vec3 from, Vec3 to, PlayerModel.Bone bone, Vec3 gRot, Vec3 gPivot) {
        double inflate = el.path("inflate").asDouble(0.0);
        Vec3 worldCenter = from.mid(to);
        Vec3 rotation = vec(el.get("rotation"));
        if (rotation == null) rotation = new Vec3(0, 0, 0);
        boolean hasGroup = gRot != null && !(gRot.x == 0 && gRot.y == 0 && gRot.z == 0);
        Vec3 center = worldCenter.sub(bone.pivot);
        Vec3 half = from.halfExtent(to).add(new Vec3(inflate, inflate, inflate));
        Vec3 origin = vec(el.get("origin"));
        // Do NOT bake the group rotation into the position. Keep the box at its REST position; the orbit
        // pivot (group pivot, or the cube origin for non-grouped) is stored and turned into a rotPivot +
        // conjugated rotation matrix in applyJpToCosmetic. This keeps positions exact AND lets `animate`
        // swing the WHOLE bone around its pivot (a single euler bake can't do runtime bone rotation).
        Vec3 pivot = new Vec3(0, 0, 0);
        Vec3 groupPivot;
        Vec3 groupRot = new Vec3(0, 0, 0);
        if (hasGroup && gPivot != null) {
            groupRot = gRot;                               // ORBITS the group pivot (kept out of `rotation`)
            groupPivot = gPivot.sub(bone.pivot);           // orbit the group pivot
        } else {
            groupPivot = origin == null ? center : origin.sub(bone.pivot);   // cube origin, else centre
        }
        // `rotation` stays the cube's OWN euler only (in-place around its centre/origin).

        FaceUV[] f = new FaceUV[6];
        JsonNode faces = el.get("faces");
        f[CemBox.DOWN]  = face(faces, "down");
        f[CemBox.UP]    = face(faces, "up");
        f[CemBox.NORTH] = face(faces, "north");
        f[CemBox.EAST]  = face(faces, "east");
        f[CemBox.SOUTH] = face(faces, "south");
        f[CemBox.WEST]  = face(faces, "west");
        CemBox box = new CemBox(center, half, rotation, pivot, false, f);
        box.name = el.path("name").asText("");
        box.groupPivot = groupPivot;
        box.groupRot = groupRot;   // group/bone euler (e.g. -12.5 X) -> folded into R + orbits groupPivot
        return box;
    }

    // accumulated group transform per element (Blockbench groups rotate their children around their origin).
    private final Map<String, Vec3> groupRot = new HashMap<>();    // accumulated euler (deg)
    private final Map<String, Vec3> groupPivot = new HashMap<>();  // the rotated group's origin (model space)
    private final Map<String, String> groupName = new HashMap<>(); // deepest containing group/bone name (for `submatch`)
    private final Map<String, JsonNode> groupMeta = new HashMap<>(); // uuid -> group node (name/rotation/origin)

    private void walkOutliner(JsonNode node, PlayerModel.Bone current, Map<String, PlayerModel.Bone> out) {
        walkOutliner(node, current, new Vec3(0, 0, 0), null, "", out);
    }
    private void walkOutliner(JsonNode node, PlayerModel.Bone current, Vec3 curRot, Vec3 curPivot, String curGroup, Map<String, PlayerModel.Bone> out) {
        for (JsonNode child : node) {
            if (child.isTextual()) {
                String uuid = child.asText();
                if (current != null) out.put(uuid, current);
                // record the group transform for EVERY element, even in unnamed groups (those default to
                // the body bone later) — otherwise the bone rotation/pivot is silently dropped.
                groupRot.put(uuid, curRot);
                if (curPivot != null) groupPivot.put(uuid, curPivot);
                groupName.put(uuid, curGroup);
            } else if (child.isObject()) {
                // group metadata lives in the top-level "groups" array (by uuid); fall back to inline.
                JsonNode meta = groupMeta.getOrDefault(child.path("uuid").asText(), child);
                String gname = meta.path("name").asText(child.path("name").asText(""));
                PlayerModel.Bone b = PlayerModel.bone(gname);
                PlayerModel.Bone use = b != null ? b : current; // inherit parent bone if subgroup
                // build the "/"-joined ancestor path so `submatch` can target a group's whole subtree.
                String name = gname.isEmpty() ? curGroup : (curGroup.isEmpty() ? gname : curGroup + "/" + gname);
                Vec3 gr = vec(meta.get("rotation"));
                Vec3 go = vec(meta.get("origin"));
                Vec3 nextRot = (gr != null) ? curRot.add(gr) : curRot;
                // the pivot to rotate around = this group's origin (the deepest rotated group wins)
                Vec3 nextPivot = (go != null && gr != null && !(gr.x == 0 && gr.y == 0 && gr.z == 0)) ? go : curPivot;
                JsonNode children = child.get("children");
                if (children != null) walkOutliner(children, use, nextRot, nextPivot, name, out);
            }
        }
    }

    private FaceUV face(JsonNode faces, String key) {
        if (faces == null) return FaceUV.DISABLED;
        JsonNode fn = faces.get(key);
        if (fn == null || fn.isNull()) return FaceUV.DISABLED;
        JsonNode uv = fn.get("uv");
        if (uv == null || !uv.isArray() || uv.size() < 4) return FaceUV.DISABLED;
        double[] a = {uv.get(0).asDouble(), uv.get(1).asDouble(), uv.get(2).asDouble(), uv.get(3).asDouble()};
        return FaceUV.fromBbUv(a, fn.path("rotation").asInt(0));
    }

    private Vec3 vec(JsonNode n) {
        if (n == null || !n.isArray() || n.size() < 3) return null;
        return new Vec3(n.get(0).asDouble(), n.get(1).asDouble(), n.get(2).asDouble());
    }
}
