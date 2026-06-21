package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.awt.image.BufferedImage;
import java.util.List;

/**
 * Orthographic textured raycaster — renders {@link TexturedBox}es to an ARGB image so generated
 * armor/cosmetic geometry can be previewed with its real texture, offline. Same camera framing as
 * {@link SoftwareRenderer} (front/side/top).
 */
public final class TexturedRenderer {
    private final int n;
    private final Vec3 light = norm(new Vec3(-0.4, -0.7, -0.6));

    public TexturedRenderer(int n) { this.n = n; }

    public BufferedImage render(List<TexturedBox> boxes, SoftwareRenderer.View view) {
        BufferedImage img = new BufferedImage(n, n, BufferedImage.TYPE_INT_ARGB);
        if (boxes.isEmpty()) return img;

        double minA = 1e30, minB = 1e30, maxA = -1e30, maxB = -1e30, maxD = -1e30;
        for (TexturedBox b : boxes) {
            OrientedBox ob = new OrientedBox(b.center, b.half, b.rot);
            for (Vec3 c : ob.corners()) {
                double[] ab = plane(view, c);
                minA = Math.min(minA, ab[0]); maxA = Math.max(maxA, ab[0]);
                minB = Math.min(minB, ab[1]); maxB = Math.max(maxB, ab[1]);
                maxD = Math.max(maxD, depth(view, c));
            }
        }
        double pad = 0.5; minA -= pad; maxA += pad; minB -= pad; maxB += pad;
        double span = Math.max(maxA - minA, maxB - minB);
        if (span <= 0) return img;
        Vec3 rd = dir(view);

        for (int iy = 0; iy < n; iy++)
            for (int ix = 0; ix < n; ix++) {
                double a = minA + (ix + 0.5) / n * span;
                double b = minB + (n - 1 - iy + 0.5) / n * span;
                Vec3 ro = origin(view, a, b, maxD + 5);
                double best = 1e30; int color = 0;
                for (TexturedBox box : boxes) {
                    TexturedBox.Hit hit = box.intersect(ro, rd, light);
                    if (hit != null && hit.t > 0 && hit.t < best) { best = hit.t; color = hit.argb; }
                }
                img.setRGB(ix, iy, color);
            }
        return img;
    }

    private double[] plane(SoftwareRenderer.View v, Vec3 c) {
        return switch (v) { case FRONT -> new double[]{c.x, c.y}; case SIDE -> new double[]{c.z, c.y}; case TOP -> new double[]{c.x, c.z}; };
    }
    private double depth(SoftwareRenderer.View v, Vec3 c) { return switch (v) { case FRONT -> c.z; case SIDE -> c.x; case TOP -> c.y; }; }
    private Vec3 dir(SoftwareRenderer.View v) { return switch (v) { case FRONT -> new Vec3(0,0,-1); case SIDE -> new Vec3(-1,0,0); case TOP -> new Vec3(0,-1,0); }; }
    private Vec3 origin(SoftwareRenderer.View v, double a, double b, double d) {
        return switch (v) { case FRONT -> new Vec3(a,b,d); case SIDE -> new Vec3(d,b,a); case TOP -> new Vec3(a,d,b); };
    }
    private static Vec3 norm(Vec3 v) { double l = Math.sqrt(v.x*v.x+v.y*v.y+v.z*v.z); return new Vec3(v.x/l, v.y/l, v.z/l); }
}
