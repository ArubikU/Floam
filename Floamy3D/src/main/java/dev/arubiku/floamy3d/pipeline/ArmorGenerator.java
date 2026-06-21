package dev.arubiku.floamy3d.pipeline;

import dev.arubiku.floamy3d.pipeline.glsl.GlslEmitter;
import dev.arubiku.floamy3d.pipeline.jem.JemParser;
import dev.arubiku.floamy3d.pipeline.model.CemModel;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Generates a per-armor {@code armor.glsl} (VSH detection block + FSH cases) from the two
 * OptiFine layer JEMs, reproducing the field-truth Forgery output:
 *
 *   #ifdef VSH
 *   if (RVC_0 == ir && RVC_1 == ig && RVC_2 == ib) {            // internal-color guard
 *       if (cube == STASIS_CHESTPLATE) { removeAll = 1; cems = addCem(cems, ID_CHESTPLATE); }
 *       ...
 *   }
 *   #endif
 *   #ifdef FSH
 *   case ID_CHESTPLATE: { ADD_BOX_..._WITH_ROTATION_ROTATE(...); break; }
 *   ...
 *   #endif
 *
 * layer_1 = outer (chestplate/arms/boots/helmet), layer_2 = inner (inner-armor/leggings).
 */
public final class ArmorGenerator {

    /** (CEM id suffix, STASIS detection constant) for a source part, per layer. */
    private static final Map<String, String[]> L1 = new LinkedHashMap<>();
    private static final Map<String, String[]> L2 = new LinkedHashMap<>();
    static {
        L1.put("head",       new String[]{"HELMET",     "STASIS_HELMET"});
        L1.put("body",       new String[]{"CHESTPLATE", "STASIS_CHESTPLATE"});
        L1.put("left_arm",   new String[]{"LEFT_ARM",   "STASIS_LEFT_ARM"});
        L1.put("right_arm",  new String[]{"RIGHT_ARM",  "STASIS_RIGHT_ARM"});
        L1.put("left_shoe",  new String[]{"LEFT_FEET",  "STASIS_LEFT_BOOT"});
        L1.put("right_shoe", new String[]{"RIGHT_FEET", "STASIS_RIGHT_BOOT"});

        L2.put("waist",      new String[]{"INNER_ARMOR", "STASIS_INNER_ARMOR"});
        L2.put("body",       new String[]{"INNER_ARMOR", "STASIS_INNER_ARMOR"});
        L2.put("left_leg",   new String[]{"LEFT_LEG",    "STASIS_LEFT_LEG"});
        L2.put("right_leg",  new String[]{"RIGHT_LEG",   "STASIS_RIGHT_LEG"});
    }

    private final GlslEmitter emitter = new GlslEmitter();
    private dev.arubiku.floamy3d.pipeline.jem.JpEngine jp;

    public ArmorGenerator parsers(dev.arubiku.floamy3d.pipeline.jem.JpEngine e) { this.jp = e; return this; }

    public static final class Slot {
        public final CemModel model;
        public final String stasis;
        Slot(CemModel model, String stasis) { this.model = model; this.stasis = stasis; }
    }

    /** Parse both layers and resolve their armor slots. */
    public List<Slot> resolve(String armorId, File layer1Jem, File layer2Jem) throws IOException {
        List<Slot> slots = new ArrayList<>();
        collect(armorId, layer1Jem, L1, slots);
        if (layer2Jem != null && layer2Jem.exists()) collect(armorId, layer2Jem, L2, slots);
        return slots;
    }

    private void collect(String armorId, File jem, Map<String, String[]> map, List<Slot> out) throws IOException {
        for (CemModel m : JemParser.forArmor().parsers(jp).armor(CemModel.sanitize(armorId)).parse(jem)) {
            if (m.boxes.isEmpty()) continue;
            String[] slot = map.get(m.sourcePart);
            // A parsers/*.jp `bone` op can override (or supply) the engine bone; otherwise the part
            // must be in the L1/L2 map. The CEM id suffix comes from the map, or the part name.
            String stasis = m.bone != null ? m.bone : (slot != null ? slot[1] : null);
            if (stasis == null) continue;
            String name = slot != null ? slot[0] : m.sourcePart.toUpperCase(java.util.Locale.ROOT);
            m.kind = CemModel.Kind.ARMOR;
            m.id = CemModel.sanitize(armorId) + "_" + name;
            out.add(new Slot(m, stasis));
        }
    }

    /** Generated armor pieces: the case/detection GLSL + the #define id table + the cem-id range used. */
    public static final class Generated {
        public final String armorGlsl;
        public final String partsGlsl;   // #define CEM_<ID> <n>
        public final List<String> variables;
        public final int nextOffset;
        Generated(String a, String p, List<String> v, int next) { armorGlsl = a; partsGlsl = p; variables = v; nextOffset = next; }
    }

    /**
     * Full generation for the dynamic builder: armor.glsl (detection + cases) AND parts.glsl
     * (#define CEM_&lt;ID&gt; n) so the ids the cases reference are defined. cem ids start at
     * {@code baseOffset} and don't collide with built-ins (&lt;50) or cosmetics (50+).
     */
    public Generated generateFull(String armorId, int[] internalColor, File layer1Jem, File layer2Jem, int baseOffset) throws IOException {
        List<Slot> slots = resolve(armorId, layer1Jem, layer2Jem);
        int n = baseOffset;
        StringBuilder defs = new StringBuilder();
        for (Slot s : slots) defs.append(emitter.define(s.model, n++));
        String glsl = buildGlsl(slots, internalColor);
        return new Generated(glsl, defs.toString(), variables(slots), n);
    }

