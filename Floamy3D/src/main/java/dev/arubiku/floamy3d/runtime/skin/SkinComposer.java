package dev.arubiku.floamy3d.runtime.skin;

import java.awt.image.BufferedImage;
import java.util.List;

/**
 * Composites a player's base skin with cosmetic overlays and writes the detection marker
 * pixels the shader looks for. Pure image work (no Bukkit) so it is unit-testable.
 *
 * The result is the texture handed to {@link ProfileService} and applied at runtime; the
 * shipped pack's shader reads the marker pixels and renders the matching CEM geometry.
 */
public final class SkinComposer {

    /** A marker pixel the shader detects: R and B carry the value, G carries animation speed. */
    public static final class Marker {
        public final int x, y, value, speed;
        public Marker(int x, int y, int value, int speed) {
            this.x = x; this.y = y; this.value = value; this.speed = speed;
        }
    }

    /**
     * @param base    the player's current 64x64 skin
     * @param overlay optional RGBA overlay drawn on top (same size); null to skip
     * @param markers marker pixels to stamp (after the overlay)
     * @return a new 64x64 skin image
     */
    public BufferedImage compose(BufferedImage base, BufferedImage overlay, List<Marker> markers) {
        BufferedImage out = new BufferedImage(64, 64, BufferedImage.TYPE_INT_ARGB);
        // copy base
        int w = Math.min(64, base.getWidth()), h = Math.min(64, base.getHeight());
        for (int y = 0; y < h; y++)
            for (int x = 0; x < w; x++)
                out.setRGB(x, y, base.getRGB(x, y));

        // alpha-blend overlay
        if (overlay != null) {
            int ow = Math.min(64, overlay.getWidth()), oh = Math.min(64, overlay.getHeight());
            for (int y = 0; y < oh; y++)
                for (int x = 0; x < ow; x++)
                    out.setRGB(x, y, blend(out.getRGB(x, y), overlay.getRGB(x, y)));
        }

        // stamp markers last so nothing overwrites them
        if (markers != null) {
            for (Marker m : markers) {
                if (m.x < 0 || m.y < 0 || m.x >= 64 || m.y >= 64) continue;
                out.setRGB(m.x, m.y, argb(m.value, clamp(m.speed), m.value, 255));
            }
        }
        return out;
    }

    private static int blend(int dst, int src) {
        int sa = (src >>> 24) & 0xFF;
        if (sa == 0) return dst;
        if (sa == 255) return src;
        int da = (dst >>> 24) & 0xFF;
        float a = sa / 255f, ia = 1 - a;
        int r = Math.round(((src >> 16) & 0xFF) * a + ((dst >> 16) & 0xFF) * ia);
        int g = Math.round(((src >> 8) & 0xFF) * a + ((dst >> 8) & 0xFF) * ia);
        int b = Math.round((src & 0xFF) * a + (dst & 0xFF) * ia);
        int outA = Math.max(da, sa);
        return argb(r, g, b, outA);
    }

    private static int argb(int r, int g, int b, int a) {
        return (a << 24) | ((r & 0xFF) << 16) | ((g & 0xFF) << 8) | (b & 0xFF);
    }

    private static int clamp(int v) { return Math.max(0, Math.min(255, v)); }
}
