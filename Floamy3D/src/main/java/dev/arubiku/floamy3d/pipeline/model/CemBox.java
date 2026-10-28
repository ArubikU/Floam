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

    /** Per-axis GLSL animation formulas (render space) generated into cos_anim_*; null = none.
     *  animRot = radians onto the orbit; animPos = position delta; animSize = half-extent delta. */
    public String[] animRot, animPos, animSize;

    /** Source cube/group name (for the `.jp` `submatch <glob>` selector). */
    public String name = "";

    /** Emissive intensity 0..1 (mix toward full-bright, unlit); -1 = not emissive. From a bone named
     *  {@code e_<name>} (defaults to 1.0), optional {@code _e:<value>} suffix overrides the value. */
    public double emissive = -1.0;

    /** Transparency/alpha 0..1 (multiplies the box color alpha); -1 = opaque. From a bone named
     *  {@code t_<name>} (defaults to 0.5), optional {@code _t:<value>} suffix overrides the alpha. */
    public double transparency = -1.0;

    /** Parse the {@code e_<name>[..._e:<value>]} emissive convention. -1 = none. */
    public static double parseEmissive(String name) { return parsePrefixed(name, "e_", "_e:", 1.0); }
    /** Parse the {@code t_<name>[..._t:<value>]} transparency convention. -1 = none. */
    public static double parseTransparency(String name) { return parsePrefixed(name, "t_", "_t:", 0.5); }

    /** Shared {@code <prefix><name>[<suffix><value>]} parser over a "/"-joined ancestor path. -1 = none. */
    private static double parsePrefixed(String name, String prefix, String suffix, double def) {
        if (name == null) return -1.0;
        for (String seg : name.toLowerCase(java.util.Locale.ROOT).split("/")) {
            if (!seg.startsWith(prefix)) continue;
            double val = def;
            int i = seg.lastIndexOf(suffix);
            if (i >= 0) { try { val = Double.parseDouble(seg.substring(i + suffix.length()).trim()); } catch (NumberFormatException ignored) {} }
            return Math.max(0.0, Math.min(1.0, val));
        }
        return -1.0;
    }

    /** Bone/group orbit pivot in bbmodel space (bone-localized), for whole-bone rotation/animation.
     *  Null = rotate about the box centre. Set by the cosmetic extractor; consumed (scene-transformed
     *  + swapped + conjugated into rotMatrix) by Floamy3DRuntime.applyJpToCosmetic. */
    public Vec3 groupPivot = null;
    /** Group/bone euler (deg, bbmodel) that ORBITS groupPivot — kept separate from the box's own
     *  rotation so `rotate` stays in-place while the bone rotation (and its animation) orbits. */
    public Vec3 groupRot = new Vec3(0, 0, 0);

    /** Render-space matrices for the data-driven cosmetic decode: own (in-place orientation) + orbit
     *  (rotates the box around bonePivotRender). */
    public Mat3 ownMatrix, orbitMatrix;
    public Vec3 bonePivotRender;

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
        CemBox b = new CemBox(c, half, rotation, pivot, mirror, faces, baseRotation, ext, scale, rotMatrix);
        b.animRot = animRot; b.animPos = animPos; b.animSize = animSize;
        return b;
    }

    public boolean hasRotation() { return !rotation.isZero(); }
    public boolean hasMatrix() { return rotMatrix != null && !rotMatrix.isIdentity(); }
    public boolean hasBaseRotation() { return baseRotation != null && !baseRotation.isEmpty(); }
    /** Whether this box needs the rotate-capable macro (base transform, matrix, euler, face rot or mirror). */
    public boolean needsRotateMacro() { return hasMatrix() || hasRotation() || hasBaseRotation(); }
}
