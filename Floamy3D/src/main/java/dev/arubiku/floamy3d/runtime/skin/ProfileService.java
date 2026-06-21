package dev.arubiku.floamy3d.runtime.skin;

import com.destroystokyo.paper.profile.PlayerProfile;
import com.destroystokyo.paper.profile.ProfileProperty;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.bukkit.entity.Player;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;

/**
 * Reads and writes a player's skin via Paper's {@link PlayerProfile} API (MIT-clean — no NMS).
 * Downloading the current skin and (re)setting the textures property is all stock Paper.
 * Signing a freshly-composed skin needs an external service (MineSkin) — see {@link MineSkinClient}.
 */
public final class ProfileService {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private final HttpClient http = HttpClient.newHttpClient();

    /** Decode the player's current skin PNG from their profile textures property (or null). */
    public BufferedImage fetchSkin(Player player) {
        try {
            PlayerProfile profile = player.getPlayerProfile();
            for (ProfileProperty p : profile.getProperties()) {
                if (!p.getName().equals("textures")) continue;
                String json = new String(Base64.getDecoder().decode(p.getValue()));
                JsonNode url = MAPPER.readTree(json).path("textures").path("SKIN").path("url");
                if (url.isMissingNode()) return null;
                HttpResponse<byte[]> res = http.send(
                        HttpRequest.newBuilder(URI.create(url.asText())).build(),
                        HttpResponse.BodyHandlers.ofByteArray());
                return ImageIO.read(new ByteArrayInputStream(res.body()));
            }
        } catch (Exception ignored) {}
        return null;
    }

    /** Replace the player's textures property and return the same profile for re-application. */
    public void applyTextures(Player player, String value, String signature) {
        PlayerProfile profile = player.getPlayerProfile();
        profile.getProperties().removeIf(p -> p.getName().equals("textures"));
        profile.setProperty(signature == null
                ? new ProfileProperty("textures", value)
                : new ProfileProperty("textures", value, signature));
        player.setPlayerProfile(profile);
    }
}
