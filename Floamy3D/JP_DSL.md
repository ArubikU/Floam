# Floamy3D `.jp` DSL — Reference

Hot-reloadable transform scripts. Edit a `.jp`, run **`/floamy3d build`** in-game to reload + regenerate + re-send the pack. No server restart needed for `.jp` changes (only for Java/engine changes).

---

## Files & load order

| folder | scope |
|---|---|
| `parsers/_*.jp` | shared / vars — **loaded first** (define `var`s, global defaults here) |
| `parsers/armor/*.jp` | armor parts |
| `parsers/cosmetic/*.jp` | cosmetic (player) parts |

Within a folder, files load alphabetically (`_`-prefixed first). Later rules **stack on top** of earlier ones (ops accumulate).

---

## Matching

```
match <glob> [<glob> ...]
```
Match key = **`<armorId>:<partName>`** (lowercased). A rule with no `match` applies to everything.

- `match *:*shoe*` → all feet of all armors
- `match licorn_fenrir:*` → one whole armor
- `match licorn_fenrir:*shoe*` → one armor's feet
- `match *:*left_arm* *:*left_leg*` → multiple globs (OR)

### JEM part names (what `partName` is)
`head` `body` `left_arm` `right_arm` `left_shoe` `right_shoe` `waist` `left_leg` `right_leg`
- Layer 1 (chestplate/boots slot): `body` `left_arm` `right_arm` `left_shoe` `right_shoe` `head`
- Layer 2 (leggings slot): `waist` `body`(→inner) `left_leg` `right_leg`

L/R is auto-detected by the shader (UV region for part-type + `gl_VertexID` parity for side) — you author left/right parts separately and each renders on its correct limb.

---

## Variables & expressions

```
var NAME <expr>          # global constant -> use as $NAME anywhere
```
Expr operators: `+ - * / ( )`. Tokens usable inside expressions:

| token | meaning | valid in |
|---|---|---|
| `t.x t.y t.z` | part frame translate | part & box ops |
| `sz.x sz.y sz.z` | box half-size (post-scale) | box ops |
| `bz.x bz.y bz.z` | box position | box ops |
| `idx` | cube index | box ops |
| `$NAME` | a `var` | anywhere |
| numbers | literal | anywhere |

---

## PART-scope ops
Apply to the whole part (the "frame"). **No cube selector** — they affect the part as a unit.

| op | args | effect |
|---|---|---|
| `translate` | `x y z` | frame translate **+=** (x,y,z) |
| `set` | `t.x\|t.y\|t.z <expr>` | **assign** one translate axis |
| `mul` | `t.x\|t.y\|t.z <expr>` | **multiply** one translate axis |
| `rotate` | `x\|y\|z <deg>` | **orientation** of ALL boxes (incl. sub-bones), spins in place. += |
| `rotatesc` | `x\|y\|z <deg>` | **position** rotation of whole part around `scenepivot` (orbits boxes). += |
| `translatesc` | `x y z` | shift whole scene (after rotatesc). += |
| `scalesc` | `<expr>` | scale whole scene around `scenepivot`. assign |
| `scenepivot` | `x y z` | pivot for `rotatesc`/`scalesc` (default = origin 0,0,0). assign |
| `rotatechilds` | `x\|y\|z <deg>` | extra **orientation**, **sub-bones only**, on top of everything. += |
| `rotatescchilds` | `x\|y\|z <deg>` | extra **position** rotation, **sub-bones only**. += |
| `invert` | `x\|y\|z [on\|off]` | cosmetics: bake JEM axis invert |
| `base` | `PIX\|none` | coordinate bridge. `PIX` = armor convention; `none` = raw |
| `scale` | `<expr>` | per-part uniform scale (default 0.75). assign |
| `sizeadd` | `<expr>` | inflate every box half-extent. assign |
| `bone` | `NAME` | override the engine STASIS bone (e.g. `STASIS_RIGHT_BOOT`) |
| `mirror` | `[on\|off]` | part mirror flag (no axis = part scope) |
| `center` | `<z>` | center the part's biggest box on the bone (X=0,Y=0) at depth Z |

### `rotate` vs `rotatesc` vs `*childs`
- `rotate` = spin orientation **in place** (box doesn't move), whole part incl children.
- `rotatesc` = **orbit** positions around `scenepivot` (boxes move), orientation untouched.
- `rotatechilds` / `rotatescchilds` = same but **only on articulated sub-bones** (submodels that have their own rotation). Root cubes (and unrotated container submodels) are NOT affected.

**Pivot matters**: `rotatesc` rotates around `scenepivot` (default origin). For parts with offset boxes (e.g. spike decorations), set `scenepivot` to the body center so they fold correctly instead of swinging away.

---

## BOX-scope ops
Apply per cube. Select cubes first with `cube`; if no `cube` given, they target **all** cubes of the part.

| op | args | effect |
|---|---|---|
| `cube` | `<idx>\|*` | **selector** — following box ops target this cube (or `*` = all) |
| `seat` | — | `bz.z = -sz.y` (sit box on the bone by its height) |
| `bset` | `bz.x\|bz.y\|bz.z <expr>` | **assign** a box-position axis |
| `btranslate` | `x y z` | box position **+=** (x,y,z) |
| `flipu` | — | flip U (horizontal) on ALL faces |
| `flipv` | — | flip V (vertical) on ALL faces |
| `flipupf` | — | flip U **only on per-face-UV boxes** (box-UV untouched) |
| `flipvpf` | — | flip V **only on per-face-UV boxes** |
| `flipface` | `<face> [u\|v]` | flip ONE face's UV (default U) |
| `switchface` | `<faceA> <faceB>` | swap the UVs of two faces |
| `mirror` | `x\|y\|z` | box: negate position on axis **+** flip the matching UV |

### Face names
`down` `up` `north`(=`front`) `east` `south`(=`back`) `west`

### per-face vs box-UV
- **box-UV** = the cube has `textureOffset` (standard MC auto-unwrap).
- **per-face** = the cube has `uvNorth`/`uvUp`/... (each face its own rect).
- `flipu`/`flipv` hit both; `flipupf`/`flipvpf` hit per-face only. Useful when a part mixes both and you only want to fix the per-face ones (e.g. flip left-side per-face U: `4,0` → `4,-4`).

---

## Transform pipeline (order things apply)
1. **Bone hierarchy** (JEM): each submodel rotates its boxes around its `translate` (pivot); nested bones compose. → world position + orientation.
2. **Part frame**: `translate` / `scale` / `sizeadd`.
3. **Scene** (around `scenepivot`): `scalesc` → `rotatesc` (+`rotatescchilds` on sub-bones) → `translatesc`.
4. **Coordinate bridge**: X↔Z swap, then `PIX` (if `base PIX`).
5. **Orientation**: `euler(rotate)` · bone-accumulated (+`rotatechilds` on sub-bones).
6. **Box ops**: `seat`/`bset`/`btranslate` (position), `switchface`/`flipu`/`flipv`/`flipupf`/`flipface` (UV).

---

## Examples

```jp
# all feet: lift + sit on bone
match *:*shoe*
scale 0.85
cube *
btranslate 0 0 -12

# one armor's left arm: flip per-face U only
match masaki_spike:*left_arm*
cube *
flipupf

# spikes (offset decorations): fold around body center, not origin
match *:*body*
scenepivot 0 -6 0
rotatesc y -90
rotatesc z -90
rotate x 90

# nested sub-bone fine-tune (only the rotated sub-bones)
match licorn_fenrir:*right_arm*
rotatechilds x 90
rotatescchilds y 45
```
