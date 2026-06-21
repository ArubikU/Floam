package dev.arubiku.floamy3d;

import dev.arubiku.floamy3d.pipeline.ArmorGenerator;
import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.pack.PackAssembler;
import dev.arubiku.floamy3d.pipeline.pack.PackVersion;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import dev.arubiku.floamy3d.runtime.cosmetics.CosmeticManager;
import dev.arubiku.floamy3d.runtime.cosmetics.CosmeticType;
import dev.arubiku.floamy3d.runtime.skin.*;
import org.bukkit.entity.Player;
import org.bukkit.plugin.Plugin;

import java.io.File;
import java.nio.file.Path;
import java.util.List;

/**
 * Facade that wires the offline pipeline (parse -> emit -> registry -> pack) and the runtime
 * (cosmetic wear/clear) behind a few high-level operations the commands call.
 *
 * Layout in the plugin data folder:
 *   engine/                authored shader source-of-truth (copied from the build)
 *   engine/<version>/...   per-MC-version overlays incl. generated registry
 *   armors/<id>/           armor config + layer jems
 *   output/                assembled public pack
 */
public final class Floamy3DRuntime {

    private final Plugin plugin;
    private final Path engineDir;
    private final Path outputDir;

    private Registry registry = new Registry();
    private final CosmeticManager cosmetics;
    private dev.arubiku.floamy3d.pipeline.jem.JpEngine cosmeticJp; // player-part transforms (parsers/cosmetic)

    public Floamy3DRuntime(Plugin plugin) {
        this.plugin = plugin;
        this.engineDir = plugin.getDataFolder().toPath().resolve("engine");
        this.outputDir = plugin.getDataFolder().toPath().resolve("output");

        ProfileService profile = new ProfileService();
        String mineskinKey = plugin.getConfig().getString("mineskin-api-key", "");
        MineSkinClient mineskin = new MineSkinClient(mineskinKey);
        SkinApplier applier = new BukkitSkinApplier(plugin);
        this.cosmetics = new CosmeticManager(plugin, profile, mineskin, applier);
        registerBuiltins();
    }

    /** Built-in MagicShaders cosmetics (markers per cem-shader-architecture). Cape & wings share
     *  the (0,0) marker, so wearing one warns + removes the other. */
    private void registerBuiltins() {
        cosmetics.register(new CosmeticManager.Def("cape", CosmeticType.CAPE, 0, 0, 252, 128, null));
        cosmetics.register(new CosmeticManager.Def("wings", CosmeticType.WINGS, 0, 0, 232, 128, null));
        cosmetics.register(new CosmeticManager.Def("elf_ears", CosmeticType.EARS, 7, 0, 120, 128, null));
    }

    public CosmeticManager cosmetics() { return cosmetics; }
    public Registry registry() { return registry; }

    // ---- runtime ----
    public void wear(Player player, String cosmeticId) { cosmetics.wear(player, cosmeticId); }
    public void clear(Player player) { cosmetics.clear(player); }
    public List<String> listCosmetics() {
        var ids = cosmetics.wearableIds();
        return ids.isEmpty() ? List.copyOf(cosmetics.defs().keySet()) : List.copyOf(ids);
    }

    // ---- generation ----

    /** Import a cosmetic model (.jem or .bbmodel) into the registry for a given part. */
    public int importCosmetic(File model, String id, Part part) throws Exception {
        List<CemModel> models;
        boolean jem = model.getName().toLowerCase(java.util.Locale.ROOT).endsWith(".jem");
        if (jem) {
            models = new JemParser().parsers(cosmeticJp).parse(model);
        } else {
            models = List.of(new BbModelParser().parse(model, id, part));
        }
        int n = 0;
        for (CemModel m : models) {
            if (m.boxes.isEmpty()) continue;
            // A multi-part JEM yields several models named after the part; prefix with the
            // user id so two cosmetics that both contain e.g. a "body" part don't collide.
            if (jem) m.id = CemModel.sanitize(id) + "_" + m.id;
            m.kind = CemModel.Kind.COSMETIC;
            Registry.Entry e = registry.register(m);
            var footprint = new dev.arubiku.floamy3d.pipeline.registry.OverlapDetector().footprint(m);
            cosmetics.register(new CosmeticManager.Def(
                    m.id.toLowerCase(), CosmeticType.PLAYER_PART_OVERRIDE,
                    e.markerX, e.markerY, e.markerValue, 128, null, footprint));
            n++;
        }
        // registry is UNIVERSAL: written once to the shared common-pack (lands in pack root,
        // applies to every format). Per-version dirs only carry version-specific shaders.
        Path universalInc = engineDir.resolve("common-pack/assets/minecraft/shaders/include");
        java.nio.file.Files.createDirectories(universalInc);
        registry.writeAll(universalInc);
        return n;
    }

