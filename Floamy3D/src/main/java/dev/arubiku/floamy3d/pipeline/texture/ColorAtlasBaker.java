package dev.arubiku.floamy3d.pipeline.texture;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Color-armor atlas baker (OLD delivery mode, &lt;= leather-layer versions).
 *
 * Each armor occupies one 64x32 tile in a grid atlas. A worn dyed-leather item carries the
 * armor's {@code color}; the armor shader matches that color via the generated
 * {@code COLOR_ARMOR(r,g,b){ cords = vec2(tileX,tileY); }} map and offsets UVs into the tile
 * (relativeUv + RelativeCords). Marker pixels per tile:
 *   (63,30) = layer flag: black on layer_1 (part 1 / outer), white on layer_2 (part 2 / inner)
 *   (63,31) = internal-color (enable + identity); all-zero disables the tile
 *   (0,1)   = white "this is a generated leather atlas" flag
 *
 * MODERN delivery mode (1.21.2+ equipment) does not need the atlas: each armor's layer png is
 * copied to textures/entity/equipment/humanoid[/_leggings]; see {@link #writeModernEquipment}.
 */
public final class ColorAtlasBaker {

    public static final int TILE_W = 64, TILE_H = 32;

    /** One armor's inputs for the atlas. */
    public static final class Entry {
        public final String id;
        public final int[] color;          // leather dye RGB (the COLOR_ARMOR key)
        public final int[] internalColor;  // marker (63,31) RGB
        public final BufferedImage layer1; // outer (64x32-ish)
        public final BufferedImage layer2; // inner (may be null)

        public Entry(String id, int[] color, int[] internalColor, BufferedImage layer1, BufferedImage layer2) {
            this.id = id; this.color = color; this.internalColor = internalColor;
            this.layer1 = layer1; this.layer2 = layer2;
        }
    }

    public static final class Result {
        public final BufferedImage layer1Atlas;
        public final BufferedImage layer2Atlas;
        public final String armorcordsGlsl;
        public final int cols, rows;
        Result(BufferedImage l1, BufferedImage l2, String glsl, int cols, int rows) {
            this.layer1Atlas = l1; this.layer2Atlas = l2; this.armorcordsGlsl = glsl;
            this.cols = cols; this.rows = rows;
        }
    }

    /** Bake the grid atlas + COLOR_ARMOR map for the OLD color-armor mode. */
    // Real obtainable leather-armor colors: the marker COLOR_ARMOR key must NEVER land on one of these,
    // or the shader hijacks real dyed-leather armor. Default un-dyed leather + the 16 dye base colors.
    private static final int[][] RESERVED_LEATHER = {
        {160,101,64}, // default un-dyed leather (#A06540) — the critical one
        {249,255,254},{249,128,29},{199,78,189},{58,179,218},{254,216,61},{128,199,31},
        {243,139,170},{71,79,82},{157,157,151},{22,156,156},{137,50,184},{60,68,170},
        {131,84,50},{94,124,22},{176,46,38},{29,29,33}
    };
    private static void warnIfReserved(String id, int[] c) {
        for (int[] r : RESERVED_LEATHER) {
            if (Math.abs(c[0]-r[0]) <= 4 && Math.abs(c[1]-r[1]) <= 4 && Math.abs(c[2]-r[2]) <= 4) {
                System.err.println("[Floamy3D] WARNING: armor '" + id + "' marker color (" + c[0] + "," + c[1]
                    + "," + c[2] + ") is within range of a REAL obtainable leather color (" + r[0] + "," + r[1]
                    + "," + r[2] + "). It may hijack real dyed-leather armor — pick a saturated/unnatural color.");
                return;
            }
        }
    }

    // The REAL vanilla leather armor textures (bundled), baked into tile 0 so unmatched dye colors
    // render as normal leather instead of being hijacked by a custom armor.
    private static final BufferedImage VANILLA_LEATHER_1 = loadRes("/floamy/vanilla/leather.png");
    private static final BufferedImage VANILLA_LEATHER_2 = loadRes("/floamy/vanilla/leather_leggings.png");
    private static BufferedImage loadRes(String p) {
        try (java.io.InputStream in = ColorAtlasBaker.class.getResourceAsStream(p)) {
            return in == null ? null : ImageIO.read(in);
        } catch (Exception e) { return null; }
    }

    public Result bakeColorAtlas(List<Entry> entries) {
        int n = Math.max(1, entries.size() + 1);   // +1: tile 0 reserved for the real vanilla leather
        int cols = (int) Math.ceil(Math.sqrt(n));
        int rows = (int) Math.ceil((double) n / cols);

        BufferedImage l1 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);
        BufferedImage l2 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);

        StringBuilder glsl = new StringBuilder();
        java.util.Map<Integer, String> seenColors = new java.util.HashMap<>();   // colorKey -> first armor id
        for (int i = 0; i < entries.size(); i++) {
            Entry e = entries.get(i);
            // duplicate marker color = the COLOR_ARMOR switch matches the FIRST case only -> the later
            // armor is silently overridden by the earlier one (and vice-versa for a player wearing it).
            int key = (e.color[0] << 16) | (e.color[1] << 8) | e.color[2];
            String prev = seenColors.putIfAbsent(key, e.id);
            if (prev != null)
                System.err.println("[Floamy3D] WARNING: armor '" + e.id + "' shares marker color ("
                    + e.color[0] + "," + e.color[1] + "," + e.color[2] + ") with '" + prev
                    + "' — one OVERRIDES the other. Give them distinct colors.");
            int tile = i + 1;   // tile 0 reserved for real leather; custom armors start at tile 1
            int cx = tile % cols, cy = tile / cols;
            int ox = cx * TILE_W, oy = cy * TILE_H;

            blit(l1, e.layer1, ox, oy);
            blit(l2, e.layer2 != null ? e.layer2 : e.layer1, ox, oy);

            // layer flag (63,30): black=part1, white=part2
            l1.setRGB(ox + 63, oy + 30, argb(0, 0, 0, 255));
            l2.setRGB(ox + 63, oy + 30, argb(255, 255, 255, 255));
            // internal-color (63,31)
            int ic = argb(clamp(e.internalColor, 0), clamp(e.internalColor, 1), clamp(e.internalColor, 2), 255);
            l1.setRGB(ox + 63, oy + 31, ic);
            l2.setRGB(ox + 63, oy + 31, ic);

            warnIfReserved(e.id, e.color);
            glsl.append(String.format(Locale.ROOT, "COLOR_ARMOR(%d, %d, %d) {\n    cords = vec2(%d, %d);\n}\n",
                    e.color[0], e.color[1], e.color[2], cx, cy));
        }
        // Tile 0 = REAL vanilla leather, NO marker pixels (channels read 0 -> isPartOne/Two false).
        // Unmatched dye colors fall to cords (0,0) -> this tile -> real leather renders normally
        // instead of being hijacked by an armor. (Option B fix for the leather-override bug.)
        if (VANILLA_LEATHER_1 != null) blit(l1, VANILLA_LEATHER_1, 0, 0);
        if (VANILLA_LEATHER_2 != null) blit(l2, VANILLA_LEATHER_2, 0, 0);
        l1.setRGB(63, 30, 0); l1.setRGB(63, 31, 0);   // clear markers -> no CEM on real leather
        l2.setRGB(63, 30, 0); l2.setRGB(63, 31, 0);

        // IS_LEATHER_LAYER sentinel: the shader checks pixel (0,0) == pure white to know this
        // texture is a generated color atlas (so it must run the armor path, not a plain skin).
        l1.setRGB(0, 0, argb(255, 255, 255, 255));
        l2.setRGB(0, 0, argb(255, 255, 255, 255));

        return new Result(l1, l2, glsl.toString(), cols, rows);
    }

    /** Write atlas pngs to the resourcepack. assetsRoot must be the pack's `assets` dir. */
    public void writeColorAtlas(Result r, Path assetsRoot) throws IOException {
        Path dir = assetsRoot.resolve("minecraft/textures/models/armor");
        Files.createDirectories(dir);
        ImageIO.write(r.layer1Atlas, "png", dir.resolve("leather_layer_1.png").toFile());
        ImageIO.write(r.layer2Atlas, "png", dir.resolve("leather_layer_2.png").toFile());
        // Transparent overlays so the vanilla dyeable-overlay pass renders nothing over the atlas.
        BufferedImage o1 = new BufferedImage(r.layer1Atlas.getWidth(), r.layer1Atlas.getHeight(), BufferedImage.TYPE_INT_ARGB);
        BufferedImage o2 = new BufferedImage(r.layer2Atlas.getWidth(), r.layer2Atlas.getHeight(), BufferedImage.TYPE_INT_ARGB);
        ImageIO.write(o1, "png", dir.resolve("leather_layer_1_overlay.png").toFile());
        ImageIO.write(o2, "png", dir.resolve("leather_layer_2_overlay.png").toFile());

        // 1.21.4+ moved leather armor textures to the equipment system. Same atlas, new paths:
        //   layer 1 (helmet/chest/boots) -> entity/equipment/humanoid/leather.png
        //   layer 2 (leggings)           -> entity/equipment/humanoid_leggings/leather.png
        Path eqH = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid");
        Path eqL = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid_leggings");
        Files.createDirectories(eqH);
        Files.createDirectories(eqL);
        ImageIO.write(r.layer1Atlas, "png", eqH.resolve("leather.png").toFile());
        ImageIO.write(r.layer2Atlas, "png", eqL.resolve("leather.png").toFile());
    }

    /**
     * Like {@link #writeColorAtlas} but appends the data-driven box-geometry region below the
     * color tiles (both layers carry it, so leg parts that sample layer 2 still decode). Stores
     * the tile grid (cols,rows) at pixel (1,0) so the vertex shader's tile math ignores the data.
     */
    public void writeColorAtlasWithData(Result r, Path assetsRoot,
            List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> parts) throws IOException {
        int cols = r.cols, rows = r.rows;
        int dataRows = dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.dataRows(parts, cols);
        BufferedImage l1 = expandWithData(r.layer1Atlas, cols, rows, dataRows, parts, ARMOR_3D_SCALE);
        BufferedImage l2 = expandWithData(r.layer2Atlas, cols, rows, dataRows, parts, ARMOR_3D_SCALE);

        Path dir = assetsRoot.resolve("minecraft/textures/models/armor");
        Files.createDirectories(dir);
        ImageIO.write(l1, "png", dir.resolve("leather_layer_1.png").toFile());
        ImageIO.write(l2, "png", dir.resolve("leather_layer_2.png").toFile());
        writeEmpty(dir.resolve("leather_layer_1_overlay.png").toFile(), l1.getWidth(), l1.getHeight());
        writeEmpty(dir.resolve("leather_layer_2_overlay.png").toFile(), l2.getWidth(), l2.getHeight());

        Path eqH = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid");
        Path eqL = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid_leggings");
        Files.createDirectories(eqH);
        Files.createDirectories(eqL);
        ImageIO.write(l1, "png", eqH.resolve("leather.png").toFile());
        ImageIO.write(l2, "png", eqL.resolve("leather.png").toFile());
        // 1.21.4+ leather equipment also has an UNDYED overlay layer (buckle/accents) that renders
        // over our atlas on every armor -> blank it out so only our geometry shows.
        writeEmpty(eqH.resolve("leather_overlay.png").toFile(), l1.getWidth(), l1.getHeight());
        writeEmpty(eqL.resolve("leather_overlay.png").toFile(), l2.getWidth(), l2.getHeight());
    }

    private BufferedImage expandWithData(BufferedImage tiles, int cols, int rows, int dataRows,
            List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> parts) {
        return expandWithData(tiles, cols, rows, dataRows, parts, 1.0);
    }

    private BufferedImage expandWithData(BufferedImage tiles, int cols, int rows, int dataRows,
            List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> parts, double extraScale) {
        int w = cols * 64, tileH = rows * 32;
        BufferedImage img = new BufferedImage(w, tileH + dataRows, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < tileH; y++)
            for (int x = 0; x < w; x++)
                img.setRGB(x, y, tiles.getRGB(x, y));
        // (0,0) stays the IS_LEATHER_LAYER white marker; (1,0) carries the tile grid dims.
        img.setRGB(1, 0, argb(cols, rows, 0, 255));
        var codec = new dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec();
        codec.extraScale = extraScale;
        codec.encode(img, parts, cols, rows);
        return img;
    }

    private void writeEmpty(java.io.File f, int w, int h) throws IOException {
        ImageIO.write(new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB), "png", f);
    }

    /** Modern delivery: copy each armor's layers to the equipment texture paths (1.21.2+). */
    public void writeModernEquipment(List<Entry> entries, Path assetsRoot) throws IOException {
        Path humanoid = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid");
        Path leggings = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid_leggings");
        Files.createDirectories(humanoid);
        Files.createDirectories(leggings);
        for (Entry e : entries) {
            ImageIO.write(e.layer1, "png", humanoid.resolve(e.id + ".png").toFile());
            if (e.layer2 != null) ImageIO.write(e.layer2, "png", leggings.resolve(e.id + ".png").toFile());
        }
    }

    /**
     * Modern delivery WITH 3D CEM. Each armor's equipment texture is a SELF-CONTAINED 1-tile atlas:
     * sentinel (0,0)=white, grid (1,0)=(1,1), markers (63,30) layer-flag + (63,31) internal-color,
     * plus the appended data region (this armor's box geometry). The equipment item carries no dyed
     * color, so the shader's RelativeCords stays (0,0) -> it reads THIS tile's markers -> armor.glsl
     * matches the internal-color -> ray-marches. No shader change needed.
     */
    /** Uniform shrink for the 3D armor geometry (both the dyed-leather atlas and equipment-id paths). */
    private static final double ARMOR_3D_SCALE = 0.80;

    public void writeEquipmentCem(List<Entry> entries,
            java.util.Map<String, List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part>> partsByArmor,
            Path assetsRoot) throws IOException {
        Path humanoid = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid");
        Path leggings = assetsRoot.resolve("minecraft/textures/entity/equipment/humanoid_leggings");
        Files.createDirectories(humanoid);
        Files.createDirectories(leggings);
        for (Entry e : entries) {
            List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> parts =
                    partsByArmor.getOrDefault(e.id, java.util.List.of());
            // The index row maps part = cemId-BASE at x = part % (cols*64). dataY0 is hardcoded indexY+1
            // (1 index row), so cols MUST be wide enough that maxPart < cols*64 — else the index spills
            // onto a 2nd row that the data then overwrites, corrupting the decode (armor renders nothing).
            int maxPart = 0;
            for (var p : parts) maxPart = Math.max(maxPart, p.cemId - dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.BASE);
            int cols = Math.max(1, maxPart / TILE_W + 1);
            // 2 tile-rows (armor at tile 0, row 1 left EMPTY): the shader maps the model UV V over 1/rows of
            // the texture height. With rows=1 that V range spills into the data region below the single tile
            // -> flat (non-billboard) faces sample the encoded data as color (the leggings artifact). rows=2
            // pushes the data below the V range, into the empty buffer row instead.
            int rows = 2;
            int ic = argb(clamp(e.internalColor, 0), clamp(e.internalColor, 1), clamp(e.internalColor, 2), 255);
            BufferedImage l1 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);
            blit(l1, e.layer1, 0, 0);
            l1.setRGB(63, 30, argb(0, 0, 0, 255));            // layer flag: part 1
            l1.setRGB(63, 31, ic);                             // internal-color marker
            l1.setRGB(0, 0, argb(255, 255, 255, 255));         // IS_LEATHER_LAYER sentinel
            BufferedImage l2 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);
            blit(l2, e.layer2 != null ? e.layer2 : e.layer1, 0, 0);
            l2.setRGB(63, 30, argb(255, 255, 255, 255));       // layer flag: part 2
            l2.setRGB(63, 31, ic);
            l2.setRGB(0, 0, argb(255, 255, 255, 255));
            int dataRows = dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.dataRows(parts, cols);
            BufferedImage l1d = expandWithData(l1, cols, rows, dataRows, parts, ARMOR_3D_SCALE);
            BufferedImage l2d = expandWithData(l2, cols, rows, dataRows, parts, ARMOR_3D_SCALE);
            ImageIO.write(l1d, "png", humanoid.resolve(e.id + ".png").toFile());
            ImageIO.write(l2d, "png", leggings.resolve(e.id + ".png").toFile());
        }
    }

    public static BufferedImage read(File png) throws IOException {
        return ImageIO.read(png);
    }

    // ---- helpers ----
    private static void blit(BufferedImage dst, BufferedImage src, int ox, int oy) {
        if (src == null) return;
        int w = Math.min(src.getWidth(), TILE_W), h = Math.min(src.getHeight(), TILE_H);
        for (int y = 0; y < h; y++)
            for (int x = 0; x < w; x++)
                dst.setRGB(ox + x, oy + y, src.getRGB(x, y));
    }

    private static int argb(int r, int g, int b, int a) {
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    private static int clamp(int[] c, int i) {
        if (c == null || i >= c.length) return 0;
        return Math.max(0, Math.min(255, c[i]));
    }
}
