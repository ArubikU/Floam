package dev.arubiku.floamy3d;

import com.mojang.brigadier.arguments.StringArgumentType;
import io.papermc.paper.command.brigadier.Commands;
import io.papermc.paper.plugin.lifecycle.event.LifecycleEventManager;
import io.papermc.paper.plugin.lifecycle.event.types.LifecycleEvents;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import net.kyori.adventure.audience.Audience;
import net.kyori.adventure.text.minimessage.MiniMessage;
import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.Color;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.command.CommandSender;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.configuration.file.YamlConfiguration;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.LeatherArmorMeta;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.plugin.Plugin;
import org.bukkit.plugin.java.JavaPlugin;

public class Floamy3D extends JavaPlugin {
    private ArmorManager armorManager;
    private Floamy3DRuntime runtime;
    public static Audience console = Bukkit.getServer().getConsoleSender();
    private ForgerLogger logger;
    private File CompatibilityPlugin = null;
    public static Set<String> armors = new HashSet<String>();
    private static NamespacedKey pdc = new NamespacedKey("forgery", "armorcustom");

    public ForgerLogger getFLogger() {
        return this.logger;
    }

    @Override
    public void onEnable() {
        this.logger = new ForgerLogger();
        this.saveDefaultConfig();
        this.extractEngine();
        this.createRequiredFolders();
        this.CompatibilityPlugin = Compatibility.comps(this);
        this.armorManager = new ArmorManager(this);

        // Register commands FIRST — must hook the Paper COMMANDS lifecycle event before the
        // (slow) dynamic build runs, and must not be aborted by any build exception.
        try {
            this.registerCommands();
        } catch (Throwable e) {
            this.getFLogger().dangerous("Tryied to register commands but not paper loaded");
            e.printStackTrace();
        }

        // Populate the armor id set (tab-complete) straight from the armors/ folder.
        File[] armorDirs = this.getDataFolder().toPath().resolve("armors").toFile().listFiles();
        if (armorDirs != null)
            for (File file : armorDirs)
                if (file.isDirectory()) armors.add(file.getName());

        // Dynamic build: scan armors/ + cosmetics/ + modifications/ -> generate -> assemble -> zip.
        try {
            this.runtime = new Floamy3DRuntime(this);
            var v = this.runtime.buildAll();
            this.getFLogger().info("Floamy3D: built pack for " + v.size() + " version(s) from armors/ + cosmetics/");
        } catch (Throwable e) {
            this.getFLogger().dangerous("Floamy3D auto-build failed: " + e.getMessage());
            e.printStackTrace();
        }

        if (this.CompatibilityPlugin != null && this.CompatibilityPlugin.exists()) {
            Compatibility.copy(this.CompatibilityPlugin, this);
        }

        // Built-in pack host: serve the generated zip + auto-send to players (join + /build).
        this.startPackHost();
        this.getServer().getPluginManager().registerEvents(new org.bukkit.event.Listener() {
            @org.bukkit.event.EventHandler
            public void onJoin(org.bukkit.event.player.PlayerJoinEvent e) { applyPack(e.getPlayer()); }
        }, this);
    }

    @Override
    public void onDisable() { if (this.packServer != null) this.packServer.stop(); }

    private dev.arubiku.floamy3d.runtime.pack.PackServer packServer;

    /** The freshly built resourcepack zip. */
    public File packZip() { return this.getDataFolder().toPath().resolve("Floamy3D.zip").toFile(); }

    private void startPackHost() {
        if (!this.getConfig().getBoolean("pack.host", true)) return;
        try {
            this.packServer = new dev.arubiku.floamy3d.runtime.pack.PackServer();
            int port = this.getConfig().getInt("pack.port", 8085);
            String addr = this.getConfig().getString("pack.address", "127.0.0.1");
            this.packServer.start(port, addr, this.packZip());
            this.getFLogger().info("Floamy3D pack host: " + this.packServer.url());
        } catch (Throwable e) {
            this.getFLogger().dangerous("Floamy3D pack host failed: " + e.getMessage());
            this.packServer = null;
        }
    }