    /** Generate armor.glsl for an armor folder containing config + layer jems. */
    public String importArmor(String id, int[] internalColor, File layer1Jem, File layer2Jem) throws Exception {
        String glsl = new ArmorGenerator().generate(id, internalColor, layer1Jem, layer2Jem);
        Path armorGlsl = plugin.getDataFolder().toPath().resolve("armors").resolve(id).resolve("armor.glsl");
        java.nio.file.Files.createDirectories(armorGlsl.getParent());
        java.nio.file.Files.writeString(armorGlsl, glsl);
        return glsl;
    }

    /**
     * Dynamic build: scan armors/ + cosmetics/ + modifications/ (loose files OR subfolders),
     * generate everything (armor.glsl + parts.glsl defines + armorcords + atlas, cosmetic registry),
     * write into the universal common-pack, then assemble + zip. This is the "load + generate
     * everything dynamically" entry point.
     */
    public List<PackVersion> buildAll() throws Exception {
        Path data = plugin.getDataFolder().toPath();
        Path inc = engineDir.resolve("common-pack/assets/minecraft/shaders/include");
        java.nio.file.Files.createDirectories(inc.resolve("mods/armor"));

        // ---- armors (DATA-DRIVEN) ----
        // The fragment shader no longer compiles a per-armor case switch. Instead every box's
        // geometry is encoded into the leather atlas (see ArmorDataCodec) and one generic loop
        // decodes+draws it. armor.glsl now holds only: VSH detection + the FSH default-case loop.
        StringBuilder vshDetect = new StringBuilder(), parts = new StringBuilder();
        StringBuilder compiledRef = new StringBuilder("// Floamy3D — reference dump of how each armor compiles (the box\n"
                + "// geometry AFTER parsers/*.jp transforms) BEFORE it is encoded into the leather\n"
                + "// atlas data region. Read-only; the shader actually decodes the texture, not this.\n\n");
        Path compiledDir = data.resolve("compiled");
        java.nio.file.Files.createDirectories(compiledDir);
        List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> dataParts = new java.util.ArrayList<>();
        List<dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker.Entry> atlas = new java.util.ArrayList<>();
        // Hot-reloadable transform scripts. Armor and cosmetics use SEPARATE algorithms/folders;
        // parsers/ root holds shared `var` globals applied to both. Reloaded every build.
        Path parsersDir = data.resolve("parsers");
        var armorJp = dev.arubiku.floamy3d.pipeline.jem.JpEngine.load(parsersDir, "armor");
        this.cosmeticJp = dev.arubiku.floamy3d.pipeline.jem.JpEngine.load(parsersDir, "cosmetic");
        ArmorGenerator ag = new ArmorGenerator().parsers(armorJp);
        int offset = 1000, armorCount = 0;
        // COLOR_ARMOR keys (color) AND marker pixels (internal) must be UNIQUE per armor —
        // two armors sharing one produce a duplicate `case` label in the vertex shader (C1215).
        java.util.Set<Integer> usedColor = new java.util.HashSet<>(), usedInternal = new java.util.HashSet<>();
        for (File dir : armorDirs(data.resolve("armors"))) {
            try {
                File cfg = firstExisting(dir, "config.yml", "config.yaml");
                if (cfg == null) continue;
                org.bukkit.configuration.file.YamlConfiguration c =
                        org.bukkit.configuration.file.YamlConfiguration.loadConfiguration(cfg);
                if (!c.getBoolean("enabled", true)) continue;
                String id = c.getString("id", dir.getName()).replace(":", "_");
                int[] internal = uniqueRgb(new int[]{c.getInt("internal-color.r"), c.getInt("internal-color.g"), c.getInt("internal-color.b")}, usedInternal);
                int[] color = uniqueRgb(new int[]{c.getInt("color.r"), c.getInt("color.g"), c.getInt("color.b")}, usedColor);
                // The software GENERATES the geometry FROM THE JEM via the parsers/*.jp algorithm —
                // it never reads a hand-made armor.glsl (that would defeat the whole purpose).
                File l1 = validJem(pick(dir, c.getString("optifine_layer_1"), "layer_1.jem", "outer_armor.jem"));
                File l2 = validJem(pick(dir, c.getString("optifine_layer_2"), "layer_2.jem", "inner_armor.jem"));
                if (l1 == null) { plugin.getLogger().warning("Floamy3D: skip armor " + dir.getName() + " (no valid jem)"); continue; }
                ag.parsers(dev.arubiku.floamy3d.pipeline.jem.JpEngine.load(parsersDir, "armor").loadMore(dir.toPath()));
                ArmorGenerator.Built b = ag.buildData(id, internal, l1, l2, offset);
                offset = b.nextOffset;
                vshDetect.append(b.vsh).append('\n');
                parts.append(b.defs);
                dataParts.addAll(b.dataParts);
                java.nio.file.Files.writeString(compiledDir.resolve(id + ".glsl"), b.reference);
                compiledRef.append(b.reference).append('\n');
                armorCount++;
                File p1 = pick(dir, c.getString("vanilla_layer_1"), "layer_1.png", "cem_layer_1.png");
                File p2 = pick(dir, c.getString("vanilla_layer_2"), "layer_2.png", "cem_layer_2.png");
                if (p1 != null)
                    atlas.add(new dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker.Entry(
                            id, color, internal,
                            dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker.read(p1),
                            p2 != null ? dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker.read(p2) : null));
            } catch (Exception ex) {
                plugin.getLogger().warning("Floamy3D: skip armor " + dir.getName() + ": " + ex.getMessage());
            }
        }
        // armor.glsl: VSH detection (imported into entity.vsh) + one FSH default-case loop that
        // decodes the box data for whatever cem id was detected (imported inside switch(cemi)).
        String armorGlsl = "#ifdef VSH\n\n" + vshDetect + "\n#endif\n\n#ifdef FSH\n"
                + "default: {\n"
                + "    int fdw, fdiy, fddy; fd_grid(fdw, fdiy, fddy);\n"
                + "    int fds, fdc; fd_index(cemi, fdw, fdiy, fds, fdc);\n"
                + "    for (int fdi = 0; fdi < fdc; fdi++) {\n"
                // LAZY READ: geometry first (8 texelFetch), intersect, and only read the 12 face pixels
                // + sample for boxes the ray actually hits closer than the current depth. Big GPU win.
                + "        vec3 _p, _s; mat3 _R;\n"
                + "        fd_box_geo(fds + fdi, fdw, fddy, _p, _s, _R);\n"
                // GUI ortho: parallel rays -> add the per-fragment billboard origin (cem_modelFrag) in the
                // tangent frame. Perspective keeps origin 0 (camera).
                + "        vec3 _ro = _R * (-center + _p * modelSize + (isGui == 1 ? cem_modelFrag * TBN : vec3(0.0)));\n"
                + "        vec3 _rd = _R * dirTBN;\n"
                + "        vec3 _sz = _s * modelSize;\n"
                + "        vec3 _nrm; vec3 _bi = boxIntersect(_ro, _rd, _sz, _nrm, true);\n"
                + "        if (_bi.z < minT) {\n"
                + "            vec4 _u, _d, _n, _w, _so, _e;\n"
                + "            fd_box_faces(fds + fdi, fdw, fddy, RelativeCords, _u, _d, _n, _w, _so, _e);\n"
                + "            color = sBoxWithRotation(_ro, _rd, _sz,\n"
                + "                    TBN * inverse(_R), color, minT, _u, _d, _n, _w, _so, _e, 2., 2., 2., 2., 2., 2., true);\n"
                + "        }\n"
                + "    }\n"
                + "    break;\n}\n#endif\n";
        java.nio.file.Files.writeString(inc.resolve("mods/armor/armor.glsl"), armorGlsl);
        java.nio.file.Files.writeString(inc.resolve("mods/armor/parts.glsl"), parts.toString());
        java.nio.file.Files.writeString(data.resolve("compiled.glsl"), compiledRef.toString());
        if (!atlas.isEmpty()) {
            var baker = new dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker();
            var res = baker.bakeColorAtlas(atlas);
            java.nio.file.Files.writeString(inc.resolve("armorcords.glsl"), res.armorcordsGlsl);
            // Expand both atlas layers with the encoded box-data region, then write them.
            baker.writeColorAtlasWithData(res, engineDir.resolve("common-pack/assets"), dataParts);
        }

        // ---- cosmetics + modifications ----
        registry = new Registry();
        int cos = 0;
        cos += scanCosmetics(data.resolve("cosmetics"), CosmeticType.PLAYER_PART_OVERRIDE);
        cos += scanCosmetics(data.resolve("modifications"), CosmeticType.PLAYER_PART_OVERRIDE);
        // configured cosmetics: any subfolder (recursive) with a config.yml = {id, permission, overlay, model, jp}
        cos += scanConfiguredCosmetics(data.resolve("cosmetics"));
        registry.writeAll(inc);

        plugin.getLogger().info("Floamy3D: generated " + armorCount + " armor(s), " + cos + " cosmetic(s)");
        return build();
    }

