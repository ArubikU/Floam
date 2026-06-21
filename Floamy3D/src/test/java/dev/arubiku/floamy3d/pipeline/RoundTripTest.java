package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.glsl.GlslEmitter;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

/**
 * Faithfulness check: a model fed through the pipeline must come out geometrically identical.
 * Parse JEM -> CemModel -> emit GLSL -> parse the emitted boxes back -> assert positions/sizes
 * match the CemModel. This proves the generator is lossless for whatever model you give it
 * (the right validation, since the repo's hand-tuned armor.glsl files are NOT mechanical baselines).
 */
class RoundTripTest {

    private static final Pattern BOX = Pattern.compile(
            "ADD_BOX[A-Z_]*\\(\\s*vec3\\(([^)]*)\\)\\s*,\\s*vec3\\(([^)]*)\\)(\\*[0-9.]+)?", Pattern.DOTALL);

    @Test
    void jemRoundTripIsLossless() throws Exception {
        File jem = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir/layer_1.jem");
        assumeTrue(jem.exists(), "real jem not present");

        // raw parse (no base transform / scale) so emitted numbers equal the model numbers
        List<CemModel> models = new JemParser().parse(jem);
        GlslEmitter emit = new GlslEmitter();

        int totalBoxes = 0, matched = 0;
        for (CemModel m : models) {
            if (m.boxes.isEmpty()) continue;
            String glsl = emit.modelCase(m);
            List<double[]> emitted = parsePosSize(glsl);
            assertEquals(m.boxes.size(), emitted.size(),
                    "emitted box count must equal model box count for " + m.id);

            for (int i = 0; i < m.boxes.size(); i++) {
                CemBox b = m.boxes.get(i);
                double[] e = emitted.get(i);
                assertEquals(b.center.x, e[0], 1e-3, "pos.x " + m.id + "#" + i);
                assertEquals(b.center.y, e[1], 1e-3, "pos.y " + m.id + "#" + i);
                assertEquals(b.center.z, e[2], 1e-3, "pos.z " + m.id + "#" + i);
                assertEquals(b.half.x, e[3], 1e-3, "size.x " + m.id + "#" + i);
                assertEquals(b.half.y, e[4], 1e-3, "size.y " + m.id + "#" + i);
                assertEquals(b.half.z, e[5], 1e-3, "size.z " + m.id + "#" + i);
                matched++;
            }
            totalBoxes += m.boxes.size();
        }
        assertTrue(totalBoxes > 0);
        assertEquals(totalBoxes, matched, "every box round-trips losslessly");
        System.out.printf("RoundTrip: %d boxes across %d parts, 100%% lossless%n", totalBoxes, models.size());
    }

    private List<double[]> parsePosSize(String glsl) {
        List<double[]> out = new java.util.ArrayList<>();
        Matcher m = BOX.matcher(glsl);
        while (m.find()) {
            double[] pos = nums(m.group(1));
            double[] size = nums(m.group(2));
            double scale = m.group(3) != null ? Double.parseDouble(m.group(3).substring(1)) : 1.0;
            out.add(new double[]{pos[0], pos[1], pos[2], size[0]*scale, size[1]*scale, size[2]*scale});
        }
        return out;
    }

    private double[] nums(String csv) {
        String[] p = csv.split(",");
        double[] d = new double[3];
        for (int i = 0; i < 3 && i < p.length; i++) d[i] = Double.parseDouble(p[i].trim());
        return d;
    }
}
