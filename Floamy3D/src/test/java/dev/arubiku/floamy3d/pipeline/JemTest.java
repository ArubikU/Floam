package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.glsl.GlslEmitter;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class JemTest {

    // Subset of a real Floam armor layer_1.jem (Cassuto): body with a rotated submodel,
    // plus left/right arms exercising mirrorTexture.
    private static final String JEM = """
        {
          "textureSize": [64, 32],
          "models": [
            {
              "part": "body", "id": "body", "invertAxis": "xy", "translate": [0, -24, 0],
              "boxes": [
                { "coordinates": [-4, 17, -3, 8, 2, 6], "textureOffset": [0, 0], "sizeAdd": 0.025 }
              ],
              "submodels": [
                {
                  "id": "bone", "invertAxis": "xy", "translate": [0, 25, -3.525], "rotate": [0, 0, 45],
                  "boxes": [ { "coordinates": [-6, -6, -0.5, 11, 11, 1], "uvNorth": [37,9,48,20] } ]
                }
              ]
            },
            {
              "part": "left_arm", "id": "left_arm", "invertAxis": "xy", "mirrorTexture": "u", "translate": [5, -22, 0],
              "boxes": [ { "coordinates": [-8, 12, -2, 4, 13, 4], "textureOffset": [19, 15] } ]
            },
            {
              "part": "right_arm", "id": "right_arm", "invertAxis": "xy", "translate": [-5, -22, 0],
              "boxes": [ { "coordinates": [4, 12, -2, 4, 13, 4], "textureOffset": [19, 15] } ]
            }
          ]
        }
        """;

    @Test
    void parsesPartsSubmodelsMirror() throws Exception {
        List<CemModel> models = new JemParser().parse(JEM);
        assertEquals(3, models.size());

        CemModel body = find(models, "BODY");
        assertEquals(Part.BODY, body.part);
        assertEquals(2, body.boxes.size(), "1 box + 1 flattened submodel box");
        // the submodel box carries the 45-deg Z rotate as a baked composed matrix
        assertTrue(body.boxes.stream().anyMatch(b -> b.hasMatrix()));

        CemModel left = find(models, "LEFT_ARM");
        CemModel right = find(models, "RIGHT_ARM");
        assertTrue(left.boxes.get(0).mirror, "left arm mirrorTexture u -> mirror");
        assertFalse(right.boxes.get(0).mirror, "right arm no mirror");

        // emitter turns the rotated submodel box into a rotate-capable macro with a Z rotation
        String glsl = new GlslEmitter().modelCase(body);
        assertTrue(glsl.contains("ADD_BOX_ROTATE_FULL"), glsl);
        assertTrue(glsl.contains("mat3("), glsl); // baked composed rotation (45deg Z submodel)
    }

    private CemModel find(List<CemModel> models, String id) {
        Optional<CemModel> m = models.stream().filter(x -> x.id.equals(id)).findFirst();
        assertTrue(m.isPresent(), "missing " + id);
        return m.get();
    }
}