    private int scanCosmetics(Path dir, CosmeticType type) {
        int n = 0;
        for (File model : listModels(dir)) {
            try {
                String id = stripExt(model.getName());
                List<CemModel> models = new java.util.ArrayList<>();
                if (model.getName().toLowerCase(java.util.Locale.ROOT).endsWith(".bbmodel")) {
                    // diff against the standard player template: extras = cosmetic, base-changed =
                    // modification, outside a bone = ignored.
                    var ex = new dev.arubiku.floamy3d.pipeline.bbmodel.CosmeticExtractor().extract(model, id.toUpperCase(java.util.Locale.ROOT));
                    models.addAll(ex.cosmetics);
                    models.addAll(ex.modifications);
                } else {
                    models.addAll(new JemParser().parse(model)); // .jem -> per-part cosmetic
                    if (models.size() > 1) for (CemModel m : models) m.id = CemModel.sanitize(id) + "_" + m.id;
                    else if (!models.isEmpty()) models.get(0).id = CemModel.sanitize(id);
                }
                for (CemModel m : models) {
                    if (m.boxes.isEmpty()) continue;
                    m.kind = CemModel.Kind.COSMETIC;
                    Registry.Entry e = registry.register(m);
                    var fp = new dev.arubiku.floamy3d.pipeline.registry.OverlapDetector().footprint(m);
                    cosmetics.register(new CosmeticManager.Def(m.id.toLowerCase(java.util.Locale.ROOT),
                            type, e.markerX, e.markerY, e.markerValue, 128, null, fp));
                    n++;
                }
            } catch (Exception ex) {
                plugin.getLogger().warning("Floamy3D: failed cosmetic " + model.getName() + ": " + ex.getMessage());
            }
        }
        return n;
    }

