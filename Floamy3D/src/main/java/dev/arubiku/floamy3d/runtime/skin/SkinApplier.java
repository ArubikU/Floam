package dev.arubiku.floamy3d.runtime.skin;

import org.bukkit.entity.Player;

/**
 * Propagates a changed player profile/skin to all viewers. Implementations must be
 * cross-version. The default {@link BukkitSkinApplier} uses only the Bukkit API (MIT-clean,
 * no NMS, no GPL packet libs). A PacketEvents-based applier could be swapped in here.
 */
public interface SkinApplier {
    void refresh(Player player);
}
