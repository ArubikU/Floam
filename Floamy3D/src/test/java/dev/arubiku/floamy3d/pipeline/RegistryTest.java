package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

class RegistryTest {

    private static final String BB = """
        { "name": "elf_ears", "resolution": {"width":64,"height":64},
          "elements": [ { "type":"cube","name":"ear","from":[6,8,4],"to":[10,11,4],
            "origin":[8,8,8],"faces":{ "north":{"uv":[3,5,8,3]} } } ] }
        """;

    @Test
    void registersAndWritesRouters(@TempDir Path tmp) throws Exception {
        CemModel ears = new BbModelParser().parse(BB, "elf_ears", Part.HEAD);
        Registry reg = new Registry();
        Registry.Entry e = reg.register(ears);

        assertEquals(50, e.cemNumber, "first cem id starts at 50");
        assertEquals(8, e.markerX);   // head marker pixel
        assertEquals(0, e.markerY);
        assertFalse(e.markerValue == 120 || e.markerValue == 252, "must avoid reserved marker values");

        Path inc = tmp.resolve("assets/minecraft/shaders/include");
        Files.createDirectories(inc);
        reg.writeAll(inc);

        Path dir = inc.resolve("floamy/cosmetics/elf_ears");
        assertTrue(Files.exists(dir.resolve("detect.glsl")));
        assertTrue(Files.exists(dir.resolve("model.glsl")));
        assertTrue(Files.readString(dir.resolve("detect.glsl")).contains("getChannel(ivec2(8,0)"));

        String defines = Files.readString(inc.resolve("floamy/registry/defines.glsl"));
        String detect = Files.readString(inc.resolve("floamy/registry/detect.glsl"));
        String model = Files.readString(inc.resolve("floamy/registry/model.glsl"));
        assertTrue(defines.contains("#define CEM_ELF_EARS 50"));
        assertTrue(detect.contains("#moj_import <floamy/cosmetics/elf_ears/detect.glsl>"));
        assertTrue(model.contains("#moj_import <floamy/cosmetics/elf_ears/model.glsl>"));
    }
}