    /** Produce the complete armor.glsl text. */
    public String generate(String armorId, int[] internalColor, File layer1Jem, File layer2Jem) throws IOException {
        return buildGlsl(resolve(armorId, layer1Jem, layer2Jem), internalColor);
    }

    /** Data-driven build: VSH detection + #define table + the raw boxes (cemId-tagged) to encode. */
    public static final class Built {
        public final String vsh;      // #ifdef VSH section (detection) for this armor
        public final String defs;     // #define CEM_<ID> n
        public final String reference;// human-readable ADD_BOX dump (how each box "compiles")
        public final List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> dataParts;
        public final int nextOffset;
        Built(String v, String d, String r, List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> p, int n) {
            vsh = v; defs = d; reference = r; dataParts = p; nextOffset = n;
        }
    }

    // slot-name suffix -> engine STASIS bone (reverse of L1/L2), for parsing hand-made armor.glsl.
    private static final java.util.LinkedHashMap<String, String> STASIS = new java.util.LinkedHashMap<>();
    static {
        STASIS.put("INNER_ARMOR", "STASIS_INNER_ARMOR");
        STASIS.put("LEFT_ARM", "STASIS_LEFT_ARM"); STASIS.put("RIGHT_ARM", "STASIS_RIGHT_ARM");
        STASIS.put("LEFT_LEG", "STASIS_LEFT_LEG"); STASIS.put("RIGHT_LEG", "STASIS_RIGHT_LEG");
        STASIS.put("LEFT_FEET", "STASIS_LEFT_BOOT"); STASIS.put("RIGHT_FEET", "STASIS_RIGHT_BOOT");
        STASIS.put("CHESTPLATE", "STASIS_CHESTPLATE"); STASIS.put("HELMET", "STASIS_HELMET");
    }

    /** Build directly from a hand-made armor.glsl (the source of truth for hand-authored armors). */
    public Built buildFromGlsl(String armorId, int[] internalColor, File handGlsl, int baseOffset) throws IOException {
        var cases = new dev.arubiku.floamy3d.pipeline.glsl.GlslArmorParser().parse(handGlsl.toPath(), 64, 32);
        List<Slot> slots = new ArrayList<>();
        for (var e : cases.entrySet()) {
            String caseName = e.getKey().toUpperCase(Locale.ROOT);
            String stasis = null;
            for (var s : STASIS.entrySet()) if (caseName.endsWith(s.getKey())) { stasis = s.getValue(); break; }
            if (stasis == null) continue;
            CemModel m = e.getValue();
            m.kind = CemModel.Kind.ARMOR;
            m.id = CemModel.sanitize(armorId) + "_" + STASIS.entrySet().stream()
                    .filter(x -> caseName.endsWith(x.getKey())).map(java.util.Map.Entry::getKey).findFirst().orElse(caseName);
            slots.add(new Slot(m, stasis));
        }
        return assemble(armorId, internalColor, slots, baseOffset);
    }

    public Built buildData(String armorId, int[] internalColor, File layer1Jem, File layer2Jem, int baseOffset) throws IOException {
        return assemble(armorId, internalColor, resolve(armorId, layer1Jem, layer2Jem), baseOffset);
    }

    /** Common slot list -> Built (VSH detection + defines + reference dump + data-driven parts). */
    private Built assemble(String armorId, int[] internalColor, List<Slot> slots, int baseOffset) {
        StringBuilder vsh = new StringBuilder();
        vsh.append(String.format(Locale.ROOT, "if (RVC_0 == %d && RVC_1 == %d && RVC_2 == %d) {\n",
                internalColor[0], internalColor[1], internalColor[2]));
        for (Slot s : slots) vsh.append(emitter.detectArmor(s.model, s.stasis));
        vsh.append("}\n");

        StringBuilder defs = new StringBuilder();
        StringBuilder ref = new StringBuilder();
        ref.append("// ===== ").append(CemModel.sanitize(armorId)).append("  (internal-color ")
           .append(internalColor[0]).append(",").append(internalColor[1]).append(",").append(internalColor[2])
           .append(") =====\n");
        List<dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part> parts = new ArrayList<>();
        int n = baseOffset;
        for (Slot s : slots) {
            defs.append(emitter.define(s.model, n));
            ref.append("#define CEM_").append(s.model.id).append(" ").append(n)
               .append("   // -> bone ").append(s.stasis).append(", ").append(s.model.boxes.size()).append(" box(es)\n");
            ref.append(emitter.modelCaseLegacy(s.model)).append('\n');
            parts.add(new dev.arubiku.floamy3d.pipeline.texture.ArmorDataCodec.Part(n, s.model.boxes));
            n++;
        }
        return new Built(vsh.toString(), defs.toString(), ref.toString(), parts, n);
    }

    private String buildGlsl(List<Slot> slots, int[] internalColor) {
        StringBuilder vsh = new StringBuilder();
        vsh.append(String.format(Locale.ROOT, "if (RVC_0 == %d && RVC_1 == %d && RVC_2 == %d) {\n",
                internalColor[0], internalColor[1], internalColor[2]));
        for (Slot s : slots) vsh.append(emitter.detectArmor(s.model, s.stasis));
        vsh.append("}\n");

        StringBuilder fsh = new StringBuilder();
        // legacy macro format so it plugs into the existing Forgery per-version armor shaders
        for (Slot s : slots) fsh.append(emitter.modelCaseLegacy(s.model));

        return "#ifdef VSH\n\n" + vsh + "\n#endif\n\n#ifdef FSH\n\n" + fsh + "\n#endif\n";
    }

    /** The glsl-variables a config would declare (CEM id list) for these slots. */
    public List<String> variables(List<Slot> slots) {
        List<String> v = new ArrayList<>();
        for (Slot s : slots) v.add(s.model.id);
        return v;
    }
}
