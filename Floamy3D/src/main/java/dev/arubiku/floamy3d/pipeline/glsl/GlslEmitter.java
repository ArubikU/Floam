package dev.arubiku.floamy3d.pipeline.glsl;

import dev.arubiku.floamy3d.pipeline.model.CemBox;
import dev.arubiku.floamy3d.pipeline.model.CemModel;
import dev.arubiku.floamy3d.pipeline.model.FaceUV;
import dev.arubiku.floamy3d.pipeline.model.Vec3;

import java.util.Locale;

/**
 * Emits registry GLSL for a {@link CemModel}, targeting the clean Floamy macro core
 * (engine/common/floamy/macros.glsl). Faces are always natural order d,u,n,e,s,w.
 *
 * Produces three pieces the registry/pack-assembler stitches together:
 *  - {@link #define(CemModel, int)}  -> "#define CEM_<ID> <n>"
 *  - {@link #detect(CemModel, int, int, int)} -> vertex-stage detection snippet (cosmetic)
 *  - {@link #detectArmor(CemModel, String)} -> vertex-stage detection for an armor slot
 *  - {@link #modelCase(CemModel)} -> fragment-stage "case CEM_<ID>: { ... } break;"
 *
 * UV mode follows the model {@link CemModel.Kind}: ARMOR -> atlas relativeUv, else direct vec4.
 */
public final class GlslEmitter {

    public String define(CemModel m, int cemNumber) {
        return "#define CEM_" + m.id + " " + cemNumber + "\n";
    }

    /**
     * Cosmetic detection: marker pixel at (mx,my) whose R and B channels both equal markerValue.
     * G channel is free (runtime animation speed). Attaches to the model's body part.
     */
    public String detect(CemModel m, int mx, int my, int markerValue) {
        StringBuilder sb = new StringBuilder();
        sb.append("// ").append(m.id).append(" -> ").append(m.part).append('\n');
        sb.append(String.format(Locale.ROOT,
                "if (getChannel(ivec2(%d,%d),0) == %d.0 && getChannel(ivec2(%d,%d),2) == %d.0) {\n",
                mx, my, markerValue, mx, my, markerValue));
        sb.append(String.format(Locale.ROOT, "    cem_color = getCemData(ivec2(%d,%d));\n", mx, my));
        sb.append("    if (cube == ").append(m.part.cubeConstant()).append(") {\n");
        sb.append("        cems = addCem(cems, CEM_").append(m.id).append(");\n");
        sb.append("        ").append(m.part.editMacro()).append("();\n");
        sb.append("    }\n");
        sb.append("}\n");
        return sb.toString();
    }

    /**
     * Armor detection line for one STASIS slot (used inside the armor.glsl VSH block,
     * guarded by the per-armor internal-id check). Sets removeAll so vanilla armor is hidden.
     */
    public String detectArmor(CemModel m, String stasisSlot) {
        return "    if (cube == " + stasisSlot + ") {\n"
             + "        removeAll = 1;\n"
             + "        cems = addCem(cems, CEM_" + m.id + ");\n"
             + "    }\n";
    }

    /** Fragment model case. */
    public String modelCase(CemModel m) {
        StringBuilder sb = new StringBuilder();
        sb.append("case CEM_").append(m.id).append(": {\n");
        for (CemBox box : m.boxes) emitBox(sb, box, m.isAtlas());
        sb.append("    break;\n}\n");
        return sb.toString();
    }

    /**
     * Fragment case in the LEGACY Forgery macro format, so generated armor drops straight into the
     * existing per-version Forgery shaders (ADD_BOX[_EXT]_WITH_ROTATION_ROTATE + relativeUv, face
     * order up,down,north,west,south,east, base PIX, per-face rot 2). Matches the field-truth armor.glsl.
     */
    public String modelCaseLegacy(CemModel m) {
        StringBuilder sb = new StringBuilder();
        sb.append("case CEM_").append(m.id).append(": {\n");
        for (CemBox b : m.boxes) emitBoxLegacy(sb, b);
        sb.append("    break;\n}\n");
        return sb.toString();
    }

