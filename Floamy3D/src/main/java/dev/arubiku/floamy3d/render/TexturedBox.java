package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.model.FaceUV;
import dev.arubiku.floamy3d.pipeline.model.Mat3;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.awt.image.BufferedImage;

/**
 * An oriented box that also samples its texture per face — used by the offline textured renderer
 * to preview the actual look of generated geometry (no Minecraft). Face order matches the engine:
 * DOWN(+Y), UP(-Y), NORTH(-Z), EAST(+X), SOUTH(+Z), WEST(-X).
 */
public final class TexturedBox {
    public final Vec3 center, half;
    public final Mat3 rot;
    public final FaceUV[] faces;     // length 6
    public final BufferedImage tex;

    public TexturedBox(Vec3 center, Vec3 half, Mat3 rot, FaceUV[] faces, BufferedImage tex) {
        this.center = center; this.half = half; this.rot = rot == null ? Mat3.identity() : rot;
        this.faces = faces; this.tex = tex;
    }

    /** Result of a ray hit: distance, sampled+shaded ARGB. */
    public static final class Hit { public double t; public int argb; }

    public Hit intersect(Vec3 ro, Vec3 rd, Vec3 lightDir) {
        Mat3 inv = rot.transpose();
        Vec3 lo = inv.mul(ro.sub(center));
        Vec3 ld = inv.mul(rd);
        double[] o = {lo.x, lo.y, lo.z}, d = {ld.x, ld.y, ld.z}, h = {half.x, half.y, half.z};
        double tn = -1e30, tf = 1e30; int enterAxis = 0; double enterSign = 1;
        for (int i = 0; i < 3; i++) {
            if (Math.abs(d[i]) < 1e-9) { if (o[i] < -h[i] || o[i] > h[i]) return null; continue; }
            double t1 = (-h[i] - o[i]) / d[i], t2 = (h[i] - o[i]) / d[i];
            double sign = -Math.signum(d[i]);
            if (t1 > t2) { double t = t1; t1 = t2; t2 = t; sign = -sign; }
            if (t1 > tn) { tn = t1; enterAxis = i; enterSign = sign; }
            tf = Math.min(tf, t2);
            if (tn > tf) return null;
        }
        if (tf < 0) return null;
        double t = tn > 0 ? tn : tf;

        Vec3 lh = new Vec3(lo.x + ld.x * t, lo.y + ld.y * t, lo.z + ld.z * t);
        int face; double u, v;
        if (enterAxis == 0) { face = enterSign > 0 ? CemFace.EAST : CemFace.WEST; u = n(lh.z, half.z); v = n(lh.y, half.y); }
        else if (enterAxis == 1) { face = enterSign > 0 ? CemFace.DOWN : CemFace.UP; u = n(lh.x, half.x); v = n(lh.z, half.z); }
        else { face = enterSign > 0 ? CemFace.SOUTH : CemFace.NORTH; u = n(lh.x, half.x); v = n(lh.y, half.y); }

        int col = sample(faces[face], u, v);
        if ((col >>> 24) < 16) return null; // transparent texel — treat as miss

        // Lambert shade by world normal
        Vec3 ln = axis(enterAxis, enterSign);
        Vec3 wn = rot.mul(ln);
        double nl = Math.max(0, -(wn.x * lightDir.x + wn.y * lightDir.y + wn.z * lightDir.z));
        double shade = 0.45 + 0.55 * nl;
        Hit hit = new Hit();
        hit.t = t;
        hit.argb = shadeColor(col, shade);
        return hit;
    }

    private static double n(double a, double half) { return half == 0 ? 0.5 : (a / half + 1) * 0.5; }
    private static Vec3 axis(int i, double s) {
        return i == 0 ? new Vec3(s, 0, 0) : i == 1 ? new Vec3(0, s, 0) : new Vec3(0, 0, s);
    }

    private int sample(FaceUV f, double u, double v) {
        if (f == null || !f.enabled || tex == null) return 0;
        int px = (int) Math.floor(f.x + f.w * u);
        int py = (int) Math.floor(f.y + f.h * v);
        px = Math.max(0, Math.min(tex.getWidth() - 1, px));
        py = Math.max(0, Math.min(tex.getHeight() - 1, py));
        return tex.getRGB(px, py);
    }

    private static int shadeColor(int argb, double s) {
        int a = (argb >>> 24) & 0xFF;
        int r = (int) Math.min(255, ((argb >> 16) & 0xFF) * s);
        int g = (int) Math.min(255, ((argb >> 8) & 0xFF) * s);
        int b = (int) Math.min(255, (argb & 0xFF) * s);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    /** Face index constants (mirror CemBox). */
    public static final class CemFace {
        public static final int DOWN = 0, UP = 1, NORTH = 2, EAST = 3, SOUTH = 4, WEST = 5;
    }
}
