package dev.arubiku.floamy3d.pipeline.model;

/**
 * Player / armor attachment part. The shader registry attaches a CEM model to one of these.
 * Names match the body-part vocabulary used by the engine (cem_locs).
 */
public enum Part {
    HEAD,
    BODY,
    RIGHT_ARM,
    LEFT_ARM,
    RIGHT_LEG,
    LEFT_LEG,
    // armor-only slots (rendered through the armor path)
    HELMET,
    CHESTPLATE,
    LEGGINGS,
    BOOTS;

    /** Best-effort mapping from a Blockbench group/outliner name. Defaults to BODY. */
    public static Part fromName(String raw) {
        if (raw == null) return BODY;
        String s = raw.toLowerCase(java.util.Locale.ROOT);
        if (s.contains("head") || s.contains("helmet") || s.contains("hat")) return HEAD;
        if (s.contains("chest") || s.contains("torso") || s.contains("body")) return BODY;
        if (s.contains("right") && s.contains("arm")) return RIGHT_ARM;
        if (s.contains("left") && s.contains("arm"))  return LEFT_ARM;
        if (s.contains("right") && (s.contains("leg") || s.contains("boot") || s.contains("foot") || s.contains("shoe"))) return RIGHT_LEG;
        if (s.contains("left") && (s.contains("leg") || s.contains("boot") || s.contains("foot") || s.contains("shoe")))  return LEFT_LEG;
        if (s.contains("leg")) return LEFT_LEG;
        if (s.contains("arm")) return LEFT_ARM;
        return BODY;
    }

    /** EDIT_* macro name used by the detection snippet to keep the part from being culled. */
    public String editMacro() {
        switch (this) {
            case HEAD: return "EDIT_HEAD";
            case RIGHT_ARM: return "EDIT_ARM_RIGHT";
            case LEFT_ARM:  return "EDIT_ARM_LEFT";
            case RIGHT_LEG: return "EDIT_LEG_RIGHT";
            case LEFT_LEG:  return "EDIT_LEG_LEFT";
            default: return "EDIT_BODY";
        }
    }

    /** The cube id the detection compares against (engine body-part constant). */
    public String cubeConstant() {
        switch (this) {
            case HEAD: return "HEAD";
            case RIGHT_ARM: return "RIGHT_ARM";
            case LEFT_ARM:  return "LEFT_ARM";
            case RIGHT_LEG: return "RIGHT_LEG";
            case LEFT_LEG:  return "LEFT_LEG";
            default: return "BODY";
        }
    }
}