    private void emitBoxLegacy(StringBuilder sb, CemBox b) {
        String macro = b.ext ? "ADD_BOX_EXT_WITH_ROTATION_ROTATE" : "ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY";
        // Respect the box's own base: hand-parsed boxes carry the FULL matrix (baseRotation null) so
        // we must NOT prepend PIX again (that double-rotated the reference dump). JEM boxes have
        // baseRotation "PIX" + an optional euler.
        String base = b.hasBaseRotation() ? b.baseRotation : null;
        String rot;
        if (b.hasMatrix())       rot = (base != null ? base + "*" : "") + b.rotMatrix.glsl();
        else if (b.hasRotation()) rot = (base != null ? base + "*" : "") + RotationMacros.matrix(b.rotation);
        else                      rot = base != null ? base : "PINULL";
        String size = b.half.glsl() + scaleSuffix(b.scale);
        // legacy face order: up, down, north, west, south, east  (relativeUv atlas)
        sb.append("    ").append(macro).append("(").append(b.center.glsl()).append(", ").append(size)
          .append(", ").append(rot).append(", vec3(0,0,0),\n        ")
          .append(b.faces[CemBox.UP].glslAtlas()).append(", ").append(b.faces[CemBox.DOWN].glslAtlas()).append(",\n        ")
          .append(b.faces[CemBox.NORTH].glslAtlas()).append(", ").append(b.faces[CemBox.WEST].glslAtlas()).append(",\n        ")
          .append(b.faces[CemBox.SOUTH].glslAtlas()).append(", ").append(b.faces[CemBox.EAST].glslAtlas()).append(",\n        ")
          .append("2, 2,\n        2, 2,\n        2, 2);\n");
    }

    private void emitBox(StringBuilder sb, CemBox b, boolean atlas) {
        String faces = faceArg(b, CemBox.DOWN, atlas) + ", " + faceArg(b, CemBox.UP, atlas) + ", "
                + faceArg(b, CemBox.NORTH, atlas) + ", " + faceArg(b, CemBox.EAST, atlas) + ", "
                + faceArg(b, CemBox.SOUTH, atlas) + ", " + faceArg(b, CemBox.WEST, atlas);

        boolean faceRot = anyFaceRot(b);
        String pos = b.center.glsl();
        String size = b.half.glsl() + scaleSuffix(b.scale);
        boolean simple = !b.needsRotateMacro() && !faceRot;

        if (simple && !b.mirror && !b.ext) {
            sb.append("    ADD_BOX(").append(pos).append(", ").append(size).append(",\n        ")
              .append(faces).append(")\n");
            return;
        }
        if (simple && b.mirror && !b.ext) {
            sb.append("    ADD_BOX_MIRROR(").append(pos).append(", ").append(size).append(",\n        ")
              .append(faces).append(")\n");
            return;
        }
        if (simple && !b.mirror && b.ext) {
            sb.append("    ADD_BOX_EXT(").append(pos).append(", ").append(size).append(",\n        ")
              .append(faces).append(")\n");
            return;
        }
        // full path (rotation / per-face rotation / mirror+ext combos)
        String macro = b.ext ? "ADD_BOX_EXT_ROTATE_FULL" : "ADD_BOX_ROTATE_FULL";
        String r = composeRotation(b);
        String pivot = b.needsRotateMacro() ? b.pivot.glsl() : "vec3(0,0,0)";
        String rots = rot(b, CemBox.DOWN) + ", " + rot(b, CemBox.UP) + ", " + rot(b, CemBox.NORTH) + ", "
                + rot(b, CemBox.EAST) + ", " + rot(b, CemBox.SOUTH) + ", " + rot(b, CemBox.WEST);
        sb.append("    ").append(macro).append("(").append(pos).append(", ").append(size).append(", ")
          .append(r).append(", ").append(pivot).append(",\n        ")
          .append(faces).append(",\n        ")
          .append(rots).append(", ").append(b.mirror).append(")\n");
    }

    private String faceArg(CemBox b, int idx, boolean atlas) {
        return atlas ? b.faces[idx].glslAtlas() : b.faces[idx].glsl();
    }

    /**
     * Combine the optional base transform (e.g. JEM "PIX") with the euler rotation.
     * Mirrored (left-side) parts negate the X rotation — matches the field-truth armor GLSL
     * (right arm PIX25 vs left arm NIX25).
     */
    private String composeRotation(CemBox b) {
        // baked hierarchical matrix takes precedence over euler
        String rotExpr;
        if (b.hasMatrix()) {
            rotExpr = b.rotMatrix.glsl();
        } else {
            Vec3 rot = b.mirror ? new Vec3(-b.rotation.x, b.rotation.y, b.rotation.z) : b.rotation;
            rotExpr = !rot.isZero() ? RotationMacros.matrix(rot) : null;
        }
        if (b.hasBaseRotation() && rotExpr != null) return b.baseRotation + "*" + rotExpr;
        if (b.hasBaseRotation()) return b.baseRotation;
        if (rotExpr != null) return rotExpr;
        return "PINULL";
    }

    private String scaleSuffix(double scale) {
        if (Math.abs(scale - 1.0) < 1e-9) return "";
        String s = String.format(Locale.ROOT, "%.4f", scale).replaceAll("0+$", "").replaceAll("\\.$", "");
        return "*" + s;
    }

    private boolean anyFaceRot(CemBox b) {
        for (FaceUV f : b.faces) if (f.enabled && f.rot != 0) return true;
        return false;
    }

    private String rot(CemBox b, int idx) {
        return b.faces[idx].rot + ".";
    }
}
