package dev.arubiku.floamy3d.render;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.*;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

/**
 * Offline render validation — no Minecraft. Builds the same JEM two independent ways:
 *  A) a reference walk of the raw JEM (own scene-graph, direct world placement),
 *  B) the production pipeline (JemParser -> CemModel -> reconstruct how the shader macro places
 *     each box: world = (PIX·rotMatrix)·emitPos), exercising the emitter's Rᵀ pre-rotation.
 * Then ray-casts both to occupancy masks (front/side/top) and asserts high silhouette IoU.
 * If the emitter's transform/transpose/order were wrong, B would diverge from A.
 */
class RenderEquivalenceTest {

    private static final Mat3 PIX = Mat3.rotation(0, Math.PI / 2); // armor base transform
    private static final double SCALE = 0.75;
    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Test
    void emittedMatchesIndependentReference() throws Exception {
        File jem = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir/layer_1.jem");
        assumeTrue(jem.exists(), "real jem not present");

        List<OrientedBox> ref = referenceBoxes(MAPPER.readTree(jem));
        List<OrientedBox> mine = emittedBoxes(jem);
        assertEquals(ref.size(), mine.size(), "same box count");
        assertFalse(ref.isEmpty());

        SoftwareRenderer r = new SoftwareRenderer(56);
        for (SoftwareRenderer.View v : SoftwareRenderer.View.values()) {
            double iou = SoftwareRenderer.iou(r.render(ref, v), r.render(mine, v));
            System.out.printf("view %-5s IoU=%.3f%n", v, iou);
            assertTrue(iou > 0.97, v + " silhouette IoU too low: " + iou);
        }
    }

    // --- B) production pipeline -> world boxes as the shader macro places them ---
    private List<OrientedBox> emittedBoxes(File jem) throws Exception {
        List<OrientedBox> out = new ArrayList<>();
        for (CemModel m : JemParser.forArmor().parse(jem)) {
            for (CemBox b : m.boxes) {
                Mat3 base = b.hasBaseRotation() ? PIX : Mat3.identity();
                Mat3 rm = b.rotMatrix != null ? b.rotMatrix : Mat3.identity();
                Mat3 R = base.mul(rm);
                Vec3 worldCenter = R.mul(b.center);                 // R·(Rᵀ·worldCenter) = worldCenter
                Vec3 half = b.half.mul(b.scale);
                out.add(new OrientedBox(worldCenter, half, R));
            }
        }
        return out;
    }

    // --- A) independent reference walk of the raw JEM ---
    private List<OrientedBox> referenceBoxes(JsonNode root) {
        List<OrientedBox> out = new ArrayList<>();
        JsonNode models = root.get("models");
        if (models == null) return out;
        for (JsonNode part : models) {
            Vec3 t = vec(part.get("translate"));
            walk(part, t, Mat3.identity(), out);
        }
        return out;
    }

    private void walk(JsonNode node, Vec3 pos, Mat3 rot, List<OrientedBox> out) {
        JsonNode boxes = node.get("boxes");
        if (boxes != null) for (JsonNode b : boxes) {
            double[] c = arr(b.get("coordinates"));
            if (c == null || c.length < 6) continue;
            double add = b.path("sizeAdd").asDouble(0);
            Vec3 local = new Vec3(c[0] + c[3] / 2, c[1] + c[4] / 2, c[2] + c[5] / 2);
            Vec3 worldJem = pos.add(rot.mul(local));
            Mat3 R = PIX.mul(rot);
            Vec3 center = PIX.mul(worldJem);
            Vec3 half = new Vec3(c[3] / 2 + add, c[4] / 2 + add, c[5] / 2 + add).mul(SCALE);
            out.add(new OrientedBox(center, half, R));
        }
        JsonNode subs = node.get("submodels");
        if (subs != null) for (JsonNode s : subs) {
            Vec3 childPos = pos.add(rot.mul(vec(s.get("translate"))));
            Mat3 childRot = rot.mul(Mat3.euler(vec(s.get("rotate"))));
            walk(s, childPos, childRot, out);
        }
    }

    private Vec3 vec(JsonNode n) {
        double[] a = arr(n);
        return a == null ? new Vec3(0, 0, 0) : new Vec3(a[0], a[1], a.length > 2 ? a[2] : 0);
    }
    private double[] arr(JsonNode n) {
        if (n == null || !n.isArray()) return null;
        double[] a = new double[n.size()];
        for (int i = 0; i < n.size(); i++) a[i] = n.get(i).asDouble();
        return a;
    }
}
