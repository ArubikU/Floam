# Floamy3D — version support (1.20.5 → 26.1+)

Minecraft changed its core-shader system several times. A resourcepack overlay covers each
**shader pipeline family** (not each release). Verified vs the Minecraft Wiki pack-format table
and the CEM-S per-version cores.

| Engine dir | pack_format | MC versions | Pipeline / what changed |
|---|---|---|---|
| `1.20.5` | 32–41 | 1.20.5 – 1.21.1 | per-rendertype core shaders under `shaders/core/`; `cem_locs` ordering A |
| `1.21.2` | 42–54 | 1.21.2 – 1.21.4 | per-rendertype, **namespaced** `minecraft:core/` refs, `ModelOffset`/`FogShape` uniforms, `cem_locs` ordering B, new equipment armor path |
| `1.21.5` | 55–62 | 1.21.5 | **major break** — core-shader JSON removed (in-code `RenderPipeline`); only unified `entity.vsh`/`entity.fsh` overridable + modular `cem_user/{detection,models}` |
| `1.21.6` | 63–68 | 1.21.6, 1.21.7/8 (64) | `entity.*` + namespaced `<minecraft:*>` imports + UBO `globals.glsl`, `#version 150` |
| `1.21.9` | 69 → 84 → ∞ | 1.21.9/10 (69), 1.21.11 (75), **26.1 (84)**, future | **another break** — `#version 150 → 330` (OpenGL 3.3); `minecraft_mix_light` split into `compute_light` + `mix_light_separate`; `PER_FACE_LIGHTING` flag |

Mojang moved to **year-based versioning** after 1.21.x: the release after is **26.1**, pack_format
**84** (in the `#version 330` family). From 1.21.9 packs may declare `min_format`/`max_format`
ranges — our `pack.mcmeta` `supported_formats` already spans `32 … MAX`, and the newest overlay
(`1.21.9`, open-ended) keeps working forward to 26.1 and beyond.

## Universal vs versioned (how the pack is laid out)
- **Universal** → `engine/common-pack/` → assembled into the pack **root** (`assets/...`), applies to
  every format: the clean Floamy core `floamy/{matf,intersect,raster,macros}` + the generated
  `floamy/registry/{defines,detect,model}` (cosmetics/armor reference only stable names + the clean
  macro contract, so ONE copy serves all versions).
- **Versioned** → `engine/<version>/` → format-ranged overlay, only the files that actually differ:
  core `entity.*` / `rendertype_*` (incl. `#version`), `cem_locs.glsl` (body-part id ordering A/B),
  `mods/armor/{armorparts,setup}.glsl` (`ARMOR_*` indices + `ARMOR_SCALE` + cube map),
  `fog_reader.glsl` (legacy `fog_distance` vs `fog_spherical/cylindrical`), `wpos_etrans.glsl`,
  `cem/frag_main_setup.glsl` (the `dir`/`dirTBN` `* mat3(ModelViewMat)` change 1.20.5 → 1.21.2+).
  Source of truth for the per-version ARMOR templates = `FloamArmors/defaults/<v>/` (Forgery).

`PackVersion` encodes these ranges; `PackAssembler` emits the overlay `pack.mcmeta`. Adding a
future family = add one `engine/<dir>/` + one `PackVersion` entry.

## Status per family (audited)
- **1.20.5** — FULL Floam player-cosmetic + armor path (MagicShaders baseline). Internally
  consistent; generated armor `armorcords.glsl` and cosmetic `switch(cem)` plug in. The one
  loadable/working family today.
- **1.21.2 / 1.21.5 / 1.21.6** — engine = CEM-S per-version core, now **import-complete** (the
  shared CEM-S `include/cem/*` + matf/hue/noise were merged in; all non-vanilla `#moj_import`s
  resolve; 1.21.6 gets `cem_user/` from 1.21.5). So CEM-S's own examples (pig/armor-stand/elytra)
  render. **NOT yet wired for Floam:** the player-cosmetic + armor detection/model is NOT ported
  onto these pipelines, and the generated `floamy/registry/*` routers are present but not
  `#moj_import`-ed by the cores yet. Remaining work per version: provide `cem_locs.glsl` body-part
  ids for that version, wire `floamy/registry/{detect,model}` into the core vsh/fsh (or
  `cem_user/` on 1.21.5+), add the armor `armorcords` injection point, then verify in-game.

## ⚠ 1.21.6+ moved built-in uniforms to UBOs
From 1.21.6 the loose uniforms (`ProjMat`, `ModelViewMat`, `Light0_Direction`, …) became uniform
blocks (Globals + DynamicTransforms UBOs). The clean core references those names directly, which
keeps working ONLY because the core `entity.*` imports the vanilla `<minecraft:dynamictransforms.glsl>`
/ `projection.glsl` / `globals.glsl` that expose them as macros. Any new core shader on 1.21.6+
MUST import those, and `writeDepth()`'s `ProjMat[3][0]` GUI check needs an in-game re-verify.
Mojang also marks core-shader overrides as *unsupported* — expect churn; the open-ended overlay
+ this doc are how we keep up.

## Generating the multi-version pack
```
java -cp Floamy3D-*.jar dev.arubiku.floamy3d.cli.FloamyCli pack engine <out>
# -> <out>/pack.mcmeta with 4 overlays, formats 32 .. MAX (covers 26.1)
```
