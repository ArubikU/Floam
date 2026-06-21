package dev.arubiku.floamy3d.runtime.skin;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.UUID;

import javax.imageio.ImageIO;

/**
 * Uploads a composed skin PNG to MineSkin to obtain a signed Mojang textures value+signature
 * (needed because clients verify the texture signature). Run OFF the main thread.
 *
 * MIT-clean: just an HTTPS client to a public service; no GPL code.
 */
public final class MineSkinClient {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private static final String ENDPOINT = "https://api.mineskin.org/generate/upload";

    private final HttpClient http = HttpClient.newHttpClient();
    private final String apiKey; // optional; raises rate limits

    public MineSkinClient(String apiKey) { this.apiKey = apiKey; }

    /** @return [value, signature] or null on failure. */
    public String[] sign(BufferedImage skin) {
        try {
            ByteArrayOutputStream png = new ByteArrayOutputStream();
            ImageIO.write(skin, "png", png);

            String boundary = "floamy" + UUID.randomUUID();
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            String head = "--" + boundary + "\r\n"
                    + "Content-Disposition: form-data; name=\"file\"; filename=\"skin.png\"\r\n"
                    + "Content-Type: image/png\r\n\r\n";
            body.write(head.getBytes());
            body.write(png.toByteArray());
            body.write(("\r\n--" + boundary + "--\r\n").getBytes());

            HttpRequest.Builder req = HttpRequest.newBuilder(URI.create(ENDPOINT))
                    .header("Content-Type", "multipart/form-data; boundary=" + boundary)
                    .POST(HttpRequest.BodyPublishers.ofByteArray(body.toByteArray()));
            if (apiKey != null && !apiKey.isEmpty()) req.header("Authorization", "Bearer " + apiKey);

            HttpResponse<String> res = http.send(req.build(), HttpResponse.BodyHandlers.ofString());
            JsonNode tex = MAPPER.readTree(res.body()).path("data").path("texture");
            String value = tex.path("value").asText(null);
            String signature = tex.path("signature").asText(null);
            if (value == null) return null;
            return new String[]{value, signature};
        } catch (Exception e) {
            return null;
        }
    }
}
