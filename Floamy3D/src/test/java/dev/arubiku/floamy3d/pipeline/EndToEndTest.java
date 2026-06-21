package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.pack.PackAssembler;
import dev.arubiku.floamy3d.pipeline.pack.PackVersion;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/** Full chain: import cosmetic + armor -> registry/glsl -> assembled multi-version pack. */
class EndToEndTest {

    private static final String EARS = """
        { "name": "elf_ears", "resolution": {"width":64,"height":64},
          "elements": [ { "type":"cube","from":[6,8,4],"to":[10,11,4],"origin":[8,8,8],
            "rotation":[0,0,45],"faces":{ "north":{"uv":[3,5,8,3]} } } ] }
        """;

    @Test
    void importGenerateAssemble(@TempDir Path tmp) throws Exception {
        Path engine = tmp.resolve("engine");
        Path inc = engine.resolve("1.20.5/assets/minecraft/shaders/include");
        Files.createDirectories(inc.resolve("mods/armor"));
        // a core shader so the version dir is a real overlay
        Path core = engine.resolve("1.20.5/assets/minecraft/shaders/core");
        Files.createDirectories(core);
        Files.writeString(core.resolve("entity.vsh"), "// vsh");

        // 1) cosmetic -> registry
        CemModel ears = new BbModelParser().parse(EARS, "elf_ears", Part.HEAD);
        Registry reg = new Registry();
        reg.register(ears);
        reg.writeAll(inc);

        // 2) armor -> armor.glsl (from a real jem if available)
        File l1 = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir/layer_1.jem");
        if (l1.exists()) {
            String armor = new ArmorGenerator().generate("licorn_fenrir", new int[]{0, 180, 0},
                    l1, new File(l1.getParentFile(), "layer_2.jem"));
            Files.writeString(inc.resolve("mods/armor/armor.glsl"), armor);
        }

        // 3) assemble the multi-version pack
        Path out = tmp.resolve("out");
        List<PackVersion> present = new PackAssembler(engine).assemble(out, "Floamy3D e2e");
        assertEquals(List.of(PackVersion.V1_20_5), present);

        // pack carries the generated registry + cosmetic
        Path overlayInc = out.resolve("1.20.5/assets/minecraft/shaders/include");
        assertTrue(Files.readString(overlayInc.resolve("floamy/registry/detect.glsl"))
                .contains("floamy/cosmetics/elf_ears/detect.glsl"));
        assertTrue(Files.exists(overlayInc.resolve("floamy/cosmetics/elf_ears/model.glsl")));
        if (l1.exists())
            assertTrue(Files.readString(overlayInc.resolve("mods/armor/armor.glsl")).contains("CEM_LICORN_FENRIR_CHESTPLATE"));

        // zips
        Path zip = tmp.resolve("Floamy3D.zip");
        PackAssembler.zip(out, zip);
        assertTrue(Files.size(zip) > 0);
    }
}
