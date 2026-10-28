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
        java.util.Map<String, List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part>> partsByArmor = new java.util.LinkedHashMap<>();
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
                partsByArmor.put(id, b.dataParts);
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
            var assetsRoot = engineDir.resolve("common-pack/assets");
            baker.writeColorAtlasWithData(res, assetsRoot, dataParts);
            // Modern equipment-id delivery: per-armor humanoid textures + an equipment json, so an item
            // with equippable.model = minecraft:<id> (`/f3d getArmor <id> vanilla`) actually binds.
            baker.writeEquipmentCem(atlas, partsByArmor, assetsRoot);   // self-contained 1-tile atlas+data -> 3D CEM
            var eqWriter = new dev.arubiku.floamy3d.pipeline.texture.EquipmentWriter();
            for (var e : atlas) eqWriter.write(assetsRoot, "minecraft", e.id, e.layer2 != null);
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
            // skip models inside a configured-cosmetic folder (they have a config.yml and are handled by
            // scanConfiguredCosmetics) — otherwise they'd be registered TWICE (once with the filename id).
            if (new File(model.getParentFile(), "config.yml").exists()) continue;
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
                // per-cosmetic .jp (folder-local) layered over shared parsers/cosmetic — transforms the geometry.
                var jp = dev.arubiku.floamy3d.pipeline.jem.JpEngine.load(plugin.getDataFolder().toPath().resolve("parsers"), "cosmetic").loadMore(folder.toPath());
                // ONLY added geometry — modifications (tweaked default player cubes) are discarded so the
                // cosmetic never replaces/deletes the player's own body faces.
                java.util.List<CemModel> models = new java.util.ArrayList<>(ex.cosmetics);
                java.util.List<String> partIds = new java.util.ArrayList<>();
                for (CemModel m : models) {
                    if (m.boxes.isEmpty()) continue;
                    m.kind = CemModel.Kind.COSMETIC;
                    applyJpToCosmetic(jp, m);
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

    /** Apply a JpEngine to an extracted cosmetic model so parsers/cosmetic/*.jp AND the per-cosmetic
     *  model.jp behave 1:1 with armor (same DSL, same axes, same effect). The cosmetic CemBox is in the
     *  final render space (X<->Z already where the leather armor's PIX bridge would put it), so we
     *  REVERSE that bridge to JEM space, run the EXACT same sequence as {@link JemParser} toBox
     *  (translate -> scalesc -> rotatesc -> translatesc around scenepivot), re-bridge, then orientation
     *  (rotate) + box-scope ops (flips, switchface, mirror, btranslate). */
    private void applyJpToCosmetic(dev.arubiku.floamy3d.pipeline.jem.JpEngine jp, CemModel m) {
        if (jp == null) return;
        // key = "<configId>:<part>". The model id is "<configId>_<part>" (extractor appends the bone), so
        // strip the redundant "_<part>" suffix -> a `match <configId>:*` in the .jp matches as expected.
        String part = m.sourcePart == null ? "" : m.sourcePart.toLowerCase(java.util.Locale.ROOT);
        String baseId = m.id.toLowerCase(java.util.Locale.ROOT);
        if (!part.isEmpty() && baseId.endsWith("_" + part)) baseId = baseId.substring(0, baseId.length() - part.length() - 1);
        String key = baseId + ":" + part;
        var pc = new dev.arubiku.floamy3d.pipeline.jem.JpEngine.PartCtx();
        pc.scale = 1.0; pc.base = null;
        jp.applyPart(key, pc);
        var V = (java.util.function.Function<double[], dev.arubiku.floamy3d.pipeline.model.Vec3>)
                a -> new dev.arubiku.floamy3d.pipeline.model.Vec3(a[0], a[1], a[2]);
        dev.arubiku.floamy3d.pipeline.model.Mat3 sceneR = dev.arubiku.floamy3d.pipeline.model.Mat3.euler(V.apply(pc.sceneRot));
        var piv = V.apply(pc.scenePivot);
        var t = V.apply(pc.t);
        var sceneT = V.apply(pc.sceneT);
        boolean anyScene = pc.sceneScale != 1.0 || pc.sceneRot[0]!=0 || pc.sceneRot[1]!=0 || pc.sceneRot[2]!=0 || pc.sceneT[0]!=0 || pc.sceneT[1]!=0 || pc.sceneT[2]!=0;
        boolean anyRot = pc.rot[0]!=0 || pc.rot[1]!=0 || pc.rot[2]!=0;
        boolean anyT = pc.t[0]!=0 || pc.t[1]!=0 || pc.t[2]!=0;
        // Y<->Z render-frame swap matrix (its own transpose). Conjugating a rotation by it (P*R*P) is the
        // valid way to move a rotation between bbmodel and render space — naive euler-axis swap is NOT.
        var P = new dev.arubiku.floamy3d.pipeline.model.Mat3(new double[]{1,0,0, 0,0,1, 0,1,0});
        var childRot = V.apply(pc.childRot);
        var childSceneR = dev.arubiku.floamy3d.pipeline.model.Mat3.euler(V.apply(pc.childSceneRot));
        boolean anyChildScene = pc.childSceneRot[0]!=0 || pc.childSceneRot[1]!=0 || pc.childSceneRot[2]!=0;
        boolean anyInvert = pc.invert[0] || pc.invert[1] || pc.invert[2];
        // base PIX (armor JEM->CEM transform): a cosmetic can opt in. PIX = mat3(1,0,0, 0,0,-1, 0,1,0).
        var PIX = new dev.arubiku.floamy3d.pipeline.model.Mat3(new double[]{1,0,0, 0,0,1, 0,-1,0});
        boolean usePix = "PIX".equalsIgnoreCase(pc.base);
        for (int i = 0; i < m.boxes.size(); i++) {
            var b = m.boxes.get(i);
            // "child" = a cube inside a rotated sub-group (its own bone). childrot/childscenerot apply ONLY
            // to these (matches armor: extra spin/position-rotation on articulated sub-bones).
            boolean isChild = b.groupRot.x != 0 || b.groupRot.y != 0 || b.groupRot.z != 0;
            // Scene transform (bbmodel space): translate -> scale -> rotatesc(@scenepivot) -> translatesc.
            // Applied to BOTH the rest centre AND the bone orbit pivot so they move together.
            var c = b.center;
            var gp = b.groupPivot != null ? b.groupPivot : b.center;
            // invert <axis>: bake an axis flip into the position (base==null cosmetics, like JEM invertAxis).
            if (anyInvert) {
                c = new dev.arubiku.floamy3d.pipeline.model.Vec3(pc.invert[0]?-c.x:c.x, pc.invert[1]?-c.y:c.y, pc.invert[2]?-c.z:c.z);
                gp = new dev.arubiku.floamy3d.pipeline.model.Vec3(pc.invert[0]?-gp.x:gp.x, pc.invert[1]?-gp.y:gp.y, pc.invert[2]?-gp.z:gp.z);
            }
            if (anyT) { c = c.add(t); gp = gp.add(t); }
            if (anyScene) {
                c = sceneXform(c, piv, pc.sceneScale, sceneR, sceneT);
                gp = sceneXform(gp, piv, pc.sceneScale, sceneR, sceneT);
            }
            // childscenerot: extra POSITION rotation, sub-bones only (on top, around the scene pivot).
            if (isChild && anyChildScene) {
                c = childSceneR.mul(c.sub(piv)).add(piv);
                gp = childSceneR.mul(gp.sub(piv)).add(piv);
            }
            // (PIX is always applied in the decode now — the cosmetic uses the armor's base convention.)
            var ownEuler = b.rotation;
            if (anyRot) ownEuler = ownEuler.add(V.apply(pc.rot));
            // childrot: extra ORIENTATION, sub-bones only.
            if (isChild) ownEuler = ownEuler.add(childRot);
            // box-scope ops (flips / switchface / mirror / btranslate / seat / bset) — move only the cube (c)
            var faces = b.faces;
            var bc = new dev.arubiku.floamy3d.pipeline.jem.JpEngine.BoxCtx(
                    new double[]{c.x, c.y, c.z}, new double[]{b.half.x, b.half.y, b.half.z}, i, pc.t);
            bc.perFace = true; bc.name = b.name;
            bc.pivot = new double[]{b.pivot.x, b.pivot.y, b.pivot.z};
            bc.rot = new double[]{ownEuler.x, ownEuler.y, ownEuler.z};
            jp.applyBox(key, bc);
            boolean reorder = false;
            for (int f = 0; f < 6; f++) if (bc.swap[f] != f) { reorder = true; break; }
            if (reorder && faces != null) {
                var src = faces.clone();
                for (int f = 0; f < 6 && f < faces.length; f++) faces[f] = src[bc.swap[f]];
            }
            if ((bc.flipU || bc.flipV) && faces != null) faces = flipCosmeticFaces(faces, bc.flipU, bc.flipV);
            if (faces != null) for (int f = 0; f < 6 && f < faces.length; f++)
                if ((bc.faceU[f] || bc.faceV[f]) && faces[f] != null && faces[f].enabled) faces[f] = flipCosmeticFaces(new dev.arubiku.floamy3d.pipeline.model.FaceUV[]{faces[f]}, bc.faceU[f], bc.faceV[f])[0];

            c = new dev.arubiku.floamy3d.pipeline.model.Vec3(bc.pos[0], bc.pos[1], bc.pos[2]);
            // SEPARATE own (in-place) vs group (orbit gp): the decode does the nested pre-PIX transform
            // mc = gp + Rgroup*(pos-gp), Rfull = PIX*Rgroup*Rown. So the group rotates ALL its cubes rigidly
            // around gp while each cube's own rotation stays in place — no splay. (PIX bridges in the decode.)
            var Rown = dev.arubiku.floamy3d.pipeline.model.Mat3.euler(ownEuler);
            var Rgrp = dev.arubiku.floamy3d.pipeline.model.Mat3.euler(b.groupRot);
            // armor parity: `sizeadd` inflates the half-extent, `scale` multiplies it (size only).
            var half = new dev.arubiku.floamy3d.pipeline.model.Vec3(
                    (b.half.x + pc.sizeadd) * pc.scale, (b.half.y + pc.sizeadd) * pc.scale, (b.half.z + pc.sizeadd) * pc.scale);
            var nb = new dev.arubiku.floamy3d.pipeline.model.CemBox(c, half, new dev.arubiku.floamy3d.pipeline.model.Vec3(0,0,0), new dev.arubiku.floamy3d.pipeline.model.Vec3(0,0,0), b.mirror, faces, null, b.ext, b.scale, null);
            nb.name = b.name;
            nb.ownMatrix = Rown; nb.orbitMatrix = Rgrp; nb.bonePivotRender = gp;
            nb.emissive = bc.emissive >= 0 ? bc.emissive : b.emissive;
            nb.transparency = bc.transparency >= 0 ? bc.transparency : b.transparency;
            // animation formulas — bbmodel axes (no swap; PIX bridges in the decode).
            if (bc.hasAnim()) { nb.animRot = bc.animRot; nb.animPos = bc.animPos; nb.animSize = bc.animSize; }
            m.boxes.set(i, nb);
        }
    }

    private static dev.arubiku.floamy3d.pipeline.model.Vec3 sceneXform(dev.arubiku.floamy3d.pipeline.model.Vec3 v,
            dev.arubiku.floamy3d.pipeline.model.Vec3 piv, double scale, dev.arubiku.floamy3d.pipeline.model.Mat3 R,
            dev.arubiku.floamy3d.pipeline.model.Vec3 sceneT) {
        var x = v.sub(piv);
        if (scale != 1.0) x = new dev.arubiku.floamy3d.pipeline.model.Vec3(x.x*scale, x.y*scale, x.z*scale);
        x = R.mul(x);
        return x.add(piv).add(sceneT);
    }
    /** swap Y<->Z entries of a length-3 GLSL-expr array (render-space axis remap). */
    private static String[] swapYZ(String[] a) { return a == null ? null : new String[]{a[0], a[2], a[1]}; }

    /** UV flip identical to JemParser.flipFaces (keep the same region, negate the extent). */
    private dev.arubiku.floamy3d.pipeline.model.FaceUV[] flipCosmeticFaces(dev.arubiku.floamy3d.pipeline.model.FaceUV[] f, boolean u, boolean v) {
        var out = new dev.arubiku.floamy3d.pipeline.model.FaceUV[f.length];
        for (int i = 0; i < f.length; i++) {
            var s = f[i];
            if (s == null || !s.enabled) { out[i] = s; continue; }
            double x = s.x, y = s.y, w = s.w, h = s.h;
            if (u) { x = x + w; w = -w; }
            if (v) { y = y + h; h = -h; }
            out[i] = new dev.arubiku.floamy3d.pipeline.model.FaceUV(x, y, w, h, 0, true);
        }
        return out;
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
