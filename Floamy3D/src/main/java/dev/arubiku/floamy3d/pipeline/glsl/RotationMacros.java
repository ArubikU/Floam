package dev.arubiku.floamy3d.pipeline.glsl;

import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Converts euler degrees into a GLSL rotation-matrix expression using the engine's
 * named macros (PIX, NIZ62, ...) where they match, falling back to Rotate3(rad, AXIS).
 *
 * NOTE (fix vs legacy FloamyConverter): the old code iterated a JS Map with Object.entries
 * and always fell through to a generic rotate. Here matching is correct and deterministic.
 */
public final class RotationMacros {
    private RotationMacros() {}

    private static final int X = 0, Y = 1, Z = 2;
    private static final char[] AXIS_CHAR = { 'X', 'Y', 'Z' };

    // fraction-of-PI -> name suffix (positive). bare=1/2, 25=1/4, 12=1/8, 62=1/16, 31=1/32, 16=1/64, 2=1, 3=3/2.
    private static final double[] FRACTIONS = { 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 1.0, 1.5 };
    private static final String[] SUFFIX    = { "",   "25",  "12",   "62",    "31",     "16",     "2",  "3" };
    private static final double TOL = 1e-3;

    /** GLSL matrix expression for the box's euler rotation; "PINULL" if zero. */
    public static String matrix(Vec3 deg) {
        List<String> factors = new ArrayList<>();
        // Blockbench order Z * Y * X
        addAxis(factors, deg.z, Z);
        addAxis(factors, deg.y, Y);
        addAxis(factors, deg.x, X);
        if (factors.isEmpty()) return "PINULL";
        return String.join("*", factors);
    }

    private static void addAxis(List<String> out, double deg, int axis) {
        if (Math.abs(deg) < 1e-6) return;
        out.add(axisMacro(deg, axis));
    }

    private static String axisMacro(double deg, int axis) {
        double frac = Math.abs(deg) / 180.0;   // fraction of PI
        boolean neg = deg < 0;
        for (int i = 0; i < FRACTIONS.length; i++) {
            if (Math.abs(frac - FRACTIONS[i]) < TOL) {
                return (neg ? "NI" : "PI") + AXIS_CHAR[axis] + SUFFIX[i];
            }
        }
        double rad = Math.toRadians(deg);
        return String.format(Locale.ROOT, "Rotate3(%.5f, %d)", rad, axis);
    }
}
