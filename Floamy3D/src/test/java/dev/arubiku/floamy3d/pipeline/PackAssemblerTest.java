package dev.arubiku.floamy3d.pipeline;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.arubiku.floamy3d.pipeline.pack.PackAssembler;
import dev.arubiku.floamy3d.pipeline.pack.PackVersion;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.file.*;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class PackAssemblerTest {

    @Test
    void assemblesOverlaysAndMcmeta(@TempDir Path tmp) throws Exception {
        Path engine = tmp.resolve("engine");
        // shared base
        Path common = engine.resolve("common-pack/assets/minecraft/textures/floamy");
        Files.createDirectories(common);
        Files.writeString(common.resolve("marker.txt"), "shared");
        // one version overlay
        Path shaders = engine.resolve("1.20.5/assets/minecraft/shaders/core");
        Files.createDirectories(shaders);
        Files.writeString(shaders.resolve("entity.vsh"), "// vsh");

        Path out = tmp.resolve("out");
        List<PackVersion> present = new PackAssembler(engine).assemble(out, "test pack");

        assertEquals(List.of(PackVersion.V1_20_5), present);
        assertTrue(Files.exists(out.resolve("assets/minecraft/textures/floamy/marker.txt")));
        assertTrue(Files.exists(out.resolve("1.20.5/assets/minecraft/shaders/core/entity.vsh")));

        JsonNode meta = new ObjectMapper().readTree(out.resolve("pack.mcmeta").toFile());
        assertEquals(32, meta.path("pack").path("pack_format").asInt());
        JsonNode entry = meta.path("overlays").path("entries").get(0);
        assertEquals("1.20.5", entry.path("directory").asText());
        assertEquals(32, entry.path("formats").path("min_inclusive").asInt());

        // zip round-trips
        Path zip = tmp.resolve("pack.zip");
        PackAssembler.zip(out, zip);
        assertTrue(Files.size(zip) > 0);
    }
}
