package dev.arubiku.floamy3d.pipeline.pack;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Assembles a single multi-version resourcepack from the engine source tree.
 *
 * Layout produced:
 *   out/pack.mcmeta          (base format + overlay entries)
 *   out/pack.png             (icon, if present in engineRoot)
 *   out/assets/...           (shared base = engineRoot/common-pack, if present)
 *   out/<version>/assets/... (per-version overlay = engineRoot/<version>)
 *
 * Vanilla applies base assets then the overlay whose format range matches the client.
 */
public final class PackAssembler {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    // NOT Integer.MAX_VALUE: 3rd-party pack mergers (CraftEngine) reparse the format as a float and
    // choke on "2.147483647E9". A large finite value covers forward-compat for years + parses clean.
    private static final int MAX_FORMAT = 9999;

    private final Path engineRoot;

    public PackAssembler(Path engineRoot) {
        this.engineRoot = engineRoot;
    }

    /** Assemble into outDir. Returns the list of versions that actually had a source dir. */
    public List<PackVersion> assemble(Path outDir, String description) throws IOException {
        deleteRecursive(outDir);
        Files.createDirectories(outDir);

        // shared base assets (cosmetic textures, etc.)
        Path commonPack = engineRoot.resolve("common-pack");
        if (Files.isDirectory(commonPack)) {
            copyTree(commonPack, outDir);
        }
        Path icon = engineRoot.resolve("pack.png");
        if (Files.isRegularFile(icon)) {
            Files.copy(icon, outDir.resolve("pack.png"), StandardCopyOption.REPLACE_EXISTING);
        }

        List<PackVersion> present = new ArrayList<>();
        for (PackVersion v : PackVersion.all()) {
            Path src = engineRoot.resolve(v.dir).resolve("assets");
            if (!Files.isDirectory(src)) continue;
            Path dst = outDir.resolve(v.dir).resolve("assets");
            Files.createDirectories(dst);
            copyTree(src, dst);
            present.add(v);
        }

        writeMcmeta(outDir.resolve("pack.mcmeta"), description, present);
        return present;
    }

    /** Zip an assembled pack directory into zipOut. */
    public static void zip(Path packDir, Path zipOut) throws IOException {
        Files.createDirectories(zipOut.getParent());
        try (OutputStream os = Files.newOutputStream(zipOut);
             ZipOutputStream zos = new ZipOutputStream(os)) {
            Files.walkFileTree(packDir, new SimpleFileVisitor<Path>() {
                @Override public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    String entry = packDir.relativize(file).toString().replace('\\', '/');
                    zos.putNextEntry(new ZipEntry(entry));
                    Files.copy(file, zos);
                    zos.closeEntry();
                    return FileVisitResult.CONTINUE;
                }
            });
        }
    }

    private void writeMcmeta(Path file, String description, List<PackVersion> versions) throws IOException {
        ObjectNode root = MAPPER.createObjectNode();
        ObjectNode pack = root.putObject("pack");
        // pack_format: legacy single-format field, required for OLD versions (< 65) to accept the pack.
        pack.put("pack_format", PackVersion.baseFormat());
        pack.put("description", description);
        // min_format/max_format: the 1.21.9+ range fields. NOTE: the old `supported_formats` object
        // (min_inclusive/max_inclusive long-form) is NOT recognized in >1.21.8 and makes the pack-meta
        // codec FAIL ("missing mandatory fields min_format and max_format") — so we do NOT emit it.
        pack.put("min_format", PackVersion.baseFormat());
        pack.put("max_format", MAX_FORMAT);

        if (!versions.isEmpty()) {
            ObjectNode overlays = root.putObject("overlays");
            ArrayNode entries = overlays.putArray("entries");
            // newest first so it takes precedence
            for (int i = versions.size() - 1; i >= 0; i--) {
                PackVersion v = versions.get(i);
                ObjectNode e = entries.addObject();
                // 1.21.9+ overlay range fields. The old long-form `formats` {min_inclusive/max_inclusive}
                // is NOT recognized in >1.21.8 and fails the pack-meta codec — so we emit ONLY min/max_format.
                e.put("min_format", v.minFormat);
                e.put("max_format", v.maxFormat);
                e.put("directory", v.dir);
            }
        }
        Files.writeString(file, MAPPER.writerWithDefaultPrettyPrinter().writeValueAsString(root) + "\n");
    }

    private static void copyTree(Path src, Path dst) throws IOException {
        Files.walkFileTree(src, new SimpleFileVisitor<Path>() {
            @Override public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                Files.createDirectories(dst.resolve(src.relativize(dir).toString()));
                return FileVisitResult.CONTINUE;
            }
            @Override public FileVisitResult visitFile(Path f, BasicFileAttributes attrs) throws IOException {
                Files.copy(f, dst.resolve(src.relativize(f).toString()), StandardCopyOption.REPLACE_EXISTING);
                return FileVisitResult.CONTINUE;
            }
        });
    }

    private static void deleteRecursive(Path p) throws IOException {
        if (!Files.exists(p)) return;
        Files.walkFileTree(p, new SimpleFileVisitor<Path>() {
            @Override public FileVisitResult visitFile(Path f, BasicFileAttributes attrs) throws IOException {
                Files.delete(f); return FileVisitResult.CONTINUE;
            }
            @Override public FileVisitResult postVisitDirectory(Path d, IOException e) throws IOException {
                Files.delete(d); return FileVisitResult.CONTINUE;
            }
        });
    }
}
