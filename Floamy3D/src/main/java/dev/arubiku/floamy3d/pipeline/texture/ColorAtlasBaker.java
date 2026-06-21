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
    public Result bakeColorAtlas(List<Entry> entries) {
        int n = Math.max(1, entries.size());
        int cols = (int) Math.ceil(Math.sqrt(n));
        int rows = (int) Math.ceil((double) n / cols);

        BufferedImage l1 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);
        BufferedImage l2 = new BufferedImage(cols * TILE_W, rows * TILE_H, BufferedImage.TYPE_INT_ARGB);

        StringBuilder glsl = new StringBuilder();
        for (int i = 0; i < entries.size(); i++) {
            Entry e = entries.get(i);
            int cx = i % cols, cy = i / cols;
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

            glsl.append(String.format(Locale.ROOT, "COLOR_ARMOR(%d, %d, %d) {\n    cords = vec2(%d, %d);\n}\n",
                    e.color[0], e.color[1], e.color[2], cx, cy));
        }
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
        BufferedImage l1 = expandWithData(r.layer1Atlas, cols, rows, dataRows, parts);
        BufferedImage l2 = expandWithData(r.layer2Atlas, cols, rows, dataRows, parts);

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
        int w = cols * 64, tileH = rows * 32;
        BufferedImage img = new BufferedImage(w, tileH + dataRows, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < tileH; y++)
            for (int x = 0; x < w; x++)
                img.setRGB(x, y, tiles.getRGB(x, y));
        // (0,0) stays the IS_LEATHER_LAYER white marker; (1,0) carries the tile grid dims.
        img.setRGB(1, 0, argb(cols, rows, 0, 255));
        new dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec().encode(img, parts, cols, rows);
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
