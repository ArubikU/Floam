package dev.arubiku.floamy3d.pipeline.model;

/**
 * A single box in CEM model space (centered, pixel units, +Y up).
 * Faces are stored in the engine's natural order: DOWN, UP, NORTH, EAST, SOUTH, WEST.
 */
public final class CemBox {
    public static final int DOWN = 0, UP = 1, NORTH = 2, EAST = 3, SOUTH = 4, WEST = 5;

    public final Vec3 center;     // box center / position arg passed to ADD_BOX
    public final Vec3 half;       // size arg passed to ADD_BOX (sBox treats it as half-extent)
    public final Vec3 rotation;   // euler degrees (Z*Y*X), may be zero
    public final Vec3 pivot;      // rotation pivot, relative to center (zero = rotate about center)
    public final boolean mirror;  // whole-box horizontal mirror (mirrorTexture "u" / left side)
    public final FaceUV[] faces;  // length 6, indexed by the constants above
    /**
     * Optional base rotation macro prepended to the euler rotation, e.g. "PIX" for the
     * OptiFine(JEM)->CEM space transform. Null for native bbmodel (already in CEM space).
     */
    public final String baseRotation;
    /**
     * Inverted / inside-out cube: render the back faces too (shell geometry, hollow parts).
     * Emits the EXT macro family (sBoxExt -> boxIntersectInv fallback) instead of the plain box.
     */
    public final boolean ext;
    /** Uniform size multiplier applied at emit (armor fit factor, ~0.75..1.0). */
    public final double scale;
    /**
     * Baked composed rotation from a hierarchical (submodel) flatten. When non-null and not
     * identity, the emitter uses this as a mat3 literal (after any base rotation) instead of the
     * euler {@link #rotation}. {@link #center} is then already pre-rotated (Rᵀ·worldCenter) so the
     * box lands at the right place AND orientation — correct parent-relative attachment.
     */
    public final Mat3 rotMatrix;

    public CemBox(Vec3 center, Vec3 half, Vec3 rotation, Vec3 pivot, boolean mirror, FaceUV[] faces) {
        this(center, half, rotation, pivot, mirror, faces, null, false, 1.0);
    }

    public CemBox(Vec3 center, Vec3 half, Vec3 rotation, Vec3 pivot, boolean mirror, FaceUV[] faces, String baseRotation) {
        this(center, half, rotation, pivot, mirror, faces, baseRotation, false, 1.0);
    }

    public CemBox(Vec3 center, Vec3 half, Vec3 rotation, Vec3 pivot, boolean mirror, FaceUV[] faces,
                  String baseRotation, boolean ext) {
        this(center, half, rotation, pivot, mirror, faces, baseRotation, ext, 1.0);
    }

    public CemBox(Vec3 center, Vec3 half, Vec3 rotation, Vec3 pivot, boolean mirror, FaceUV[] faces,
                  String baseRotation, boolean ext, double scale) {
        this(center, half, rotation, pivot, mirror, faces, baseRotation, ext, scale, null);
    }

    public CemBox(Vec3 center, Vec3 half, Vec3 rotation, Vec3 pivot, boolean mirror, FaceUV[] faces,
                  String baseRotation, boolean ext, double scale, Mat3 rotMatrix) {
        this.center = center;
        this.half = half;
        this.rotation = rotation == null ? new Vec3(0, 0, 0) : rotation;
        this.pivot = pivot == null ? new Vec3(0, 0, 0) : pivot;
        this.mirror = mirror;
        this.faces = faces;
        this.baseRotation = baseRotation;
        this.ext = ext;
        this.scale = scale;
        this.rotMatrix = rotMatrix;
    }

    /** Copy with a different center (used to shift a whole part when centering its main box). */
    public CemBox withCenter(Vec3 c) {
        return new CemBox(c, half, rotation, pivot, mirror, faces, baseRotation, ext, scale, rotMatrix);
    }

    public boolean hasRotation() { return !rotation.isZero(); }
    public boolean hasMatrix() { return rotMatrix != null && !rotMatrix.isIdentity(); }
    public boolean hasBaseRotation() { return baseRotation != null && !baseRotation.isEmpty(); }
    /** Whether this box needs the rotate-capable macro (base transform, matrix, euler, face rot or mirror). */
    public boolean needsRotateMacro() { return hasMatrix() || hasRotation() || hasBaseRotation(); }
}
