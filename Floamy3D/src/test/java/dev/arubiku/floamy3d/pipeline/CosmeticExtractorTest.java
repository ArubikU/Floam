package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.CosmeticExtractor;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CosmeticExtractorTest {

    // head group with the vanilla base cube + one extra ear cube; plus a cube outside every bone.
    private static final String BB = """
        { "resolution":{"width":64,"height":64},
          "elements":[
            { "uuid":"base","type":"cube","from":[-4,24,-4],"to":[4,32,4],"faces":{"north":{"uv":[8,8,16,16]}} },
            { "uuid":"ear","type":"cube","from":[-6,30,-1],"to":[-4,33,1],"faces":{"north":{"uv":[0,0,2,3]}} },
            { "uuid":"outside","type":"cube","from":[20,20,20],"to":[22,22,22],"faces":{"north":{"uv":[0,0,2,2]}} }
          ],
          "outliner":[ { "name":"head","children":["base","ear"] }, "outside" ] }
        """;

    @Test
    void extractsExtrasIgnoresOutsideSkipsBase() throws Exception {
        CosmeticExtractor.Result r = new CosmeticExtractor().extract(
                new com.fasterxml.jackson.databind.ObjectMapper().readTree(BB), "EARS");

        // one cosmetic on the head, made of the single extra ear cube (base skipped, outside ignored)
        assertEquals(1, r.cosmetics.size(), "one bone gained geometry");
        CemModel head = r.cosmetics.get(0);
        assertEquals(Part.HEAD, head.part);
        assertEquals(1, head.boxes.size(), "only the extra ear, not the base cube");
        assertTrue(r.ignored >= 1, "the out-of-bone cube is ignored");

        // ear localized to the head pivot (0,24,0): centre y ~ (30+33)/2 - 24 = 7.5
        assertEquals(7.5, head.boxes.get(0).center.y, 0.01);
    }
}
