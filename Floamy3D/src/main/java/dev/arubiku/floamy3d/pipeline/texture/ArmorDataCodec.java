package dev.arubiku.floamy3d.pipeline.texture;

import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.FaceUV;
import dev.arubiku.floamy3d.pipeline.model.Mat3;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.awt.image.BufferedImage;
import java.util.List;

/**
 * Data-driven armor: instead of unrolling every armor box into a giant per-pixel {@code switch}
 * in the fragment shader (one {@code case} per cem id, slow to compile across ~15 pipelines), we
 * encode every box's geometry into a DATA REGION of the leather atlas (Sampler0 — the only texture
 * reliably bound to vanilla entity shaders). The fragment shader runs ONE generic decode+draw loop.
 *
 * <p>Byte layout (must match {@code mods/armor/datadriven.glsl} exactly):
 * <pre>
 *   atlas = [ tileCols*64  x  tileRows*32 ]  color tiles (unchanged)
 *           + row  y=tileRows*32          :  INDEX, pixel x = (cemId - BASE):
 *                                              R,G = first box ordinal (16-bit, hi,lo)
 *                                              B   = box count ; A = 255 (valid)
 *           + rows y=tileRows*32 + 1 ...   :  BOX DATA, row-major, {@value #PIX_PER_BOX} px/box.
 *   Each box = {@value #SCALARS} scalars, 2 per pixel (R,G = scalar k; B,A = scalar k+1),
 *   each scalar a 16-bit fixed point over [-RANGE, RANGE]:
 *     [0..2]   center.xyz
 *     [3..5]   size.xyz            (= half-extent * scale)
 *     [6..14]  rotation mat3 R     (column-major, R = PIX [* euler|matrix])
 *     [15..38] 6 faces (u,d,n,w,s,e) x (x,y,w,h)  -> relativeUv args
 *     [39]     flags               (bit0 = ext)
 * </pre>
 */
public final class ArmorDataCodec {

    public static final int BASE = 1000;          // cem id of the first armor part
    public static final int PIX_PER_BOX = 20;     // ceil(SCALARS / 2)
    public static final int SCALARS = 40;
    public static final double RANGE = 64.0;      // fixed-point half-range

    /** One armor part: its cem id, the boxes that make it up, and its body side. */
    public static final class Part {
        public final int cemId;
        public final List<CemBox> boxes;
        public final int side;   // 0 = center, 1 = left, 2 = right (for L/R disambiguation via UV mirror)
        public Part(int cemId, List<CemBox> boxes) { this(cemId, boxes, 0); }
        public Part(int cemId, List<CemBox> boxes, int side) { this.cemId = cemId; this.boxes = boxes; this.side = side; }
    }

    /** Rows of data this part list needs below the color tiles (index row + box rows). */
    public static int dataRows(List<Part> parts, int tileCols) {
        int w = Math.max(1, tileCols * 64);
        int totalBoxes = 0, maxPart = 0;
        for (Part p : parts) { totalBoxes += p.boxes.size(); maxPart = Math.max(maxPart, p.cemId - BASE); }
        int indexRows = 1 + (maxPart) / w;                       // index pixels span at least one row
        int dataPixels = totalBoxes * PIX_PER_BOX;
        int boxRows = (dataPixels + w - 1) / w;
        return indexRows + boxRows;
    }

