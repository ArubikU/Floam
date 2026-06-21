package dev.arubiku.floamy3d.cli;

import dev.arubiku.floamy3d.pipeline.ArmorGenerator;
import dev.arubiku.floamy3d.pipeline.bbmodel.BbModelParser;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.Part;
import dev.arubiku.floamy3d.pipeline.pack.PackAssembler;
import dev.arubiku.floamy3d.pipeline.registry.Registry;
import dev.arubiku.floamy3d.pipeline.texture.ColorAtlasBaker;
import dev.arubiku.floamy3d.pipeline.texture.EquipmentWriter;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

/**
 * Offline pipeline runner — generate cosmetics/armor and assemble packs without a server.
 *
 *   java -cp Floamy3D.jar dev.arubiku.floamy3d.cli.FloamyCli cosmetic <model.jem|.bbmodel> <id> <part> <includeDir>
 *   java -cp Floamy3D.jar dev.arubiku.floamy3d.cli.FloamyCli armor <id> <ir> <ig> <ib> <cr> <cg> <cb> <jemDir> <out>
 *   java -cp Floamy3D.jar dev.arubiku.floamy3d.cli.FloamyCli pack <engineDir> <outDir>
 */
public final class FloamyCli {

    public static void main(String[] args) throws Exception {
        if (args.length == 0) { usage(); return; }
        switch (args[0]) {
            case "cosmetic" -> cosmetic(args);
            case "armor" -> armor(args);
            case "pack" -> pack(args);
            default -> usage();
        }
    }

    private static void cosmetic(String[] a) throws Exception {
        File model = new File(a[1]);
        String id = a[2];
        Part part = Part.valueOf(a[3].toUpperCase());
        Path includeDir = Path.of(a[4]);

        List<CemModel> models = model.getName().toLowerCase().endsWith(".jem")
                ? new JemParser().parse(model)
                : List.of(new BbModelParser().parse(model, id, part));
        Registry reg = new Registry();
        for (CemModel m : models) if (!m.boxes.isEmpty()) reg.register(m);
        reg.writeAll(includeDir);
        System.out.println("cosmetic: registered " + reg.entries().size() + " model(s) -> " + includeDir);
    }

    private static void armor(String[] a) throws Exception {
        String id = a[1];
        int[] internal = { Integer.parseInt(a[2]), Integer.parseInt(a[3]), Integer.parseInt(a[4]) };
        int[] color = { Integer.parseInt(a[5]), Integer.parseInt(a[6]), Integer.parseInt(a[7]) };
        File jemDir = new File(a[8]);
        Path out = Path.of(a[9]);
        Files.createDirectories(out);

        File l1 = new File(jemDir, "layer_1.jem");
        File l2 = new File(jemDir, "layer_2.jem");
        String glsl = new ArmorGenerator().generate(id, internal, l1, l2.exists() ? l2 : null);
        Files.writeString(out.resolve("armor.glsl"), glsl);

        // bake color atlas (old mode) if layer pngs exist
        File p1 = new File(jemDir, "layer_1.png");
        File p2 = new File(jemDir, "layer_2.png");
        if (p1.exists()) {
            var baker = new ColorAtlasBaker();
            var entry = new ColorAtlasBaker.Entry(id, color, internal,
                    ColorAtlasBaker.read(p1), p2.exists() ? ColorAtlasBaker.read(p2) : null);
            var res = baker.bakeColorAtlas(List.of(entry));
            Files.writeString(out.resolve("armorcords.glsl"), res.armorcordsGlsl);
            javax.imageio.ImageIO.write(res.layer1Atlas, "png", out.resolve("leather_layer_1.png").toFile());
            javax.imageio.ImageIO.write(res.layer2Atlas, "png", out.resolve("leather_layer_2.png").toFile());
            // modern equipment json
            new EquipmentWriter().write(out, "minecraft", id, p2.exists());
        }
        System.out.println("armor: " + id + " -> " + out);
    }

    private static void pack(String[] a) throws Exception {
        Path engine = Path.of(a[1]);
        Path out = Path.of(a[2]);
        var present = new PackAssembler(engine).assemble(out, "Floamy3D");
        PackAssembler.zip(out, out.resolveSibling(out.getFileName() + ".zip"));
        System.out.println("pack: assembled " + present.size() + " version(s) -> " + out);
    }

    private static void usage() {
        System.out.println("""
            Floamy3D CLI
              cosmetic <model.jem|.bbmodel> <id> <part> <includeDir>
              armor    <id> <ir> <ig> <ib> <cr> <cg> <cb> <jemDir> <out>
              pack     <engineDir> <outDir>""");
    }
}
