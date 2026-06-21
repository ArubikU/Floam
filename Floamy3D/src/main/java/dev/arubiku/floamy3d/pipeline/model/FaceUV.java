package dev.arubiku.floamy3d.pipeline.model;

import java.util.Locale;

/**
 * One box face's texture rectangle (pixel coords) + per-face rotation/mirror.
 * Emitted as vec4(x, y, w, h); a disabled face emits vec4(0).
 */
public final class FaceUV {
    public static final FaceUV DISABLED = new FaceUV(0, 0, 0, 0, 0, false);

    public final double x, y, w, h;
    public final int rot;        // 0..3 (CCW 90 steps)
    public final boolean enabled;

    public FaceUV(double x, double y, double w, double h, int rot, boolean enabled) {
        this.x = x; this.y = y; this.w = w; this.h = h;
        this.rot = ((rot % 4) + 4) % 4;
        this.enabled = enabled;
    }

    /** Build from a Blockbench face uv = [u1, v1, u2, v2] (pixel coords). */
    public static FaceUV fromBbUv(double[] uv, int rotation) {
        if (uv == null || uv.length < 4) return DISABLED;
        // JEM per-face uv = [u1,v1,u2,v2] = start corner + end corner. Match the box-UV convention:
        // origin = the START corner (u1,v1), extent = signed (u2-u1, v2-v1). Keeping the origin tied
        // to the signed extent is what makes mirrored faces (negative w/h) sample the right region.
        double x = uv[0], y = uv[1];
        double w = uv[2] - uv[0];   // signed: negative => mirrored in U
        double h = uv[3] - uv[1];   // signed: negative => mirrored in V
        return new FaceUV(x, y, w, h, rotation / 90, true);
    }

    /** Direct UV (cosmetics / modern texture armor): vec4(x,y,w,h). */
    public String glsl() {
        if (!enabled) return "vec4(0)";
        return String.format(Locale.ROOT, "vec4(%.1f,%.1f,%.1f,%.1f)", x, y, w, h);
    }

    /** Atlas UV (old color-armor): relativeUv offsets into the per-color atlas tile. */
    public String glslAtlas() {
        if (!enabled) return "vec4(0)";
        return String.format(Locale.ROOT, "relativeUv(%.0f,%.0f,%.0f,%.0f,RelativeCords)", x, y, w, h);
    }
}
