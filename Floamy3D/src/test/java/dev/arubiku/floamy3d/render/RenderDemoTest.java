package dev.arubiku.floamy3d.render;

import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.*;
import org.junit.jupiter.api.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assumptions.assumeTrue;

/** Renders a generated model to PNG silhouettes (front/side/top) so it can be eyeballed offline. */
class RenderDemoTest {

    private static final Mat3 PIX = Mat3.rotation(0, Math.PI / 2);

    @Test
    void renderFenrirToPng() throws Exception {
        File jem = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir/layer_1.jem");
        assumeTrue(jem.exists(), "real jem not present");

        List<OrientedBox> boxes = new ArrayList<>();
        for (CemModel m : JemParser.forArmor().parse(jem))
            for (CemBox b : m.boxes) {
                Mat3 R = (b.hasBaseRotation() ? PIX : Mat3.identity())
                        .mul(b.rotMatrix != null ? b.rotMatrix : Mat3.identity());
                boxes.add(new OrientedBox(R.mul(b.center), b.half.mul(b.scale), R));
            }

        Path out = Path.of("build/demos/render");
        Files.createDirectories(out);
        SoftwareRenderer r = new SoftwareRenderer(128);
        for (SoftwareRenderer.View v : SoftwareRenderer.View.values()) {
            boolean[][] mask = r.render(boxes, v);
            BufferedImage img = new BufferedImage(128, 128, BufferedImage.TYPE_INT_ARGB);
            for (int y = 0; y < 128; y++)
                for (int x = 0; x < 128; x++)
                    img.setRGB(x, y, mask[y][x] ? 0xFF6A4FC8 : 0x00000000);
            ImageIO.write(img, "png", out.resolve("fenrir_" + v.name().toLowerCase() + ".png").toFile());
        }
    }
}
