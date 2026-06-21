package dev.arubiku.floamy3d.pipeline.model;

/** Immutable 3D vector with pixel-space helpers. */
public final class Vec3 {
    public final double x, y, z;

    public Vec3(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public static Vec3 of(double[] a) {
        if (a == null || a.length < 3) return new Vec3(0, 0, 0);
        return new Vec3(a[0], a[1], a[2]);
    }

    public Vec3 add(Vec3 o)        { return new Vec3(x + o.x, y + o.y, z + o.z); }
    public Vec3 sub(Vec3 o)        { return new Vec3(x - o.x, y - o.y, z - o.z); }
    public Vec3 mul(double s)      { return new Vec3(x * s, y * s, z * s); }
    public Vec3 mid(Vec3 o)        { return new Vec3((x + o.x) / 2, (y + o.y) / 2, (z + o.z) / 2); }
    public Vec3 halfExtent(Vec3 o) { return new Vec3(Math.abs(o.x - x) / 2, Math.abs(o.y - y) / 2, Math.abs(o.z - z) / 2); }
    public boolean isZero()        { return x == 0 && y == 0 && z == 0; }

    /** GLSL literal, e.g. vec3(1.0000,2.0000,3.0000). */
    public String glsl() {
        return String.format(java.util.Locale.ROOT, "vec3(%.4f,%.4f,%.4f)", x, y, z);
    }

    @Override public String toString() { return glsl(); }
}
