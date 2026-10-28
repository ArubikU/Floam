package dev.arubiku.floamy3d.pipeline.pack;

import java.util.Arrays;
import java.util.List;

/**
 * Maps an engine version directory to a pack_format overlay range. One range per SHADER
 * pipeline family (not per release), newest open-ended so a single pack works forward to MC
 * 26.1 (format 84, year-based versioning) and beyond.
 *
 * Shader pipeline breakpoints (verified vs the Minecraft Wiki + CEM-S per-version cores):
 *  - 32-41  (1.20.5-1.21.1): per-rendertype core shaders under shaders/core/.
 *  - 42-54  (1.21.2-1.21.4): per-rendertype, namespaced "minecraft:core/" refs, +ModelOffset/FogShape.
 *  - 55-62  (1.21.5):        NEW pipeline — core JSON removed (RenderPipeline in-code), unified
 *                            entity.vsh/fsh + cem_user modular routers.
 *  - 63-68  (1.21.6-1.21.8): entity.vsh/fsh + namespaced <minecraft:*> imports + UBO globals, #version 150.
 *  - 69+    (1.21.9 .. 26.1=84 .. future): another break — #version 150 -> 330 (OpenGL 3.3),
 *                            minecraft_mix_light split (compute_light + mix_light_separate),
 *                            PER_FACE_LIGHTING. Formats: 1.21.9/10=69, 1.21.11=75, 26.1=84.
 *
 * (1.21.9+ packs may use min_format/max_format ranges; our supported_formats already spans them.)
 */
public enum PackVersion {
    V1_20_5("1.20.5", 32, 41),
    V1_21_2("1.21.2", 42, 54),
    V1_21_5("1.21.5", 55, 62),
    V1_21_6("1.21.6", 63, 68),
    V1_21_9("1.21.9", 69, 9999); // #version 330 era: 1.21.9/10(69), 1.21.11(75), 26.1(84), future. NOT
                                 // Integer.MAX — 3rd-party mergers (CraftEngine) reparse it as a float and fail.

    public final String dir;       // engine/<dir>
    public final int minFormat;
    public final int maxFormat;

    PackVersion(String dir, int minFormat, int maxFormat) {
        this.dir = dir;
        this.minFormat = minFormat;
        this.maxFormat = maxFormat;
    }

    /** Lowest pack_format the assembled pack declares support for. */
    public static int baseFormat() { return V1_20_5.minFormat; }

    public static List<PackVersion> all() { return Arrays.asList(values()); }
}
