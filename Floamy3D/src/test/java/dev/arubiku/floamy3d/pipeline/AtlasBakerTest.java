package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker;
import org.junit.jupiter.api.Test;

import java.awt.image.BufferedImage;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AtlasBakerTest {

    private BufferedImage solid(int rgb) {
        BufferedImage img = new BufferedImage(64, 32, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < 32; y++) for (int x = 0; x < 64; x++) img.setRGB(x, y, 0xFF000000 | rgb);
        return img;
    }

    @Test
    void bakesGridAtlasAndCords() {
        var baker = new ColorAtlasBaker();
        var e1 = new ColorAtlasBaker.Entry("a", new int[]{255, 4, 255}, new int[]{0, 180, 0}, solid(0x112233), solid(0x445566));
        var e2 = new ColorAtlasBaker.Entry("b", new int[]{10, 20, 30}, new int[]{1, 2, 3}, solid(0x778899), null);
        var r = baker.bakeColorAtlas(List.of(e1, e2));

        // 2 entries -> 2 cols x 1 row of 64x32 tiles
        assertEquals(2, r.cols);
        assertEquals(1, r.rows);
        assertEquals(128, r.layer1Atlas.getWidth());
        assertEquals(32, r.layer1Atlas.getHeight());

        // COLOR_ARMOR map present for both colors -> their grid coords
        assertTrue(r.armorcordsGlsl.contains("COLOR_ARMOR(255, 4, 255)"));
        assertTrue(r.armorcordsGlsl.contains("cords = vec2(0, 0)"));
        assertTrue(r.armorcordsGlsl.contains("COLOR_ARMOR(10, 20, 30)"));
        assertTrue(r.armorcordsGlsl.contains("cords = vec2(1, 0)"));

        // layer marker (63,30): black on layer1, white on layer2
        assertEquals(0xFF000000, r.layer1Atlas.getRGB(63, 30));
        assertEquals(0xFFFFFFFF, r.layer2Atlas.getRGB(63, 30));
        // internal-color (63,31) of tile 0 = (0,180,0)
        assertEquals(0xFF00B400, r.layer1Atlas.getRGB(63, 31));
    }
}
