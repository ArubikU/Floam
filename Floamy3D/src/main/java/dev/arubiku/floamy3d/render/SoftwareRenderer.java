package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.util.List;

/**
 * Tiny orthographic ray-caster used to validate generated geometry without Minecraft. Renders a
 * set of {@link OrientedBox}es from the front (+Z), side (+X) and top (+Y) into occupancy masks,
 * so two independent constructions of the same model can be compared by silhouette IoU.
 */
public final class SoftwareRenderer {
    public enum View { FRONT, SIDE, TOP }

    private final int n; // image resolution
    public SoftwareRenderer(int n) { this.n = n; }

    /** Occupancy mask: true where any box is hit. Bounds are framed to the union of all boxes. */
    public boolean[][] render(List<OrientedBox> boxes, View view) {
        boolean[][] mask = new boolean[n][n];
        if (boxes.isEmpty()) return mask;

        // world AABB
        double minA = 1e30, minB = 1e30, maxA = -1e30, maxB = -1e30;
        double minD = 1e30, maxD = -1e30;
        for (OrientedBox b : boxes)
            for (Vec3 c : b.corners()) {
                double[] ab = planeCoords(view, c);
                minA = Math.min(minA, ab[0]); maxA = Math.max(maxA, ab[0]);
                minB = Math.min(minB, ab[1]); maxB = Math.max(maxB, ab[1]);
                double dd = depthCoord(view, c);
                minD = Math.min(minD, dd); maxD = Math.max(maxD, dd);
            }
        double pad = 0.5;
        minA -= pad; maxA += pad; minB -= pad; maxB += pad;
        double span = Math.max(maxA - minA, maxB - minB);
        if (span <= 0) return mask;

        Vec3 rd = rayDir(view);
        double far = (maxD - minD) + 10;
        for (int iy = 0; iy < n; iy++) {
            for (int ix = 0; ix < n; ix++) {
                double a = minA + (ix + 0.5) / n * span;
                double b = minB + (n - 1 - iy + 0.5) / n * span; // flip Y for image-space
                Vec3 ro = originFor(view, a, b, maxD + 5);
                double best = 1e30;
                for (OrientedBox box : boxes) {
                    double t = box.intersect(ro, rd);
                    if (t > 0 && t < best) best = t;
                }
                if (best < 1e29 && best < far + 10) mask[iy][ix] = true;
            }
        }
        return mask;
    }

    /** Intersection-over-union of two masks. */
    public static double iou(boolean[][] a, boolean[][] b) {
        int inter = 0, union = 0;
        for (int y = 0; y < a.length; y++)
            for (int x = 0; x < a[0].length; x++) {
                boolean pa = a[y][x], pb = b[y][x];
                if (pa || pb) union++;
                if (pa && pb) inter++;
            }
        return union == 0 ? 1.0 : (double) inter / union;
    }

    // --- view helpers: A,B = image plane axes; depth = camera axis ---
    private double[] planeCoords(View v, Vec3 c) {
        return switch (v) {
            case FRONT -> new double[]{c.x, c.y};
            case SIDE  -> new double[]{c.z, c.y};
            case TOP   -> new double[]{c.x, c.z};
        };
    }
    private double depthCoord(View v, Vec3 c) {
        return switch (v) { case FRONT -> c.z; case SIDE -> c.x; case TOP -> c.y; };
    }
    private Vec3 rayDir(View v) {
        return switch (v) {
            case FRONT -> new Vec3(0, 0, -1);
            case SIDE  -> new Vec3(-1, 0, 0);
            case TOP   -> new Vec3(0, -1, 0);
        };
    }
    private Vec3 originFor(View v, double a, double b, double d) {
        return switch (v) {
            case FRONT -> new Vec3(a, b, d);
            case SIDE  -> new Vec3(d, b, a);
            case TOP   -> new Vec3(a, d, b);
        };
    }
}
