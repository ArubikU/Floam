package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker;
import dev.arubiku.floamy3d.pipeline.texture.EquipmentWriter;
import org.junit.jupiter.api.Test;

import javax.imageio.ImageIO;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

/**
 * Produces real, inspectable demo artifacts under build/demos/ from the repo's own assets:
 *  - armor:    real Licorne fenrir JEMs + layer PNGs -> armor.glsl + color atlas + equipment json
 *  - cosmetic: an elf-ears bbmodel -> generated registry (detect/model/defines + per-cosmetic files)
 */
class DemoGenTest {

    private static final String EARS = """
        { "name":"elf_ears", "resolution":{"width":64,"height":64},
          "elements":[ { "type":"cube","from":[6,8,4],"to":[10,11,4],"origin":[8,8,8],"rotation":[0,0,30],
            "faces":{ "north":{"uv":[3,5,8,3]}, "south":{"uv":[3,5,8,3]}, "east":{"uv":[3,5,8,3]},
                      "west":{"uv":[3,5,8,3]}, "up":{"uv":[3,5,8,3]}, "down":{"uv":[3,5,8,3]} } } ] }
        """;

    @Test
    void cosmeticDemo() throws Exception {
        Path inc = Path.of("build/demos/elf_ears/assets/minecraft/shaders/include");
        Files.createDirectories(inc);
        CemModel ears = new BbModelParser().parse(EARS, "elf_ears", Part.HEAD);
        Registry reg = new Registry();
        reg.register(ears);
        reg.writeAll(inc);

        assertTrue(Files.exists(inc.resolve("floamy/cosmetics/elf_ears/model.glsl")));
        assertTrue(Files.readString(inc.resolve("floamy/registry/defines.glsl")).contains("CEM_ELF_EARS"));
    }

    @Test
    void armorDemo() throws Exception {
        File dir = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir");
        File l1 = new File(dir, "layer_1.jem");
        assumeTrue(l1.exists(), "real armor assets not in this checkout");

        Path out = Path.of("build/demos/fenrir/assets");
        Files.createDirectories(out);

        int[] internal = {0, 180, 0};
        int[] color = {255, 4, 255};
        String glsl = new ArmorGenerator().generate("licorn_fenrir", internal, l1, new File(dir, "layer_2.jem"));
        Files.writeString(Path.of("build/demos/fenrir/armor.glsl"), glsl);

        File p1 = new File(dir, "layer_1.png"), p2 = new File(dir, "layer_2.png");
        if (p1.exists()) {
            var baker = new ColorAtlasBaker();
            var entry = new ColorAtlasBaker.Entry("licorn_fenrir", color, internal,
                    ColorAtlasBaker.read(p1), p2.exists() ? ColorAtlasBaker.read(p2) : null);
            var res = baker.bakeColorAtlas(List.of(entry));
            Files.writeString(Path.of("build/demos/fenrir/armorcords.glsl"), res.armorcordsGlsl);
            var armorTex = out.resolve("minecraft/textures/models/armor");
            Files.createDirectories(armorTex);
            ImageIO.write(res.layer1Atlas, "png", armorTex.resolve("leather_layer_1.png").toFile());
            ImageIO.write(res.layer2Atlas, "png", armorTex.resolve("leather_layer_2.png").toFile());
            new EquipmentWriter().write(out, "minecraft", "licorn_fenrir", p2.exists());
        }

        assertTrue(glsl.contains("CEM_LICORN_FENRIR_CHESTPLATE"));
        assertTrue(Files.exists(Path.of("build/demos/fenrir/armorcords.glsl")));
    }
}
