package dev.arubiku.floamy3d.pipeline;

import org.junit.jupiter.api.Test;

import java.io.File;

import static org.junit.jupiter.api.Assumptions.assumeTrue;
import static org.junit.jupiter.api.Assertions.*;

class ArmorGeneratorTest {

    // real field-truth pair shipped in the repo
    private static final File DIR = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir");

    @Test
    void generatesArmorGlslFromRealJems() throws Exception {
        File l1 = new File(DIR, "layer_1.jem");
        File l2 = new File(DIR, "layer_2.jem");
        assumeTrue(l1.exists(), "real jem not present in this checkout");

        String glsl = new ArmorGenerator().generate("licorn_fenrir", new int[]{0, 180, 0}, l1, l2);
        java.nio.file.Files.writeString(java.nio.file.Path.of("build/dbg_armor.glsl"), glsl);

        // detection block guarded by internal-color, mapping STASIS slots
        assertTrue(glsl.contains("RVC_0 == 0 && RVC_1 == 180 && RVC_2 == 0"), glsl.substring(0, 200));
        assertTrue(glsl.contains("cube == STASIS_CHESTPLATE"));
        assertTrue(glsl.contains("addCem(cems, CEM_LICORN_FENRIR_CHESTPLATE)"));
        // fragment cases in atlas mode with the base transform
        assertTrue(glsl.contains("case CEM_LICORN_FENRIR_CHESTPLATE"));
        assertTrue(glsl.contains("relativeUv("), "armor must use atlas UV");
        assertTrue(glsl.contains("PIX"), "armor boxes carry the JEM->CEM base rotation");
        // inner armor came from layer_2
        assertTrue(glsl.contains("CEM_LICORN_FENRIR_INNER_ARMOR"));
    }
}
