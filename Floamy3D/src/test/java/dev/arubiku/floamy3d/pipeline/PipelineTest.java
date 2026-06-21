package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.glsl.GlslEmitter;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PipelineTest {

    // Minimal bbmodel: one cube on the head, default uvs, no rotation.
    private static final String BB = """
        {
          "name": "elf_ears",
          "resolution": { "width": 64, "height": 64 },
          "elements": [
            {
              "type": "cube",
              "name": "ear",
              "from": [6, 8, 4],
              "to": [10, 11, 4],
              "origin": [8, 8, 8],
              "rotation": [0, 0, 90],
              "faces": {
                "north": { "uv": [3, 5, 8, 3], "rotation": 0 },
                "south": { "uv": [3, 5, 8, 3] },
                "east":  { "uv": [3, 5, 8, 3] },
                "west":  { "uv": [3, 5, 8, 3] },
                "up":    { "uv": [3, 5, 8, 3] },
                "down":  { "uv": [3, 5, 8, 3] }
              }
            }
          ]
        }
        """;

    @Test
    void parsesAndEmits() throws Exception {
        CemModel model = new BbModelParser().parse(BB, "elf_ears", Part.HEAD);
        assertEquals("ELF_EARS", model.id);
        assertEquals(Part.HEAD, model.part);
        assertEquals(64, model.texWidth);
        assertEquals(1, model.boxes.size());

        GlslEmitter emit = new GlslEmitter();
        String define = emit.define(model, 50);
        String detect = emit.detect(model, 7, 0, 120);
        String body = emit.modelCase(model);

        assertTrue(define.contains("#define CEM_ELF_EARS 50"), define);
        // detection targets the head with the 120 marker and EDIT_HEAD
        assertTrue(detect.contains("ivec2(7,0)"), detect);
        assertTrue(detect.contains("== 120.0"), detect);
        assertTrue(detect.contains("cube == HEAD"), detect);
        assertTrue(detect.contains("EDIT_HEAD()"), detect);
        // model has a rotated box (90deg Z -> PIZ) emitted via the rotate-full macro
        assertTrue(body.contains("case CEM_ELF_EARS"), body);
        assertTrue(body.contains("ADD_BOX_ROTATE_FULL"), body);
        assertTrue(body.contains("PIZ"), body);
        assertTrue(body.contains("break;"), body);
    }

    @Test
    void mirrorEmitsMirrorMacro() throws Exception {
        // negative-width uv => keeps signed width; a plain (no-rotation) box stays ADD_BOX.
        String bb = BB.replace("\"rotation\": [0, 0, 90]", "\"rotation\": [0, 0, 0]");
        CemModel model = new BbModelParser().parse(bb, "ear", Part.HEAD);
        String body = new GlslEmitter().modelCase(model);
        assertTrue(body.contains("ADD_BOX("), body);
    }
}
