package dev.arubiku.floamy3d.pipeline.bbmodel;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.FaceUV;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.io.File;
import java.io.IOException;

/**
 * Parses a Blockbench .bbmodel into a {@link CemModel}.
 *
 * Authoring convention (Floamy CEM):
 *  - Author the cosmetic/part relative to the attach part's pivot, placed at Blockbench
 *    coordinate {@code modelOrigin} (default 8,8,8 — Blockbench's centre).
 *  - +X = right, +Y = up, +Z = front. Pixel units (16 px = 1 block).
 *  - The element/group name (or an explicit hint) selects the {@link Part}.
 *
 * Cube elements + groups are supported. Meshes/animations are ignored in v1.
 */
public final class BbModelParser {
    private static final ObjectMapper MAPPER = new ObjectMapper();

    private final Vec3 modelOrigin;

    public BbModelParser() { this(new Vec3(8, 8, 8)); }
    public BbModelParser(Vec3 modelOrigin) { this.modelOrigin = modelOrigin; }

    public CemModel parse(File bbmodel, String idHint, Part partHint) throws IOException {
        return parse(MAPPER.readTree(bbmodel), idHint, partHint);
    }

    public CemModel parse(String json, String idHint, Part partHint) throws IOException {
        return parse(MAPPER.readTree(json), idHint, partHint);
    }

    public CemModel parse(JsonNode root, String idHint, Part partHint) {
        int texW = 64, texH = 64;
        JsonNode res = root.get("resolution");
        if (res != null) {
            texW = res.path("width").asInt(64);
            texH = res.path("height").asInt(64);
        }

        String name = idHint != null ? idHint : root.path("name").asText("model");
        Part part = partHint != null ? partHint : Part.fromName(detectGroupName(root, name));

        CemModel model = new CemModel(name, part, texW, texH);

        JsonNode elements = root.get("elements");
        if (elements != null && elements.isArray()) {
            for (JsonNode el : elements) {
                CemBox box = toBox(el);
                if (box != null) model.boxes.add(box);
            }
        }
        return model;
    }

    private String detectGroupName(JsonNode root, String fallback) {
        JsonNode outliner = root.get("outliner");
        if (outliner != null && outliner.isArray() && outliner.size() > 0) {
            JsonNode first = outliner.get(0);
            if (first.isObject() && first.has("name")) return first.get("name").asText(fallback);
        }
        return fallback;
    }

    private CemBox toBox(JsonNode el) {
        if (el.has("type") && !"cube".equals(el.path("type").asText("cube"))) return null; // skip meshes
        Vec3 from = vec(el.get("from"));
        Vec3 to = vec(el.get("to"));
        if (from == null || to == null) return null;

        double inflate = el.path("inflate").asDouble(0.0);
        Vec3 center = from.mid(to);
        Vec3 half = from.halfExtent(to).add(new Vec3(inflate, inflate, inflate));

        Vec3 rotation = vec(el.get("rotation"));
        if (rotation == null) rotation = new Vec3(0, 0, 0);
        Vec3 origin = vec(el.get("origin"));
        if (origin == null) origin = center;

        // map to CEM space (centre relative to the part pivot)
        Vec3 cemCenter = toCem(center);
        Vec3 cemPivot = toCem(origin).sub(cemCenter); // pivot relative to box centre

        FaceUV[] faces = new FaceUV[6];
        JsonNode f = el.get("faces");
        faces[CemBox.DOWN]  = face(f, "down");
        faces[CemBox.UP]    = face(f, "up");
        faces[CemBox.NORTH] = face(f, "north");
        faces[CemBox.EAST]  = face(f, "east");
        faces[CemBox.SOUTH] = face(f, "south");
        faces[CemBox.WEST]  = face(f, "west");

        return new CemBox(cemCenter, half, rotation, cemPivot, false, faces);
    }

    /** Blockbench -> CEM: translate by the part origin. Axis orientation preserved (+X right, +Y up, +Z front). */
    private Vec3 toCem(Vec3 v) {
        return v.sub(modelOrigin);
    }

    private FaceUV face(JsonNode facesNode, String key) {
        if (facesNode == null) return FaceUV.DISABLED;
        JsonNode fn = facesNode.get(key);
        if (fn == null || fn.isNull()) return FaceUV.DISABLED;
        JsonNode uv = fn.get("uv");
        if (uv == null || !uv.isArray() || uv.size() < 4) return FaceUV.DISABLED;
        double[] arr = { uv.get(0).asDouble(), uv.get(1).asDouble(), uv.get(2).asDouble(), uv.get(3).asDouble() };
        int rot = fn.path("rotation").asInt(0);
        return FaceUV.fromBbUv(arr, rot);
    }

    private Vec3 vec(JsonNode n) {
        if (n == null || !n.isArray() || n.size() < 3) return null;
        return new Vec3(n.get(0).asDouble(), n.get(1).asDouble(), n.get(2).asDouble());
    }
}