    /** Configured cosmetics: a subfolder with config.yml {id, permission, overlay, model, jp}. The
     *  overlay texture is baked into the wearer's skin (so the geometry samples it); the marker is
     *  still auto-assigned by the registry (config never carries identifier pixels). */
    private int scanConfiguredCosmetics(Path root) {
        int n = 0;
        if (!root.toFile().isDirectory()) return n;
        java.util.List<File> configs = new java.util.ArrayList<>();
        try (var s = java.nio.file.Files.walk(root)) {
            s.filter(p -> p.getFileName().toString().equalsIgnoreCase("config.yml")).map(Path::toFile).forEach(configs::add);
        } catch (Exception ignored) {}
        for (File cfgFile : configs) {
            try {
                File folder = cfgFile.getParentFile();
                var cfg = org.bukkit.configuration.file.YamlConfiguration.loadConfiguration(cfgFile);
                String id = cfg.getString("id", folder.getName()).toLowerCase(java.util.Locale.ROOT);
                String perm = cfg.getString("permission", null);
                File modelF = new File(folder, cfg.getString("model", "model.bbmodel"));
                if (!modelF.exists()) { plugin.getLogger().warning("Floamy3D cosmetic " + id + ": missing model"); continue; }
                // ONE model -> CEM parts (one GLSL case). The extractor keeps only geometry ADDED on top
                // of the default player template (default bones are discarded), so capes stay tiny.
                var ex = new dev.arubiku.floamy3d.pipeline.bbmodel.CosmeticExtractor().extract(modelF, CemModel.sanitize(id).toUpperCase(java.util.Locale.ROOT));
                java.util.List<CemModel> models = new java.util.ArrayList<>();
                models.addAll(ex.cosmetics); models.addAll(ex.modifications);
                java.util.List<String> partIds = new java.util.ArrayList<>();
                for (CemModel m : models) {
                    if (m.boxes.isEmpty()) continue;
                    m.kind = CemModel.Kind.COSMETIC;
                    Registry.Entry e = registry.register(m);
                    var fp = new dev.arubiku.floamy3d.pipeline.registry.OverlapDetector().footprint(m);
                    String pid = m.id.toLowerCase(java.util.Locale.ROOT);
                    // part Def's overlay is null; the chosen VARIANT supplies the overlay via the group.
                    cosmetics.register(new CosmeticManager.Def(pid,
                            CosmeticType.PLAYER_PART_OVERRIDE, e.markerX, e.markerY, e.markerValue, 128, null, fp, perm));
                    partIds.add(pid); n++;
                }
                if (partIds.isEmpty()) continue;
                // variants: one wearable per texture, all sharing the SAME parts/markers (only the overlay differs).
                var vsec = cfg.getConfigurationSection("variants");
                if (vsec != null && !vsec.getKeys(false).isEmpty()) {
                    for (String sub : vsec.getKeys(false)) {
                        File tex = new File(folder, vsec.getString(sub));
                        java.awt.image.BufferedImage ov = tex.exists() ? javax.imageio.ImageIO.read(tex) : null;
                        cosmetics.registerGroup(id + "_" + sub.toLowerCase(java.util.Locale.ROOT), partIds, ov, perm);
                    }
                } else {
                    File overlayF = new File(folder, cfg.getString("overlay", "overlay.png"));
                    java.awt.image.BufferedImage ov = overlayF.exists() ? javax.imageio.ImageIO.read(overlayF) : null;
                    cosmetics.registerGroup(id, partIds, ov, perm);
                }
            } catch (Exception ex) {
                plugin.getLogger().warning("Floamy3D: failed configured cosmetic " + cfgFile.getParent() + ": " + ex.getMessage());
            }
        }
        return n;
    }