    /**
     * Encode the parts into the atlas image (which must already be tall enough — see dataRows()).
     * tileRows/tileCols describe the color-tile grid occupying the top of the image.
     */
    public void encode(BufferedImage atlas, List<Part> parts, int tileCols, int tileRows) {
        int w = tileCols * 64;
        int indexY = tileRows * 32;
        int dataY0 = indexY + 1;

        // ---- index row ----
        int ordinal = 0;
        // sort-independent: write each part's (firstOrdinal,count) at x = cemId-BASE
        // first pass assigns ordinals in part order
        int[] firstOrd = new int[parts.size()];
        for (int i = 0; i < parts.size(); i++) { firstOrd[i] = ordinal; ordinal += parts.get(i).boxes.size(); }
        for (int i = 0; i < parts.size(); i++) {
            Part p = parts.get(i);
            int x = p.cemId - BASE;
            int px = x % w, py = indexY + x / w;
            int start = firstOrd[i], count = p.boxes.size();
            atlas.setRGB(px, py, argb(start >> 8 & 255, start & 255, count & 255, 255));
        }

        // ---- box data ----
        int boxOrd = 0;
        for (Part p : parts) {
            for (CemBox b : p.boxes) {
                double[] s = scalars(b);
                int base = boxOrd * PIX_PER_BOX;
                for (int k = 0; k < PIX_PER_BOX; k++) {
                    int s0 = 2 * k, s1 = 2 * k + 1;
                    int[] a = enc(s0 < SCALARS ? s[s0] : 0);
                    int[] c = enc(s1 < SCALARS ? s[s1] : 0);
                    int lp = base + k;
                    atlas.setRGB(lp % w, dataY0 + lp / w, argb(a[0], a[1], c[0], c[1]));
                }
                boxOrd++;
            }
        }
    }

    /** The 40 scalars for one box, in the documented order. */
    private double[] scalars(CemBox b) {
        double[] s = new double[SCALARS];
        int i = 0;
        s[i++] = b.center.x; s[i++] = b.center.y; s[i++] = b.center.z;
        // clamp to a tiny min: a zero-extent box (flat "plane" spikes, e.g. masaki) makes the shader's
        // 1/rd box intersect divide by zero -> NaN -> a stray vertex stretching to screen origin.
        Vec3 size = new Vec3(Math.max(b.half.x * b.scale, 0.01), Math.max(b.half.y * b.scale, 0.01), Math.max(b.half.z * b.scale, 0.01));
        s[i++] = size.x; s[i++] = size.y; s[i++] = size.z;
        Mat3 R = rotation(b);
        double[] m = R.m;                          // same order GlslEmitter feeds to mat3(...)
        for (int j = 0; j < 9; j++) s[i++] = m[j];   // -> scalars 6..14
        s[i++] = b.ext ? 1 : 0;                      // flag at scalar 15 (so faces start on px boundary)
        // faces 16..39 (6 faces x 4), order u, d, n, w, s, e — the lazy-read split reads px8..19 here.
        int[] order = {CemBox.UP, CemBox.DOWN, CemBox.NORTH, CemBox.WEST, CemBox.SOUTH, CemBox.EAST};
        for (int f : order) {
            FaceUV fu = b.faces[f];
            if (fu != null && fu.enabled) { s[i++] = fu.x; s[i++] = fu.y; s[i++] = fu.w; s[i++] = fu.h; }
            else { s[i++] = 0; s[i++] = 0; s[i++] = 0; s[i++] = 0; }
        }
        return s;
    }

    /** Reproduce GlslEmitter.composeRotation: R = PIX [* (rotMatrix | euler(mirror flip x))]. */
    private Mat3 rotation(CemBox b) {
        Mat3 pix = Mat3.rotation(0 /*X*/, Math.PI * 0.5);   // PIX
        Mat3 extra = null;
        if (b.hasMatrix()) extra = b.rotMatrix;
        else if (b.hasRotation()) {
            Vec3 r = b.mirror ? new Vec3(-b.rotation.x, b.rotation.y, b.rotation.z) : b.rotation;
            extra = Mat3.euler(r);
        }
        boolean base = b.hasBaseRotation();             // "PIX" for armor
        if (base && extra != null) return pix.mul(extra);
        if (base) return pix;
        if (extra != null) return extra;
        return Mat3.identity();
    }

    private static int[] enc(double v) {
        int u = (int) Math.round((v + RANGE) / (2 * RANGE) * 65535.0);
        if (u < 0) u = 0; if (u > 65535) u = 65535;
        return new int[]{u >> 8 & 255, u & 255};
    }

    private static int argb(int r, int g, int b, int a) {
        return (a << 24) | (r << 16) | (g << 8) | b;
    }
}
