package dev.arubiku.floamy3d.runtime.cosmetics;

import dev.arubiku.floamy3d.pipeline.registry.OverlapDetector;
import dev.arubiku.floamy3d.runtime.skin.*;
import org.bukkit.Bukkit;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.Player;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.plugin.Plugin;

import java.awt.image.BufferedImage;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Runtime cosmetic application: stamps a cosmetic's marker pixel (and optional overlay) onto
 * the player's skin, signs it (MineSkin), applies via Paper PlayerProfile, and refreshes to
 * viewers. The shipped pack's shader detects the marker and renders the CEM geometry.
 *
 * Original skin is saved to the PDC so {@link #clear(Player)} restores it. MIT-clean throughout.
 */
public final class CosmeticManager {

    /** A wearable cosmetic: where its marker lives + what value identifies it. */
    public static final class Def {
        public final String id;
        public final CosmeticType type;
        public final int markerX, markerY, markerValue, speed;
        public final BufferedImage overlay; // optional
        public final List<OverlapDetector.Rect> footprint; // skin UV rects (for overlap warning)
        public final String permission; // null = free to wear
        public Def(String id, CosmeticType type, int mx, int my, int value, int speed, BufferedImage overlay) {
            this(id, type, mx, my, value, speed, overlay, java.util.Collections.emptyList());
        }
        public Def(String id, CosmeticType type, int mx, int my, int value, int speed,
                   BufferedImage overlay, List<OverlapDetector.Rect> footprint) {
            this(id, type, mx, my, value, speed, overlay, footprint, null);
        }
        public Def(String id, CosmeticType type, int mx, int my, int value, int speed,
                   BufferedImage overlay, List<OverlapDetector.Rect> footprint, String permission) {
            this.id = id; this.type = type; this.markerX = mx; this.markerY = my;
            this.markerValue = value; this.speed = speed; this.overlay = overlay;
            this.footprint = footprint == null ? java.util.Collections.emptyList() : footprint;
            this.permission = permission;
        }
    }

    private final Plugin plugin;
    private final ProfileService profile;
    private final MineSkinClient mineskin;
    private final SkinApplier applier;
    private final SkinComposer composer = new SkinComposer();
    private final OverlapDetector overlap = new OverlapDetector();
    private final Map<String, Def> defs = new ConcurrentHashMap<>();
    /** Currently-worn cosmetics per player (id -> def). */
    private final Map<java.util.UUID, Map<String, Def>> wornByPlayer = new ConcurrentHashMap<>();

    private final NamespacedKey worn;
    private final NamespacedKey origValue;
    private final NamespacedKey origSig;

    public CosmeticManager(Plugin plugin, ProfileService profile, MineSkinClient mineskin, SkinApplier applier) {
        this.plugin = plugin;
        this.profile = profile;
        this.mineskin = mineskin;
        this.applier = applier;
        this.worn = new NamespacedKey(plugin, "worn");
        this.origValue = new NamespacedKey(plugin, "orig_textures");
        this.origSig = new NamespacedKey(plugin, "orig_signature");
    }

    public void register(Def def) { defs.put(def.id.toLowerCase(java.util.Locale.ROOT), def); }
    public Map<String, Def> defs() { return defs; }

    /** A wearable made of one model's parts + a chosen variant texture. One model + N variants =
     *  one CEM/GLSL case, N overlays (markers shared across variants of the same model's parts). */
    public static final class Group {
        public final java.util.List<String> partIds;
        public final BufferedImage overlay;   // the variant's texture (baked into the skin)
        public final String permission;
        public Group(java.util.List<String> partIds, BufferedImage overlay, String permission) {
            this.partIds = partIds; this.overlay = overlay; this.permission = permission;
        }
    }
    private final Map<String, Group> groups = new ConcurrentHashMap<>();
    public void registerGroup(String groupId, java.util.List<String> partIds, BufferedImage overlay, String permission) {
        groups.put(groupId.toLowerCase(java.util.Locale.ROOT), new Group(partIds, overlay, permission));
    }
    public boolean isWearable(String id) {
        String k = id.toLowerCase(java.util.Locale.ROOT);
        return groups.containsKey(k) || defs.containsKey(k);
    }
    public java.util.Set<String> wearableIds() {
        java.util.Set<String> s = new java.util.LinkedHashSet<>(groups.keySet());
        return s;
    }

    public void wear(Player player, String id) {
        String key = id.toLowerCase(java.util.Locale.ROOT);
        Group grp = groups.get(key);
        List<Def> parts = new java.util.ArrayList<>();
        BufferedImage overlayTex; String perm;
        if (grp != null) {
            for (String p : grp.partIds) { Def d = defs.get(p.toLowerCase(java.util.Locale.ROOT)); if (d != null) parts.add(d); }
            overlayTex = grp.overlay; perm = grp.permission;
        } else {
            Def d = defs.get(key);
            if (d != null) { parts.add(d); overlayTex = d.overlay; perm = d.permission; } else { overlayTex = null; perm = null; }
        }
        if (parts.isEmpty()) {
            player.sendMessage("Floamy3D: unknown cosmetic '" + id + "'");
            return;
        }
        Def def = parts.get(0); // primary: worn-tracking / conflict footprint
        if (perm != null && !perm.isEmpty() && !player.hasPermission(perm)) {
            player.sendMessage("Floamy3D: no permission for cosmetic '" + id + "' (" + perm + ")");
            return;
        }
        saveOriginal(player);

        Map<String, Def> current = wornByPlayer.computeIfAbsent(player.getUniqueId(), k -> new java.util.LinkedHashMap<>());

        // detect which already-worn cosmetics conflict with the new one
        List<Def> removed = new java.util.ArrayList<>();
        for (Def w : current.values()) {
            if (w.id.equalsIgnoreCase(def.id)) continue;
            OverlapDetector.Result r = overlap.detect(
                    w.markerX, w.markerY, w.footprint, def.markerX, def.markerY, def.footprint);
            if (r.conflict) {
                removed.add(w);
                player.sendMessage("Floamy3D: wearing '" + def.id + "' removes '" + w.id + "' — " + r.reason);
            }
        }

        // markers to stamp: ALL parts of the new cosmetic (enabled) + the removed ones disabled (value 0)
        List<SkinComposer.Marker> markers = new java.util.ArrayList<>();
        for (Def p : parts) markers.add(new SkinComposer.Marker(p.markerX, p.markerY, p.markerValue, p.speed));
        for (Def w : removed) markers.add(new SkinComposer.Marker(w.markerX, w.markerY, 0, 0));

        Bukkit.getScheduler().runTaskAsynchronously(plugin, () -> {
            BufferedImage base = profile.fetchSkin(player);
            if (base == null) base = new BufferedImage(64, 64, BufferedImage.TYPE_INT_ARGB);
            BufferedImage composed = composer.compose(base, overlayTex, markers);
            String[] sig = mineskin.sign(composed);
            if (sig == null) {
                Bukkit.getScheduler().runTask(plugin, () ->
                        player.sendMessage("Floamy3D: skin signing failed (MineSkin); try again."));
                return;
            }
            Bukkit.getScheduler().runTask(plugin, () -> {
                profile.applyTextures(player, sig[0], sig[1]);
                applier.refresh(player);
                for (Def w : removed) current.remove(w.id.toLowerCase(java.util.Locale.ROOT));
                current.put(id.toLowerCase(java.util.Locale.ROOT), def);
                player.getPersistentDataContainer().set(this.worn, PersistentDataType.STRING,
                        String.join(",", current.keySet()));
                player.sendMessage("Floamy3D: wearing " + id);
            });
        });
    }

    /** Non-destructive conflict preview (for a command / tooltip). */
    public List<String> conflicts(Player player, String id) {
        Def def = defs.get(id.toLowerCase(java.util.Locale.ROOT));
        List<String> out = new java.util.ArrayList<>();
        if (def == null) return out;
        Map<String, Def> current = wornByPlayer.getOrDefault(player.getUniqueId(), Map.of());
        for (Def w : current.values()) {
            if (w.id.equalsIgnoreCase(def.id)) continue;
            OverlapDetector.Result r = overlap.detect(
                    w.markerX, w.markerY, w.footprint, def.markerX, def.markerY, def.footprint);
            if (r.conflict) out.add(w.id + " (" + r.reason + ")");
        }
        return out;
    }

    public void clear(Player player) {
        var pdc = player.getPersistentDataContainer();
        String value = pdc.get(origValue, PersistentDataType.STRING);
        String signature = pdc.get(origSig, PersistentDataType.STRING);
        if (value != null) {
            profile.applyTextures(player, value, signature);
            applier.refresh(player);
        }
        pdc.remove(worn);
        wornByPlayer.remove(player.getUniqueId());
        player.sendMessage("Floamy3D: cosmetics cleared");
    }

    /**
     * Capture the player's pristine skin BEFORE any cosmetic is applied. Runs synchronously on
     * the main thread (getPlayerProfile reads no network), so it always completes before the
     * async compose reads the skin — no race that could persist a marked skin as "original".
     */
    private void saveOriginal(Player player) {
        var pdc = player.getPersistentDataContainer();
        if (pdc.has(origValue, PersistentDataType.STRING)) return; // already saved
        String[] cur = currentTextures(player);
        if (cur == null) return;
        pdc.set(origValue, PersistentDataType.STRING, cur[0]);
        if (cur[1] != null) pdc.set(origSig, PersistentDataType.STRING, cur[1]);
    }

    private String[] currentTextures(Player player) {
        try {
            for (var p : player.getPlayerProfile().getProperties()) {
                if (p.getName().equals("textures")) return new String[]{p.getValue(), p.getSignature()};
            }
        } catch (Throwable ignored) {}
        return null;
    }
}
