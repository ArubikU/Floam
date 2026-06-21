# Version-abstraction layer

Cosmetics and the generated registry are written **once** and run on every Minecraft version
(1.20.5 → 26.1). They never hard-code version specifics. The per-version differences live behind
a stable contract each `engine/<version>/` must satisfy:

## Contract every version provides (in its `include/`)
1. **Body-part constants** — `HEAD, BODY, RIGHT_ARM, LEFT_ARM, RIGHT_LEG, LEFT_LEG` (+ overlays),
   defined in that version's `cem_locs.glsl`. Their *numeric values differ per version* (the
   1.20.5 vs 1.21.2 ordering change) but the *names are stable*, so `cube == HEAD` works everywhere.
2. **Armor STASIS constants** — `STASIS_HELMET … STASIS_INNER_ARMOR` in `mods/armor/armorparts.glsl`.
3. **CEM core** — `cem/vert_setup.glsl`, `cem/frag_main_setup.glsl` and the Floamy core
   (`floamy/{matf,intersect,raster,macros}.glsl`).
4. **Registry routers** — `floamy/registry/{defines,detect,model}.glsl` (generated; empty stub by default).
5. **EDIT_* / addCem / getChannel helpers** — provided by the player vsh scope.

## What the player core shader does (per version)
- VSH: detect body part + slim, read skin markers, `#moj_import <floamy/registry/detect.glsl>`.
- FSH: `switch(cem)` over the built-ins then `#moj_import <floamy/registry/model.glsl>`.

Because the registry references only the stable names + the clean macro API, the same generated
cosmetic/armor GLSL drops into any version directory unchanged. Adding a new MC version =
add one `engine/<version>/` satisfying the contract; no cosmetic/armor regeneration needed.

## pack delivery
`PackVersion` maps each `engine/<version>/` to a pack_format overlay range; `PackAssembler`
writes a single multi-version pack (newest range open-ended → forward-compatible to 26.1+).
The 2 armor texture modes are handled by `ColorAtlasBaker`: **old** = leather color-atlas
(`COLOR_ARMOR` + relativeUv), **modern** = `textures/entity/equipment/humanoid[_leggings]`.
