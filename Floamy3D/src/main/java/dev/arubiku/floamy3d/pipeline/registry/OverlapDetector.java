package dev.arubiku.floamy3d.pipeline.registry;

import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.FaceUV;

import java.util.ArrayList;
import java.util.List;

/**
 * Detects whether two cosmetics would conflict on a player, so the user can be warned that
 * wearing one removes the other.
 *
 * Conflict sources (skin cosmetics share one 64x64 skin texture):
 *  1. Same marker pixel — only one value can live in a skin pixel, so two cosmetics that use the
 *     same marker pixel (typically same attach part) are mutually exclusive.
 *  2. Overlapping UV footprint — their face texture rectangles intersect, so they would read /
 *     paint the same skin pixels and visually fight.
 *
 * Armor models sample their own atlas texture (kind ARMOR), so they are not skin-overlap checked.
 */
public final class OverlapDetector {

    /** Axis-aligned texture rectangle (pixel space), always normalized to non-negative size. */
    public static final class Rect {
        public final int x, y, w, h;
        public Rect(int x, int y, int w, int h) { this.x = x; this.y = y; this.w = w; this.h = h; }
        public boolean intersects(Rect o) {
            return x < o.x + o.w && o.x < x + w && y < o.y + o.h && o.y < y + h;
        }
        public Rect intersection(Rect o) {
            int nx = Math.max(x, o.x), ny = Math.max(y, o.y);
            int nx2 = Math.min(x + w, o.x + o.w), ny2 = Math.min(y + h, o.y + o.h);
            return new Rect(nx, ny, Math.max(0, nx2 - nx), Math.max(0, ny2 - ny));
        }
        @Override public String toString() { return "[" + x + "," + y + " " + w + "x" + h + "]"; }
    }

    public static final class Result {
        public final boolean conflict;
        public final boolean sameMarker;
        public final boolean uvOverlap;
        public final List<Rect> overlaps;
        public final String reason;
        Result(boolean sameMarker, boolean uvOverlap, List<Rect> overlaps, String reason) {
            this.sameMarker = sameMarker;
            this.uvOverlap = uvOverlap;
            this.overlaps = overlaps;
            this.conflict = sameMarker || uvOverlap;
            this.reason = reason;
        }
    }

    /** The face UV rectangles a model reads on its texture. */
    public List<Rect> footprint(CemModel model) {
        List<Rect> rects = new ArrayList<>();
        for (CemBox box : model.boxes) {
            for (FaceUV f : box.faces) {
                if (f == null || !f.enabled) continue;
                int x = (int) Math.floor(Math.min(f.x, f.x + f.w));
                int y = (int) Math.floor(Math.min(f.y, f.y + f.h));
                int w = (int) Math.ceil(Math.abs(f.w));
                int h = (int) Math.ceil(Math.abs(f.h));
                if (w > 0 && h > 0) rects.add(new Rect(x, y, w, h));
            }
        }
        return rects;
    }

    /** All intersecting rectangles between two footprints. */
    public List<Rect> uvOverlaps(CemModel a, CemModel b) {
        List<Rect> out = new ArrayList<>();
        List<Rect> fa = footprint(a), fb = footprint(b);
        for (Rect ra : fa)
            for (Rect rb : fb)
                if (ra.intersects(rb)) out.add(ra.intersection(rb));
        return out;
    }

    /**
     * Check two registered cosmetics for conflict.
     * @return a {@link Result}; {@code conflict} true means wearing one removes the other.
     */
    public Result detect(Registry.Entry a, Registry.Entry b) {
        return detect(a.markerX, a.markerY, footprint(a.model), b.markerX, b.markerY, footprint(b.model));
    }

    /** Marker + precomputed footprint variant (used at runtime where models aren't kept). */
    public Result detect(int ax, int ay, List<Rect> fa, int bx, int by, List<Rect> fb) {
        boolean sameMarker = ax == bx && ay == by;
        List<Rect> overlaps = new ArrayList<>();
        for (Rect ra : fa)
            for (Rect rb : fb)
                if (ra.intersects(rb)) overlaps.add(ra.intersection(rb));
        boolean uv = !overlaps.isEmpty();

        StringBuilder reason = new StringBuilder();
        if (sameMarker)
            reason.append("share marker pixel (").append(ax).append(",").append(ay)
                  .append(") — same attach part");
        if (uv) {
            if (reason.length() > 0) reason.append("; ");
            reason.append("UV footprints overlap on the skin (").append(overlaps.size()).append(" region(s))");
        }
        if (reason.length() == 0) reason.append("no conflict");
        return new Result(sameMarker, uv, overlaps, reason.toString());
    }
}