    /** Send the hosted pack to one player. */
    public void applyPack(org.bukkit.entity.Player p) {
        if (this.packServer == null || !this.packServer.running() || this.packServer.sha1().length == 0) return;
        try { p.setResourcePack(this.packServer.url(), this.packServer.sha1()); }
        catch (Throwable e) { this.getFLogger().dangerous("setResourcePack failed: " + e.getMessage()); }
    }

    /** Re-hash the (rebuilt) pack and re-send it to everyone online. */
    public void pushPackToAll() {
        if (this.packServer == null) return;
        try { this.packServer.refresh(); } catch (Exception ignored) {}
        for (org.bukkit.entity.Player p : this.getServer().getOnlinePlayers()) applyPack(p);
    }

    private void registerCommands() {
        LifecycleEventManager<Plugin> manager = this.getLifecycleManager();
        manager.registerEventHandler(LifecycleEvents.COMMANDS, event -> {
            Commands commands = event.registrar();
            // ONE unified command: /floamy3d (aliases forgery, forg, f3d).
            commands.register(
                Commands.literal("floamy3d")
                    .executes(context -> {
                        context.getSource().getSender().sendMessage(MiniMessage.miniMessage().deserialize(
                            "<aqua>Floamy3D</aqua> <gray>— wear|clear|list|build|getArmor|zip|reload|license</gray>"));
                        return 1;
                    })
                    // ---- cosmetics ----
                    .then(Commands.literal("wear")
                        .then(Commands.argument("id", StringArgumentType.word())
                            .suggests((context, builder) -> {
                                if (this.runtime != null) this.runtime.listCosmetics().forEach(builder::suggest);
                                return builder.buildFuture();
                            })
                            .executes(context -> {
                                if (this.runtime != null && context.getSource().getSender() instanceof Player p)
                                    this.runtime.wear(p, StringArgumentType.getString(context, "id"));
                                return 1;
                            })))
                    .then(Commands.literal("clear").executes(context -> {
                        if (this.runtime != null && context.getSource().getSender() instanceof Player p)
                            this.runtime.clear(p);
                        return 1;
                    }))
                    .then(Commands.literal("list").executes(context -> {
                        if (this.runtime != null)
                            context.getSource().getSender().sendMessage(MiniMessage.miniMessage().deserialize(
                                "<gray>Cosmetics: <white>" + String.join(", ", this.runtime.listCosmetics())));
                        return 1;
                    }))
                    // ---- pack ----
                    .then(Commands.literal("build").executes(context -> {
                        var sender = context.getSource().getSender();
                        try {
                            var v = this.runtime != null ? this.runtime.buildAll() : List.of();
                            this.pushPackToAll();   // re-hash + re-send the rebuilt pack to everyone
                            sender.sendMessage(MiniMessage.miniMessage().deserialize(
                                "<green>Built pack for " + v.size() + " version(s) + re-sent to "
                                + this.getServer().getOnlinePlayers().size() + " player(s)."));
                        } catch (Exception e) {
                            sender.sendMessage(MiniMessage.miniMessage().deserialize(
                                "<red>Build failed: " + e.getMessage()));
                        }
                        return 1;
                    }))
                    .then(Commands.literal("zip").executes(context -> {
                        this.zipCommand(context.getSource().getSender());
                        return 1;
                    }))
                    .then(Commands.literal("reload").executes(context -> {
                        this.reloadCommand(context.getSource().getSender());
                        return 1;
                    }))
                    .then(Commands.literal("license").executes(context -> {
                        if (!context.getSource().getSender().isOp()) return 1;
                        context.getSource().getSender().sendMessage(MiniMessage.miniMessage().deserialize(
                            "<green>Floamy3D is licensed under the <yellow>MIT</yellow> license."));
                        context.getSource().getSender().sendMessage(MiniMessage.miniMessage().deserialize(
                            "<green>Identifiers: <yellow>{{USER_NAME}} , {{USER_IDENTIFIER}} , {{NONCE}} , {{USER}} , {{RESOURCE}}</yellow>"));
                        return 1;
                    }))
                    // ---- armor ----
                    .then(Commands.literal("getArmor")
                        .then(Commands.argument("id", StringArgumentType.word())
                            .suggests((context, builder) -> {
                                armors.forEach(builder::suggest);
                                return builder.buildFuture();
                            })
                            .then(Commands.argument("type", StringArgumentType.word())
                                .suggests((context, builder) -> {
                                    List<String> suggestions = Arrays.asList("modded", "leather", "vanilla",
                                        "modded-vanilla", "leather-vanilla", "modded-leather", "modded-leather-vanilla");
                                    suggestions.forEach(builder::suggest);
                                    return builder.buildFuture();
                                })
                                .executes(context -> {
                                    Player player = (Player) context.getSource().getSender();
                                    String id = StringArgumentType.getString(context, "id");
                                    String type = StringArgumentType.getString(context, "type");
                                    this.getArmorCommand(player, id, type);
                                    return 1;
                                }))))
                    .build(),
                "Floamy3D — armor, cosmetics & pack", List.of("forgery", "forg", "f3d"));
        });
    }

