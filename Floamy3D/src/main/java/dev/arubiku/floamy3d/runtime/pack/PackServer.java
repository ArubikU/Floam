package dev.arubiku.floamy3d.runtime.pack;

import com.sun.net.httpserver.HttpServer;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.file.Files;
import java.security.MessageDigest;

/**
 * Tiny embedded HTTP server (JDK {@code com.sun.net.httpserver}, no deps, MIT-clean) that hosts the
 * built resourcepack zip so the plugin can self-serve it and push it to players on join / rebuild —
 * no external file host or server.properties round-trip.
 */
public final class PackServer {

    private HttpServer http;
    private File file;
    private byte[] sha1 = new byte[0];
    private String url = "";

    /** Start serving {@code packZip} at http://address:port/pack.zip. */
    public void start(int port, String address, File packZip) throws IOException {
        this.file = packZip;
        http = HttpServer.create(new InetSocketAddress(port), 0);
        http.createContext("/pack.zip", ex -> {
            try {
                if (!file.isFile()) { ex.sendResponseHeaders(404, -1); ex.close(); return; }
                byte[] data = Files.readAllBytes(file.toPath());
                ex.getResponseHeaders().add("Content-Type", "application/zip");
                ex.sendResponseHeaders(200, data.length);
                try (OutputStream os = ex.getResponseBody()) { os.write(data); }
            } catch (Exception e) { ex.close(); }
        });
        http.setExecutor(null);
        http.start();
        this.url = "http://" + address + ":" + port + "/pack.zip";
        refresh();
    }

    /** Recompute the SHA-1 of the current zip (call after a rebuild). */
    public void refresh() throws IOException {
        if (file == null || !file.isFile()) { sha1 = new byte[0]; return; }
        try { sha1 = MessageDigest.getInstance("SHA-1").digest(Files.readAllBytes(file.toPath())); }
        catch (Exception e) { sha1 = new byte[0]; }
    }

    public void stop() { if (http != null) http.stop(0); }
    public String url() { return url; }
    public byte[] sha1() { return sha1; }
    public boolean running() { return http != null; }
}
