package dev.arubiku.floamy3d.pipeline.registry;

import dev.arubiku.floamy3d.pipeline.glsl.CosmeticCodec;
import dev.arubiku.floamy3d.pipeline.glsl.GlslEmitter;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

/**
 * Cosmetic registry: allocates a unique CEM id + skin marker for each cosmetic model and
 * writes the registry GLSL the engine includes.
 *
 * Output (under {@code includeDir}, i.e. assets/minecraft/shaders/include):
 *   floamy/cosmetics/&lt;id&gt;/detect.glsl   (vertex detection snippet)
 *   floamy/cosmetics/&lt;id&gt;/model.glsl    (fragment case)
 *   floamy/registry/defines.glsl            (#define CEM_&lt;id&gt; n  for all)
 *   floamy/registry/detect.glsl             (#moj_import each detect, chained)
 *   floamy/registry/model.glsl              (#moj_import each model)
 *
 * The engine's player vertex/fragment shaders import the three router files, so adding a
 * cosmetic is purely additive — no core-shader edits.
 */
public final class Registry {

    /** Marker channel values reserved by built-in MagicShaders cosmetics — never reuse. */
    private static final Set<Integer> RESERVED = new HashSet<>(Arrays.asList(120, 125, 232, 233, 250, 252, 253, 254));

    private final GlslEmitter emitter = new GlslEmitter();
    private final List<Entry> entries = new ArrayList<>();
    private int nextCem = 50;      // built-in cem ids live below 50
    private int nextValue = 100;   // marker channel value counter

    public static final class Entry {
        public final CemModel model;
        public final int cemNumber;
        public final int markerX, markerY, markerValue;
        Entry(CemModel m, int cem, int mx, int my, int mv) {
            this.model = m; this.cemNumber = cem; this.markerX = mx; this.markerY = my; this.markerValue = mv;
        }
    }

    /** Register a cosmetic model, allocating its CEM id + marker pixel/value. */
    public Entry register(CemModel model) {
        int[] px = markerPixel(model.part);
        int value = nextMarkerValue();
        Entry e = new Entry(model, nextCem++, px[0], px[1], value);
        entries.add(e);
        return e;
    }

    public List<Entry> entries() { return Collections.unmodifiableList(entries); }

    /** Write per-cosmetic files + router files under the resourcepack include dir. */
    public void writeAll(Path includeDir) throws IOException {
        Path cosmetics = includeDir.resolve("floamy/cosmetics");
        Path registry = includeDir.resolve("floamy/registry");
        // wipe stale generated cosmetics so removed/renamed ids don't linger (huge stale GLSL).
        if (Files.isDirectory(cosmetics)) {
            try (var s = Files.walk(cosmetics)) {
                s.sorted(java.util.Comparator.reverseOrder()).forEach(p -> { try { Files.deleteIfExists(p); } catch (IOException ignored) {} });
            }
        }
        Files.createDirectories(registry);

        StringBuilder defines = new StringBuilder("// generated — CEM ids\n");
        StringBuilder detectRouter = new StringBuilder("// generated — cosmetic detection (VSH)\n");
        CosmeticCodec codec = new CosmeticCodec();   // data-driven geometry (replaces per-model macro cases)

        for (Entry e : entries) {
            Path dir = cosmetics.resolve(e.model.id.toLowerCase(Locale.ROOT));
            Files.createDirectories(dir);
            Files.writeString(dir.resolve("detect.glsl"),
                    emitter.detect(e.model, e.markerX, e.markerY, e.markerValue));

            String id = e.model.id.toLowerCase(Locale.ROOT);
            defines.append(emitter.define(e.model, e.cemNumber));
            detectRouter.append("#moj_import <floamy/cosmetics/").append(id).append("/detect.glsl>\n");
            codec.add(e.model);
        }

        Files.writeString(registry.resolve("defines.glsl"), defines.toString());
        Files.writeString(registry.resolve("detect.glsl"), detectRouter.toString());
        // data-driven geometry array + cos_index router, consumed by floamy/cosmetics/decode.glsl
        Files.writeString(cosmetics.resolve("data.glsl"), codec.glsl());
    }

    private int nextMarkerValue() {
        while (RESERVED.contains(nextValue) || nextValue > 249) {
            nextValue++;
            if (nextValue > 249) nextValue = 100; // wrap (small registries only)
        }
        return nextValue++;
    }

    /** Default marker pixel per attach part (free skin pixels in the top rows). */
    private int[] markerPixel(Part part) {
        switch (part) {
            case HEAD: return new int[]{8, 0};
            case RIGHT_ARM: return new int[]{9, 0};
            case LEFT_ARM:  return new int[]{10, 0};
            case RIGHT_LEG: return new int[]{11, 0};
            case LEFT_LEG:  return new int[]{12, 0};
            default: return new int[]{2, 0}; // body
        }
    }
}
