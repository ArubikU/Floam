# Floamy3D shader engine (authored source-of-truth)

Hand-authored CEM vanilla-shader engine. The plugin's `PackAssembler` copies these
into each target Minecraft version's resourcepack and injects generated armor/cosmetic
GLSL. **Edit shaders here, never in the assembled pack.**

Layout:
- `common/floamy/` — version-agnostic core, redesigned clean superset:
  - `matf.glsl`      rotation matrices, rotation-name macros, pos/size hooks
  - `intersect.glsl` ray/plane/square/tri/AABB intersection math (proven, unchanged)
  - `raster.glsl`    textured surface rasterizers — ONE centralized `f_faceUV()` with
                     a first-class `mirror` flag (the structural fix for reversed/mirrored
                     parts: a mirrored part is `mirror=true`, not hand-edited UVs)
  - `macros.glsl`    the `ADD_*` macro superset (box/square/tri, rotation, EXT, solid,
                     emissive) + `_MIRROR` variants
- `common/cem/`     `vert_setup.glsl`, `frag_main_setup.glsl` (TBN reconstruction)
- `<version>/`      per-MC-version core shaders + `cem_locs.glsl` + wiring that differ
                    by version (see memory: cem-shader-architecture). Built version-by-version.

## Conventions (the redesign)
- Face UV is resolved in exactly one place: `f_faceUV(normal, box, sides[6], rot, mirror)`.
  - `rot` ∈ {0,1,2,3} = CCW 90° steps.
  - `mirror` = horizontal flip of the face (left/right symmetric parts differ only by this).
- v1 behavior with `mirror=false`, `rot=0` is identical to the legacy MagicShaders raytracer,
  so existing models render unchanged while the clean structure + mirror fix come online.

Status: 1.20.5 first, then up through latest toward MC 26.2.
