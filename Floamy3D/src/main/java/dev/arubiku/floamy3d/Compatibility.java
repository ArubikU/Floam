package dev.arubiku.floamy3d;

import java.io.File;
import java.io.IOException;

import javax.annotation.Nullable;

import org.bukkit.Bukkit;

public class Compatibility {

  public static enum CompiPlugin {
    ITEMSADDER,
    NEXO,
    CRAFTENGINE,
    NONE
  }

  public static CompiPlugin compa = CompiPlugin.NONE;

  @Nullable
  public static File comps(Floamy3D plugin) {
    if (Bukkit.getPluginManager().isPluginEnabled("Nexo")) {
      Compatibility.compa = CompiPlugin.NEXO;
      return Bukkit.getPluginManager().getPlugin("Nexo").getDataFolder();
    }
    if (Bukkit.getPluginManager().isPluginEnabled("ItemsAdder")) {
      Compatibility.compa = CompiPlugin.ITEMSADDER;
      return Bukkit.getPluginManager().getPlugin("ItemsAdder").getDataFolder();
    }
    if (Bukkit.getPluginManager().isPluginEnabled("CraftEngine")) {
      Compatibility.compa = CompiPlugin.CRAFTENGINE;
      return Bukkit.getPluginManager().getPlugin("CraftEngine").getDataFolder();
    }

    return null;
  }

  public static void copy(File pluginFolder, Floamy3D plugin) {
    switch (compa) {
      case ITEMSADDER: {
        plugin.cleanupFolder(pluginFolder.toPath().resolve("contents/forgery/resourcepack/").toFile());

        try {
          plugin.copyContent(plugin.getDataFolder().toPath().resolve("output").toFile(),
              pluginFolder.toPath().resolve("contents/forgery/resourcepack/").toFile());
        } catch (IOException e) {
          e.printStackTrace();
        }
        break;
      }
      case CRAFTENGINE: {
        plugin.cleanupFolder(pluginFolder.toPath().resolve("resources/forgery/resourcepack/").toFile());

        try {
          plugin.copyContent(plugin.getDataFolder().toPath().resolve("output").toFile(),
              pluginFolder.toPath().resolve("resources/forgery/resourcepack/").toFile());
        } catch (IOException e) {
          e.printStackTrace();
        }
        break;
      }

      case NEXO: {
        plugin.cleanupFolder(pluginFolder.toPath().resolve("pack/external_packs/forgery/").toFile());

        try {
          plugin.copyContent(plugin.getDataFolder().toPath().resolve("output").toFile(),
              pluginFolder.toPath().resolve("pack/external_packs/forgery/").toFile());
        } catch (IOException e) {
          e.printStackTrace();
        }
        break;
      }

      default:
        break;
    }
  }
}
