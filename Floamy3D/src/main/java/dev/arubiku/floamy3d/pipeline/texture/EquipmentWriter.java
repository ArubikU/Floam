package dev.arubiku.floamy3d.pipeline.texture;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * Writes the modern (1.21.2+) equipment definition JSON that binds an armor id to its
 * humanoid / humanoid_leggings equipment textures.
 *
 *   assets/&lt;namespace&gt;/equipment/&lt;id&gt;.json
 *   { "layers": { "humanoid": [ { "texture": "namespace:id" } ],
 *                 "humanoid_leggings": [ { "texture": "namespace:id" } ] } }
 *
 * Pairs with {@link ColorAtlasBaker#writeModernEquipment} which writes the referenced textures
 * under textures/entity/equipment/humanoid[_leggings].
 */
public final class EquipmentWriter {
    private static final ObjectMapper MAPPER = new ObjectMapper();

    public void write(Path assetsRoot, String namespace, String id, boolean hasLeggings) throws IOException {
        ObjectNode root = MAPPER.createObjectNode();
        ObjectNode layers = root.putObject("layers");
        layers.set("humanoid", layerArray(namespace + ":" + id));
        if (hasLeggings) layers.set("humanoid_leggings", layerArray(namespace + ":" + id));

        Path dir = assetsRoot.resolve(namespace).resolve("equipment");
        Files.createDirectories(dir);
        Files.writeString(dir.resolve(id + ".json"),
                MAPPER.writerWithDefaultPrettyPrinter().writeValueAsString(root) + "\n");
    }

    private ArrayNode layerArray(String texture) {
        ArrayNode arr = MAPPER.createArrayNode();
        arr.addObject().put("texture", texture);
        return arr;
    }
}
