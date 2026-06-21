# Floamy3D — optimizations & calibration

## Implemented (shader)
- **Early depth reject** in every rasterizer: `if (box.z >= T) return color;` skips shading for
  occluded hits; `if (col.a < 0.1) return color;` skips transparent texels (raster.glsl).
- **EXT only when needed**: the inside-out back-face pass (`boxIntersectInv`) runs only for boxes
  flagged `ext`; plain boxes take the single-intersect path.
- **One `f_faceUV`**: face→UV resolved once (no six copy-pasted branches), smaller shader, fewer
  divergent paths than the legacy raster.
- **Mirror/rotation as flags**, not duplicated geometry: a left/right pair shares one model.

## Implemented (pipeline)
- **Atlas packing**: armors share one `ceil(sqrt(n))` grid atlas; one texture bind for all.
- **Registry is additive**: importing a cosmetic appends router `#moj_import`s — no core re-emit.
- **Multi-version single pack**: one overlay pack covers 1.20.5 → open-ended (26.1+), no per-version
  duplicate of shared assets.

## Calibration TODO (needs in-game eyes — see memory cem-shader-architecture)
- JEM→CEM emit constants vs the **clean** raster: base `PIX`, fit `*0.75`, per-face rot — currently
  carried from the legacy raster; verify against `engine/common/floamy/raster.glsl` and adjust the
  `JemParser.forArmor()` / emitter defaults.
- Per-box armor scale (0.75/0.95/.8…) and EXT-vs-solid choice were artist-tuned per box; today the
  pipeline uses a single fit scale + name-based EXT. Add per-box overrides if needed.
- Migrate the player core vsh/fsh from the MagicShaders baseline onto the clean core + the
  `floamy/registry/*` routers (structure + stubs already in place).

## Two armor delivery modes (both supported by ColorAtlasBaker)
- **old** (`versions: [old]`): leather color-atlas — `COLOR_ARMOR(r,g,b){cords}` + relativeUv +
  marker pixels (63,30)/(63,31), `textures/models/armor/leather_layer_*`.
- **modern** (`versions: [1_21_3]`): `textures/entity/equipment/humanoid[_leggings]/<id>.png`.