    /** Extract the bundled default engine (resources/engine.zip) into the data folder on first run. */
    private void extractEngine() {
        File engineDir = this.getDataFolder().toPath().resolve("engine").toFile();
        if (engineDir.exists()) return;
        try (java.io.InputStream in = getResource("engine.zip")) {
            if (in == null) return;
            try (java.util.zip.ZipInputStream zis = new java.util.zip.ZipInputStream(in)) {
                java.util.zip.ZipEntry e;
                while ((e = zis.getNextEntry()) != null) {
                    File f = new File(engineDir, e.getName());
                    if (e.isDirectory()) {
                        f.mkdirs();
                    } else {
                        f.getParentFile().mkdirs();
                        Files.copy(zis, f.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    }
                }
            }
            this.getFLogger().info("Extracted default engine to " + engineDir.getName());
        } catch (IOException ex) {
            this.getFLogger().dangerous("Failed to extract bundled engine");
            ex.printStackTrace();
        }
    }

    private void createRequiredFolders() {
        List<String> folders = Arrays.asList("armors", "cosmetics", "modifications", "rp", "output", "parsers");
        for (String folder : folders) {
            this.createFolder(folder);
        }
        this.writeDefaultParser();
    }

    /** Ship the default split transform scripts ONLY on a truly fresh install (empty parsers/armor).
     *  Once the user has any .jp, never write/resurrect defaults — their files are the source. */
    private void writeDefaultParser() {
        Path root = this.getDataFolder().toPath().resolve("parsers");
        Path armorDir = root.resolve("armor");
        try {
            if (Files.isDirectory(armorDir)) {
                try (var s = Files.list(armorDir)) {
                    if (s.anyMatch(p -> p.toString().toLowerCase(java.util.Locale.ROOT).endsWith(".jp"))) return;
                }
            }
        } catch (IOException ignored) { return; }

        jp(root, "_README.jp", """
                # ============================================================================
                # Floamy3D — JEM -> shader transform DSL (hot-reloaded by /floamy3d build, no jar
                # recompile). Files are split so a growing hand-tuned algorithm stays manageable.
                #   parsers/_*.jp        shared: global `var` defs + rules applied to BOTH pipelines
                #   parsers/armor/*.jp   armor parts          (base PIX, scale 0.75)
                #   parsers/cosmetic/*.jp player-part cosmetics (their own algorithm: base none, scale 1)
                # The Java side only does the structural JEM walk (box coords; submodels compose
                # translate+rotate; worldCentre = framePos + frameRot*localCentre;
                # emitPos = transpose(frameRot)*worldCentre; faces from uv* or textureOffset).
                #
                # match key = "<armorId>:<partName>"  (e.g. licorn_fenrir:left_shoe). So:
                #   match *:*shoe*           -> all feet, any armor
                #   match masaki_spike:*     -> one armor, all parts   (per-armor post-processors)
                #   match masaki_spike:*foot* -> one armor's feet
                #
                # PART scope (the frame):
                #   var NAME <expr>            global constant -> $NAME in any expr
                #   translate <x> <y> <z>  |  set t.x|t.y|t.z <e>  |  mul t.x|t.y|t.z <e>
                #   rotate x|y|z <deg>     |  invert x|y|z [on|off] |  mirror [on|off]
                #   base PIX|none          |  scale <e>  |  sizeadd <e>  |  bone <STASIS_NAME>
                # BOX scope (per cube; learned rule: a box seats at posZ = -sizeY):
                #   cube <idx|*>               select which cube(s) the next box ops target
                #   seat                       bz.z = -sz.y   (sit the box on the bone by its height)
                #   bset bz.x|bz.y|bz.z <e>  |  btranslate <x> <y> <z>
                # expr tokens: t.x t.y t.z (frame)  sz.x sz.y sz.z (box half-size)  bz.x bz.y bz.z (box pos)
                #              idx (cube index)  $VAR  numbers  + - * / ( )
                # ============================================================================
                """);
        jp(root, "_vars.jp", """
                # Shared globals (visible in armor/ and cosmetic/ as $NAME).
                # Per-part scales LEARNED from the hand-tuned packs (fenrir, masaki, tugkan, started,
                # kirito): artists scale legs/feet bigger (~0.9) and chest/arms smaller (~0.8).
                # Per-part Z-LIFT, DERIVED by matching every JEM box to its hand-made box across all
                # packs (median of handmade.pos - raw emit). These reproduce the artist placement from
                # the JEM geometry. Applied as `btranslate 0 0 $LIFT_*` (emit-space, after PIX).
                var LIFT_FEET   -12
                var LIFT_LEG    -11
                var LIFT_INNER  -12
                var LIFT_CHEST  -12
                var LIFT_ARM    -8
                var SCALE_BASE  0.8
                var SCALE_FEET  0.85
                var SCALE_LEG   0.95
                var SCALE_CHEST 0.80
                var SCALE_INNER 0.95
                var SCALE_ARM   0.80
                var SCALE_HELM  0.85
                var ARM_ANGLE   22.5     # arms are often angled ~PIY12 (22.5 deg on Y)
                """);

        // --- armor: one file per part type (base PIX dominant across all packs) ---
        jp(root, "armor/_base.jp", """
                # default for every armor part
                match *
                base PIX
                scale $SCALE_BASE
                """);
        jp(root, "armor/feet.jp", """
                # DERIVED from all packs: boot box emit-Z needs -12 to land where the artist placed it
                # (raw JEM emit z=+10 -> -2 = the hand-made foot). btranslate is emit-space (post-PIX).
                match *:*shoe* *:*foot* *:*boot*
                scale $SCALE_FEET
                cube *
                btranslate 0 10 -2
                """);
        jp(root, "armor/legs.jp", """
                # DERIVED lifts: leg emit-Z -11, waist/inner -12 (median over all packs).
                match *:*leg*
                scale $SCALE_LEG
                cube *
                btranslate 0 2 -9
                match *:*waist*
                scale $SCALE_INNER
                cube *
                btranslate 0 10 -6
                """);
        jp(root, "armor/chestplate.jp", """
                # DERIVED (median over all packs): chestplate btranslate 0 3 -4.
                match *:*body* *:*chest*
                scale $SCALE_CHEST
                cube *
                btranslate 0 3 -4
                """);
        // Arms are LEFT/RIGHT-asymmetric in the hand-tuned packs: the per-box X-rotation flips sign
        // between sides (RIGHT PIX25 <-> LEFT NIX25) and some packs add 180-Z on the left. The box
        // geometry/mirror comes from the JEM; here we tune each side independently.
        jp(root, "armor/right_arm.jp", """
                # DERIVED lift: arm emit-Z -8 (shoulder bone sits higher than feet/legs). X spread is
                # per-armor decorative -> tune in the armor's own file if needed.
                match *:*right_arm* *:*rightarm*
                scale $SCALE_ARM
                cube *
                btranslate -5 -3 -11
                # rotate y $ARM_ANGLE
                """);
        jp(root, "armor/left_arm.jp", """
                # DERIVED: arms are L/R asymmetric — left btranslate 2 -3 -8, right -5 -3 -11.
                match *:*left_arm* *:*leftarm*
                scale $SCALE_ARM
                mirror on
                cube *
                btranslate 2 -3 -8
                # rotate y $ARM_ANGLE
                """);
        jp(root, "armor/helmet.jp", """
                # NOTE: none of the analysed packs render a CEM helmet (helmet stays vanilla/texture).
                # match *:*head* *:*helmet*
                # scale $SCALE_HELM
                """);
        // Per-armor post-processor EXAMPLE: most feet seat at posZ = -sizeY, but masaki_spike's tall
        // boot cube ("cactus") sits at -5 not -6. Read plugins/Floamy3D/compiled.glsl to find the
        // cube index, then override just that one. (Commented — enable + tune to taste.)
        jp(root, "armor/masaki_spike.jp", """
                # exception: the tall boot cube doesn't follow the seat rule exactly.
                # match masaki_spike:*foot*
                # cube 0
                # bset bz.z -5
                """);

        // --- cosmetics / player parts: SEPARATE algorithm (no PIX base, full scale) ---
        jp(root, "cosmetic/_base.jp", """
                # Player-part cosmetics differ from armor: authored in skin space, no PIX base flip,
                # full scale. Tune per body-part in the files below.
                match *
                base none
                scale 1
                """);
        jp(root, "cosmetic/human_head.jp", "# head cosmetics: elf/pirate ears, horns\n# match *head*\n");
        jp(root, "cosmetic/human_body.jp", "# body cosmetics: cape, wings\n# match *body*\n");
        jp(root, "cosmetic/human_feet.jp", "# feet/leg cosmetics\n# match *foot* *leg*\n");
    }

    /** Write a default parser file if it doesn't already exist (preserves user edits). */
    private void jp(Path root, String rel, String content) {
        Path f = root.resolve(rel);
        try {
            Files.createDirectories(f.getParent());
            if (!Files.exists(f)) Files.writeString(f, content);
        } catch (IOException e) { e.printStackTrace(); }
    }

    private void createFolder(String folderPath) {
        Path path = this.getDataFolder().toPath().resolve(folderPath);
        try {
            Files.createDirectories(path);
            this.getLogger().info("Created folder: " + path);
        } catch (IOException e) {
            this.getLogger().severe("Failed to create folder: " + path);
            e.printStackTrace();
        }
    }

    public void cleanupFolder(File folder) {
        if (!folder.exists() || !folder.isDirectory()) {
            return;
        }
        File[] fileArray = folder.listFiles();
        for (File file : fileArray) {
            if (file.isDirectory()) {
                this.cleanupFolder(file.getAbsolutePath());
                file.delete();
            } else {
                file.delete();
            }
        }
    }

    private void cleanupFolder(String path) {
        File folder = this.getDataFolder().toPath().resolve(path).toFile();
        if (!folder.exists() || !folder.isDirectory()) {
            System.out.println("La carpeta no existe o no es un directorio.");
            return;
        }
        File[] fileArray = folder.listFiles();
        for (File file : fileArray) {
            if (file.isDirectory()) {
                this.cleanupFolder(file.getAbsolutePath());
                file.delete();
            } else {
                file.delete();
            }
        }
        System.out.println("Folder removed: " + path);
    }

    public void copyContent(File folder, File destination) throws IOException {
        if (!folder.exists() || !folder.isDirectory()) {
            throw new IOException("Folder not exists or not a directory.");
        }
        if (!destination.exists()) {
            destination.mkdirs();
        }
        File[] fileArray = folder.listFiles();
        for (File file : fileArray) {
            File destFile = new File(destination, file.getName());
            if (file.isDirectory()) {
                this.copyContent(file, destFile);
            } else {
                Files.copy(file.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        }
    }

    private void getArmorCommand(Player player, String id, String type) {
        ItemStack helmet;
        ItemStack chestplate;
        ItemStack leggings;
        ItemStack boots;
        File armorFolder = this.getDataFolder().toPath().resolve("armors").resolve(id).toFile();
        if (!armorFolder.exists() || !armorFolder.isDirectory()) {
            player.sendMessage(ChatColor.RED + "Armor not found.");
            return;
        }
        File config = armorFolder.toPath().resolve("config.yml").toFile();
        if (!config.exists()) {
            config = armorFolder.toPath().resolve("config.yaml").toFile();
        }
        if (!config.exists()) {
            player.sendMessage(ChatColor.RED + "Armor config not found.");
            return;
        }
        YamlConfiguration armorConfig = YamlConfiguration.loadConfiguration(config);
        String armortype = armorConfig.getString("vanilla_overrides", "leather");
        VanillaOverrides.ArmorOverrides ov = VanillaOverrides.getOverrides(armortype);
        try {
            helmet = new ItemStack(Material.valueOf(ov.getSlot(103)));
            chestplate = new ItemStack(Material.valueOf(ov.getSlot(102)));
            leggings = new ItemStack(Material.valueOf(ov.getSlot(101)));
            boots = new ItemStack(Material.valueOf(ov.getSlot(100)));
        } catch (IllegalArgumentException e) {
            player.sendMessage(ChatColor.RED + "Invalid material in armor config.");
            return;
        }
        String[] types = type.toUpperCase().split("-");
        for (String t : types) {
            switch (t) {
                case "MODDED": {
                    helmet = this.processStack(helmet, armorConfig, ArmorType.MODDED);
                    chestplate = this.processStack(chestplate, armorConfig, ArmorType.MODDED);
                    leggings = this.processStack(leggings, armorConfig, ArmorType.MODDED);
                    boots = this.processStack(boots, armorConfig, ArmorType.MODDED);
                    break;
                }
                case "LEATHER": {
                    helmet = this.processStack(helmet, armorConfig, ArmorType.LEATHER);
                    chestplate = this.processStack(chestplate, armorConfig, ArmorType.LEATHER);
                    leggings = this.processStack(leggings, armorConfig, ArmorType.LEATHER);
                    boots = this.processStack(boots, armorConfig, ArmorType.LEATHER);
                    break;
                }
                case "VANILLA": {
                    helmet = this.processStack(helmet, armorConfig, ArmorType.VANILLA);
                    chestplate = this.processStack(chestplate, armorConfig, ArmorType.VANILLA);
                    leggings = this.processStack(leggings, armorConfig, ArmorType.VANILLA);
                    boots = this.processStack(boots, armorConfig, ArmorType.VANILLA);
                    break;
                }
                default: {
                    player.sendMessage(ChatColor.RED + "Invalid armor type specified.");
                    return;
                }
            }
        }
        Collection<ItemStack> armor = player.getInventory().addItem(helmet, chestplate, leggings, boots).values();
        if (!armor.isEmpty()) {
            player.sendMessage(ChatColor.RED + "Inventory full, armor dropped on the ground.");
            for (ItemStack item : armor) {
                player.getWorld().dropItem(player.getLocation(), item);
            }
        }
    }

    private ItemStack processStack(ItemStack stack, FileConfiguration config, ArmorType type) {
        switch (type) {
            case MODDED: {
                stack.editMeta(meta -> meta.getPersistentDataContainer().set(pdc, PersistentDataType.STRING,
                        config.getString("id").replace(":", "_")));
                return stack;
            }
            case LEATHER: {
                stack.editMeta(LeatherArmorMeta.class, meta -> {
                    Color color = Color.fromRGB(config.getInt("color.r"), config.getInt("color.g"),
                            config.getInt("color.b"));
                    meta.setColor(color);
                });
                return stack;
            }
            case VANILLA: {
                try {
                    stack.editMeta(meta -> {
                        if (config.contains("custom_model_data")) {
                            meta.setCustomModelData(config.getInt("custom_model_data", 0));
                        }
                    });
                    stack = VersionManager.applyAdvancedModelFeatures(stack, config);
                } catch (Exception e) {
                    this.getFLogger().fine("No se pudieron aplicar características avanzadas de modelo a un item");
                }
                return stack;
            }
        }
        return stack;
    }

    private void reloadCommand(CommandSender sender) {
        this.getFLogger().info("Starting Floamy3D reload...");
        this.cleanupFolder("output");
        this.getFLogger().fine("Folder 'output' cleaned up.");
        try {
            this.copyContent(this.getDataFolder().toPath().resolve("rp").toFile(),
                    this.getDataFolder().toPath().resolve("output").toFile());
            this.getFLogger().fine("Content copied from 'rp' to 'output'.");
        } catch (IOException e) {
            this.getFLogger().severe("Error copying content: " + e.getMessage());
            sender.sendMessage(ChatColor.RED + "Failed to copy resource files.");
            return;
        }
        ArmorProcessor.resetOffset();
        OptifineProcessor.resetFollower();
        this.armorManager = new ArmorManager(this);
        this.armorManager.processArmors();
        this.getFLogger().info("Armor processing completed.");
        sender.sendMessage(ChatColor.GREEN + "Floamy3D successfully reloaded.");
        if (this.CompatibilityPlugin != null) {
            if (!this.CompatibilityPlugin.exists()) {
                this.CompatibilityPlugin.mkdirs();
            }
            if (this.CompatibilityPlugin.exists()) {
                Compatibility.copy(this.CompatibilityPlugin, this);
                sender.sendMessage(ChatColor.GREEN + "Floamy3D added to" + Compatibility.compa.toString() + ".");
            }
        }
    }

    private void zipCommand(CommandSender sender) {
        try {
            this.zipOutput();
            sender.sendMessage(ChatColor.GREEN + "Output files have been zipped successfully.");
        } catch (IOException e) {
            sender.sendMessage(ChatColor.RED + "Failed to zip output files: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void zipOutput() throws IOException {
        Path zipFile = this.getDataFolder().toPath().resolve("output.zip");
        if (!zipFile.toFile().exists()) {
            zipFile.toFile().createNewFile();
        }
        File sourceFolder = this.getDataFolder().toPath().resolve("output").toFile();
        if (!sourceFolder.exists() || !sourceFolder.isDirectory()) {
            throw new IOException("La carpeta de origen no existe o no es un directorio.");
        }
        try (FileOutputStream fos = new FileOutputStream(zipFile.toFile());
             ZipOutputStream zos = new ZipOutputStream(fos)) {
            this.zipFolder(sourceFolder, "", zos);
            System.out.println("Output compressed to: output.zip");
        }
    }

    private void zipFolder(File folder, String parentFolder, ZipOutputStream zos) throws IOException {
        File[] fileArray = folder.listFiles();
        for (File file : fileArray) {
            String zipEntryName = file.getName();
            if (!parentFolder.equals("")) {
                zipEntryName = parentFolder + "\\" + zipEntryName;
            }
            if (file.isDirectory()) {
                this.zipFolder(file, zipEntryName, zos);
            } else {
                try (FileInputStream fis = new FileInputStream(file)) {
                    int length;
                    zos.putNextEntry(new ZipEntry(zipEntryName));
                    byte[] buffer = new byte[1024];
                    while ((length = fis.read(buffer)) >= 0) {
                        zos.write(buffer, 0, length);
                    }
                    zos.closeEntry();
                }
            }
        }
    }

    private static enum ArmorType {
        MODDED,
        LEATHER,
        VANILLA;
    }

    public static class ForgerLogger {
        public void info(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<green>" + message));
        }

        public void severe(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<red>" + message));
        }

        public void warning(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<yellow>" + message));
        }

        public void fine(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<gray>" + message));
        }

        public void finer(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<dark_gray>" + message));
        }

        public void dangerous(String message) {
            console.sendMessage(MiniMessage.miniMessage().deserialize("<red>" + message));
        }
    }
}
