package dev.arubiku.floamy3d;

import org.bukkit.NamespacedKey;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.components.EquippableComponent;

import io.papermc.paper.ServerBuildInfo;

/**
 * Clase que gestiona la funcionalidad específica de versiones de Minecraft.
 * Esta clase permite separar la lógica dependiente de la versión para evitar
 * errores en la clase principal cuando las versiones no son compatibles.
 */
public class VersionManager {
      /**
     * Verifica si la versión actual del servidor es compatible con las funciones avanzadas
     * de modelos de armadura (versiones 1.21, 1.22 o 1.23).
     * 
     * @return true si la versión es compatible, false en caso contrario
     */
    public static boolean isAdvancedModelVersionCompatible() {
        try {
            return ServerBuildInfo.buildInfo().minecraftVersionId().contains("1.21")
                || ServerBuildInfo.buildInfo().minecraftVersionId().contains("1.22")
                || ServerBuildInfo.buildInfo().minecraftVersionId().contains("1.23");
        } catch (Exception e) {
            // Si ocurre algún error al verificar la versión, consideramos que no es compatible
            return false;
        }
    }
      /**
     * Aplica modificaciones al ItemStack específicas para versiones avanzadas (1.21+).
     * Este método contiene la lógica que antes estaba dentro del condicional de versión
     * en la clase Floamy3D.
     * 
     * @param stack El ItemStack al que aplicar las modificaciones
     * @param config La configuración que contiene los datos del modelo
     * @return El ItemStack modificado
     */
    public static ItemStack applyAdvancedModelFeatures(ItemStack stack, FileConfiguration config) {
        if (!isAdvancedModelVersionCompatible()) {
            return stack; // Si la versión no es compatible, devuelve el stack sin modificar
        }
        
        try {
            // Aplicar las modificaciones específicas de versiones avanzadas
            stack.editMeta(meta -> {
                try {
                    EquippableComponent equippable = meta.getEquippable();
                    if(config.contains("custom_model_data_" + equippable.getSlot().toString().toLowerCase())) {
                        meta.setCustomModelData(config.getInt("custom_model_data_" + equippable.getSlot().toString().toLowerCase(), 0));
                    }
                    if(config.contains("model_key" + equippable.getSlot().toString().toLowerCase())) {
                        meta.setItemModel(NamespacedKey.fromString(config.getString("model_key" + equippable.getSlot().toString().toLowerCase())));
                    }
                    equippable.setModel(new NamespacedKey("minecraft", config.getString("id").replace(":", "_")));
                } catch (Exception e) {
                    // Silenciar cualquier error dentro del editMeta para evitar que la operación falle
                }
            });
        } catch (Exception e) {
            // Silenciar cualquier error en el proceso de aplicación de características
            // Si algo falla, simplemente devolvemos el stack sin modificaciones
        }
        
        return stack;
    }
}
