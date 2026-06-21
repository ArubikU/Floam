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

/** Renders the generated armor with its real texture, offline, so quality is visible without MC. */
class RenderTexturedTest {

    private static final Mat3 PIX = Mat3.rotation(0, Math.PI / 2);

    @Test
    void renderFenrirTextured() throws Exception {
        File dir = new File("../FloamArmors/Packs/Licorne_floam/FloamyArmor/armors/licorn_fenrir");
        File jem = new File(dir, "layer_1.jem");
        File png = new File(dir, "layer_1.png");
        assumeTrue(jem.exists() && png.exists(), "real armor assets not present");

        BufferedImage tex = ImageIO.read(png);
        List<TexturedBox> boxes = new ArrayList<>();
        for (CemModel m : JemParser.forArmor().parse(jem))
            for (CemBox b : m.boxes) {
                Mat3 R = (b.hasBaseRotation() ? PIX : Mat3.identity())
                        .mul(b.rotMatrix != null ? b.rotMatrix : Mat3.identity());
                boxes.add(new TexturedBox(R.mul(b.center), b.half.mul(b.scale), R, b.faces, tex));
            }

        Path out = Path.of("build/demos/render");
        Files.createDirectories(out);
        TexturedRenderer r = new TexturedRenderer(256);
        for (SoftwareRenderer.View v : SoftwareRenderer.View.values())
            ImageIO.write(r.render(boxes, v), "png",
                    out.resolve("fenrir_tex_" + v.name().toLowerCase() + ".png").toFile());
    }
}
