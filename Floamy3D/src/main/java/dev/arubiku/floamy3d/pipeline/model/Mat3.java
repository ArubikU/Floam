package dev.arubiku.floamy3d.pipeline.model;

import java.util.Locale;

/**
 * Column-major 3x3 matrix matching the engine's {@code Rotate3(angle, axis)} exactly, so a baked
 * matrix emitted as a {@code mat3(...)} literal behaves identically to the named rotation macros.
 *
 * Storage order = GLSL constructor order: m[0..2]=col0, m[3..5]=col1, m[6..8]=col2.
 */
public final class Mat3 {
    public final double[] m;

    public Mat3(double[] m) { this.m = m; }

    public static Mat3 identity() {
        return new Mat3(new double[]{1,0,0, 0,1,0, 0,0,1});
    }

    /** Rotation about axis (0=X,1=Y,2=Z) by radians — same 9 numbers as matf.glsl Rotate3. */
    public static Mat3 rotation(int axis, double rad) {
        double c = Math.cos(rad), s = Math.sin(rad);
        return switch (axis) {
            case 0 -> new Mat3(new double[]{1,0,0,  0,c,-s,  0,s,c});   // X
            case 1 -> new Mat3(new double[]{c,0,s,  0,1,0,  -s,0,c});   // Y
            case 2 -> new Mat3(new double[]{c,-s,0, s,c,0,   0,0,1});   // Z
            default -> identity();
        };
    }

    /** Euler degrees composed as Rz * Ry * Rx (engine convention). */
    public static Mat3 euler(Vec3 deg) {
        Mat3 r = identity();
        if (deg.z != 0) r = r.mul(rotation(2, Math.toRadians(deg.z)));
        if (deg.y != 0) r = r.mul(rotation(1, Math.toRadians(deg.y)));
        if (deg.x != 0) r = r.mul(rotation(0, Math.toRadians(deg.x)));
        return r;
    }

    /** this * other (GLSL matrix product, column-major). */
    public Mat3 mul(Mat3 o) {
        double[] a = this.m, b = o.m, r = new double[9];
        for (int col = 0; col < 3; col++)
            for (int row = 0; row < 3; row++)
                r[col*3 + row] = a[0*3+row]*b[col*3+0] + a[1*3+row]*b[col*3+1] + a[2*3+row]*b[col*3+2];
        return new Mat3(r);
    }

    /** this * v. */
    public Vec3 mul(Vec3 v) {
        return new Vec3(
            m[0]*v.x + m[3]*v.y + m[6]*v.z,
            m[1]*v.x + m[4]*v.y + m[7]*v.z,
            m[2]*v.x + m[5]*v.y + m[8]*v.z);
    }

    /** Transpose = inverse for a rotation matrix. */
    public Mat3 transpose() {
        return new Mat3(new double[]{ m[0],m[3],m[6],  m[1],m[4],m[7],  m[2],m[5],m[8] });
    }

    public boolean isIdentity() {
        double[] id = {1,0,0, 0,1,0, 0,0,1};
        for (int i = 0; i < 9; i++) if (Math.abs(m[i] - id[i]) > 1e-9) return false;
        return true;
    }

    public String glsl() {
        StringBuilder sb = new StringBuilder("mat3(");
        for (int i = 0; i < 9; i++) {
            if (i > 0) sb.append(",");
            sb.append(String.format(Locale.ROOT, "%.5f", m[i]));
        }
        return sb.append(")").toString();
    }
}
