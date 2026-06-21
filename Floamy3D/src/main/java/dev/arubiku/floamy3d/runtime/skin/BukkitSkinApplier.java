package dev.arubiku.floamy3d.runtime.skin;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.plugin.Plugin;

/**
 * MIT-clean, version-agnostic skin refresh: hide then re-show the player to every viewer,
 * which forces the client to drop and re-create the entity with the updated GameProfile.
 * Uses only the Bukkit API — no NMS, no GPL packet libraries.
 */
public final class BukkitSkinApplier implements SkinApplier {

    private final Plugin plugin;

    public BukkitSkinApplier(Plugin plugin) {
        this.plugin = plugin;
    }

    @Override
    @SuppressWarnings("deprecation")
    public void refresh(Player player) {
        for (Player viewer : Bukkit.getOnlinePlayers()) {
            if (viewer.equals(player)) continue;
            try {
                viewer.hidePlayer(plugin, player);
            } catch (Throwable ignored) {
                viewer.hidePlayer(player);
            }
        }
        // re-show a tick later so the client fully processes the removal first
        Bukkit.getScheduler().runTaskLater(plugin, () -> {
            for (Player viewer : Bukkit.getOnlinePlayers()) {
                if (viewer.equals(player)) continue;
                try {
                    viewer.showPlayer(plugin, player);
                } catch (Throwable ignored) {
                    viewer.showPlayer(player);
                }
            }
        }, 2L);
    }
}
