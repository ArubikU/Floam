package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.model.Mat3;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

/**
 * An oriented box in world (CEM) space for the offline software renderer: centre + half-extents
 * + rotation. Mirrors how the CEM shader treats a box — an AABB at the origin in box-local space,
 * the ray transformed by the box rotation — so rendering it CPU-side approximates what the shader
 * would draw, with no Minecraft needed.
 */
public final class OrientedBox {
    public final Vec3 center, half;
    public final Mat3 rot;

    public OrientedBox(Vec3 center, Vec3 half, Mat3 rot) {
        this.center = center;
        this.half = half;
        this.rot = rot == null ? Mat3.identity() : rot;
    }

    /** Nearest ray hit distance, or -1 if miss. Ray dir need not be normalized. */
    public double intersect(Vec3 ro, Vec3 rd) {
        Mat3 inv = rot.transpose();             // world -> box-local (rotation inverse = transpose)
        Vec3 lo = inv.mul(ro.sub(center));
        Vec3 ld = inv.mul(rd);
        double tn = -1e30, tf = 1e30;
        double[] o = {lo.x, lo.y, lo.z}, d = {ld.x, ld.y, ld.z}, h = {half.x, half.y, half.z};
        for (int i = 0; i < 3; i++) {
            if (Math.abs(d[i]) < 1e-9) {
                if (o[i] < -h[i] || o[i] > h[i]) return -1; // parallel & outside
            } else {
                double t1 = (-h[i] - o[i]) / d[i], t2 = (h[i] - o[i]) / d[i];
                if (t1 > t2) { double t = t1; t1 = t2; t2 = t; }
                tn = Math.max(tn, t1);
                tf = Math.min(tf, t2);
                if (tn > tf) return -1;
            }
        }
        return tf < 0 ? -1 : (tn > 0 ? tn : tf);
    }

    /** World-space AABB corners (for framing the camera). */
    public Vec3[] corners() {
        Vec3[] c = new Vec3[8];
        int k = 0;
        for (int sx = -1; sx <= 1; sx += 2)
            for (int sy = -1; sy <= 1; sy += 2)
                for (int sz = -1; sz <= 1; sz += 2)
                    c[k++] = center.add(rot.mul(new Vec3(sx * half.x, sy * half.y, sz * half.z)));
        return c;
    }
}
