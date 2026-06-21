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

            PlayerModel.Bone bone = elementBone.get(en.getKey());
            if (bone == null) bone = PlayerModel.boneAt(center); // fallback by region
            if (bone == null) { ignored++; continue; }            // outside every bone -> ignore

            if (bone.isBaseCube(from, to, 0.5)) {
                // matches a vanilla base cube; only count it as a modification if it differs
                if (!bone.isBaseCube(from, to, EPS)) modBoxes.computeIfAbsent(bone, k -> new ArrayList<>()).add(toBox(el, from, to, bone));
                continue; // unchanged base -> skip
            }
            cosmeticBoxes.computeIfAbsent(bone, k -> new ArrayList<>()).add(toBox(el, from, to, bone));
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

    /** Element -> CemBox, localized to the bone (subtract the bone pivot). */
    private CemBox toBox(JsonNode el, Vec3 from, Vec3 to, PlayerModel.Bone bone) {
        double inflate = el.path("inflate").asDouble(0.0);
        Vec3 center = from.mid(to).sub(bone.pivot);
        Vec3 half = from.halfExtent(to).add(new Vec3(inflate, inflate, inflate));
        Vec3 rotation = vec(el.get("rotation"));
        if (rotation == null) rotation = new Vec3(0, 0, 0);
        Vec3 origin = vec(el.get("origin"));
        Vec3 pivot = origin == null ? new Vec3(0, 0, 0) : origin.sub(bone.pivot).sub(center);

        FaceUV[] f = new FaceUV[6];
        JsonNode faces = el.get("faces");
        f[CemBox.DOWN]  = face(faces, "down");
        f[CemBox.UP]    = face(faces, "up");
        f[CemBox.NORTH] = face(faces, "north");
        f[CemBox.EAST]  = face(faces, "east");
        f[CemBox.SOUTH] = face(faces, "south");
        f[CemBox.WEST]  = face(faces, "west");
        return new CemBox(center, half, rotation, pivot, false, f);
    }

    private void walkOutliner(JsonNode node, PlayerModel.Bone current, Map<String, PlayerModel.Bone> out) {
        for (JsonNode child : node) {
            if (child.isTextual()) {
                if (current != null) out.put(child.asText(), current);
            } else if (child.isObject()) {
                PlayerModel.Bone b = PlayerModel.bone(child.path("name").asText(""));
                PlayerModel.Bone use = b != null ? b : current; // inherit parent bone if subgroup
                JsonNode children = child.get("children");
                if (children != null) walkOutliner(children, use, out);
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
