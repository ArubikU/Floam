package dev.arubiku.floamy3d.pipeline.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Engine-ready CEM model: a named set of boxes attached to a player/armor part,
 * sampling a texture of (texWidth x texHeight). Produced by the bbmodel parser,
 * consumed by the GLSL emitter and the texture baker.
 */
public final class CemModel {
    /** How the model samples its texture. */
    public enum Kind {
        COSMETIC,   // skin marker detection, direct UV (wings, elf ears, capes, player_part_override)
        ARMOR       // STASIS slot detection, atlas UV (relativeUv into the color-armor tile)
    }

    public String id;              // upper-snake identifier, e.g. ELF_EARS or LICORN_FENRIR_CHESTPLATE
    public final Part part;        // attach point
    public final int texWidth;
    public final int texHeight;
    public Kind kind = Kind.COSMETIC;
    public String sourcePart = "";   // raw source part name (e.g. JEM "left_shoe") for slot mapping
    public String bone = null;       // engine STASIS bone override from a parsers/*.jp `bone` op
    public final List<CemBox> boxes = new ArrayList<>();

    public CemModel(String id, Part part, int texWidth, int texHeight) {
        this.id = sanitize(id);
        this.part = part;
        this.texWidth = texWidth <= 0 ? 64 : texWidth;
        this.texHeight = texHeight <= 0 ? 64 : texHeight;
    }

    public boolean isAtlas() { return kind == Kind.ARMOR; }

    public static String sanitize(String raw) {
        if (raw == null || raw.isEmpty()) return "MODEL";
        String s = raw.trim().toUpperCase(java.util.Locale.ROOT)
                .replaceAll("[^A-Z0-9]+", "_")
                .replaceAll("^_+|_+$", "");
        return s.isEmpty() ? "MODEL" : s;
    }
}