    /** Assemble the public pack from the engine source + generated content. */
    public List<PackVersion> build() throws Exception {
        List<PackVersion> v = new PackAssembler(engineDir).assemble(outputDir, "Floamy3D");
        PackAssembler.zip(outputDir, plugin.getDataFolder().toPath().resolve("Floamy3D.zip"));
        return v;
    }

    // armor entries are subfolders (config + layer jems). Also accept a flat "default" folder.
    private List<File> armorDirs(Path armors) {
        List<File> out = new java.util.ArrayList<>();
        File root = armors.toFile();
        File[] kids = root.listFiles();
        if (kids == null) return out;
        for (File f : kids) if (f.isDirectory()) out.add(f);
        return out;
    }

    // cosmetics/mods: any .jem or .bbmodel, loose or nested.
    private List<File> listModels(Path dir) {
        List<File> out = new java.util.ArrayList<>();
        if (!dir.toFile().isDirectory()) return out;
        try (var s = java.nio.file.Files.walk(dir)) {
            s.filter(java.nio.file.Files::isRegularFile).map(Path::toFile).forEach(f -> {
                String n = f.getName().toLowerCase(java.util.Locale.ROOT);
                if (n.endsWith(".jem") || n.endsWith(".bbmodel")) out.add(f);
            });
        } catch (Exception ignored) {}
        return out;
    }

    private File firstExisting(File dir, String... names) {
        for (String n : names) { File f = new File(dir, n); if (f.exists()) return f; }
        return null;
    }

    /** Ensure an (r,g,b) is unique within `used`; if taken, bump to the next free packed value. */
    private int[] uniqueRgb(int[] rgb, java.util.Set<Integer> used) {
        int pack = ((rgb[0] & 255) << 16) | ((rgb[1] & 255) << 8) | (rgb[2] & 255);
        int p = pack;
        for (int tries = 0; used.contains(p) && tries < 0x1000000; tries++)
            p = (p + 1) & 0xFFFFFF;
        used.add(p);
        if (p != pack)
            plugin.getLogger().warning("Floamy3D: color collision remapped "
                    + java.util.Arrays.toString(rgb) + " -> [" + (p>>16&255) + ", " + (p>>8&255) + ", " + (p&255) + "]");
        return new int[]{ p >> 16 & 255, p >> 8 & 255, p & 255 };
    }

    /** Returns the jem only if it looks like real JSON (guards against the null-byte corruption). */
    private File validJem(File f) {
        if (f == null || !f.isFile() || f.length() < 2) return null;
        try {
            byte[] head = new byte[8];
            try (var in = new java.io.FileInputStream(f)) { in.read(head); }
            for (byte b : head) {
                if (b == '{') return f;
                if (b != ' ' && b != '\n' && b != '\r' && b != '\t' && b != (byte) 0xEF
                        && b != (byte) 0xBB && b != (byte) 0xBF) break; // not whitespace/BOM -> bad
            }
        } catch (Exception ignored) {}
        return null;
    }

    /** Pick the first existing file: a config-named one (if set), then fallbacks. */
    private File pick(File dir, String configName, String... fallbacks) {
        if (configName != null && !configName.isEmpty()) {
            File f = new File(dir, configName);
            if (f.exists()) return f;
        }
        return firstExisting(dir, fallbacks);
    }
    private String stripExt(String n) { int i = n.lastIndexOf('.'); return i < 0 ? n : n.substring(0, i); }
}
