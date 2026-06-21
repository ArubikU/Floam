/* Floamy3D engine — raster.glsl
 * Textured surface rasterizers. THE redesign lives here:
 *   - ONE face->UV resolver f_faceUV(): no per-face special-casing scattered across
 *     six copy-pasted branches like the legacy code.
 *   - Faces are passed in natural order (down,up,north,east,south,west); the rasterizer
 *     maps the hit normal to the correct side. No macro<->function argument permutation.
 *   - `mirror` is a first-class flag = horizontal flip of the face. Left/right symmetric
 *     parts differ ONLY by mirror (structural fix for the reversed-foot class of bug).
 *   - `rot` in {0,1,2,3} = consistent CCW 90° steps on EVERY face/surface.
 * Requires: Sampler0, Light0_Direction, Light1_Direction, minecraft_mix_light() in scope.
 * Depends on intersect.glsl.
 */

// ---- UV helpers -------------------------------------------------------------

// Base per-face orientation that reproduces the legacy default look for rot=0,mirror=0.
vec2 f_orient(vec3 normal, vec2 b)
{
    // West (normal.x<0) and South (normal.z>0) read mirrored on X by convention.
    if (normal.x < -0.9 || normal.z > 0.9) return vec2(1.0 - b.x, b.y);
    return b;
}

vec2 f_applyRot(vec2 o, float rot)
{
    if (rot == 1.0) return vec2(o.y, 1.0 - o.x);        // 90° CCW
    if (rot == 2.0) return vec2(1.0 - o.x, 1.0 - o.y);  // 180°
    if (rot == 3.0) return vec2(1.0 - o.y, o.x);        // 270° CCW
    return o;                                           // 0°
}

// Resolve the texture pixel-coord (vec2) for a box face hit.
// Returns vec2(-1) sentinel when the hit face's side is disabled (vec4(0)).
vec2 f_faceUV(vec3 normal, vec2 box,
              vec4 dS, vec4 uS, vec4 nS, vec4 eS, vec4 sS, vec4 wS,
              float dR, float uR, float nR, float eR, float sR, float wR,
              bool mirror)
{
    vec4 side; float rot;
    // Face/normal mapping matches CEM-S: Down is +Y normal, Up is -Y normal.
    if      (normal.x >  0.9) { side = eS; rot = eR; }
    else if (normal.x < -0.9) { side = wS; rot = wR; }
    else if (normal.z >  0.9) { side = sS; rot = sR; }
    else if (normal.z < -0.9) { side = nS; rot = nR; }
    else if (normal.y >  0.9) { side = dS; rot = dR; }  // Down
    else                      { side = uS; rot = uR; }  // Up (normal.y < -0.9)

    if (side == VECNULL4) return vec2(-1.0);

    vec2 o = f_orient(normal, box);
    if (mirror) o.x = 1.0 - o.x;
    o = f_applyRot(o, rot);
    return side.xy + side.zw * o;
}

// ---- box rasterizers --------------------------------------------------------

// Full-featured box: optional per-face rotation, mirror, EXT see-through, transparency.
vec4 f_sBox(vec3 ro, vec3 rd, vec3 size, mat3 TBN, vec4 color, inout float T,
            vec4 dS, vec4 uS, vec4 nS, vec4 eS, vec4 sS, vec4 wS,
            float dR, float uR, float nR, float eR, float sR, float wR,
            bool mirror, bool ext, bool keepBlack)
{
    vec2 texSize = textureSize(Sampler0, 0);
    vec3 normal = VECNULL;

    vec3 box = boxIntersect(ro, rd, size, normal);
    if (box.z >= T) return color;

    vec2 uv = f_faceUV(normal, box.xy, dS, uS, nS, eS, sS, wS, dR, uR, nR, eR, sR, wR, mirror);
    vec4 col = (uv.x < 0.0) ? VECNULL4 : texture(Sampler0, uv / texSize);

    // EXT: if the front face is transparent, sample the back face instead.
    if (ext && ((col.rgb == VECNULL && !keepBlack) || col.a < 0.1) && EXT_ENABLE == 1)
    {
        box = boxIntersectInv(ro, rd, size, normal);
        uv = f_faceUV(normal, box.xy, dS, uS, nS, eS, sS, wS, dR, uR, nR, eR, sR, wR, mirror);
        col = (uv.x < 0.0) ? VECNULL4 : texture(Sampler0, uv / texSize);
    }

    col = minecraft_mix_light(Light0_Direction, Light1_Direction, normalize(TBN * normal), col);
    if (col.a < 0.1) return color;
    if (col.rgb == VECNULL && !keepBlack) return color;

    T = box.z;
    return col;
}

// Solid (untextured) box — fills with newColor, optionally emissive (no light mix).
vec4 f_sBoxSolid(vec3 ro, vec3 rd, vec3 size, mat3 TBN, vec4 color, inout float T,
                 vec4 newColor, bool emissive, bool backFace)
{
    vec3 normal = VECNULL;
    vec3 box = backFace ? boxIntersectInv(ro, rd, size, normal)
                        : boxIntersect(ro, rd, size, normal);
    if (box.z >= T) return color;
    vec4 col = emissive ? newColor
                        : minecraft_mix_light(Light0_Direction, Light1_Direction, normalize(TBN * normal), newColor);
    T = box.z;
    return col;
}

// ---- planar rasterizers (square / triangle) --------------------------------

vec4 f_sSquare(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 uv, float rot,
               bool mirror, bool lightFix, vec4 tint, vec4 color, inout float T)
{
    vec3 hit = squareIntersect(ro, rd, p1, p2, p3);
    if (hit.z >= T) return color;

    vec2 o = hit.xy;
    if (mirror) o.x = 1.0 - o.x;
    o = f_applyRot(o, rot);
    vec4 col = texelFetch(Sampler0, ivec2(uv.xy + uv.zw * o), 0);

    if (lightFix) {
        vec3 normal = normalize(cross(p2 - p1, p3 - p1) * rd);
        col = minecraft_mix_light(Light0_Direction, Light1_Direction, normal, col);
    } else {
        col = col * tint;
    }
    if (col.a < 0.1 || col.rgb == VECNULL) return color;
    T = hit.z;
    return col;
}

vec4 f_sTris(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 uv, float rot,
             bool mirror, bool lightFix, vec4 tint, vec4 color, inout float T)
{
    vec3 hit = triIntersect(ro, rd, p1, p2, p3);
    if (hit.z >= T) return color;

    vec2 o = hit.xy;
    if (mirror) o.x = 1.0 - o.x;
    o = f_applyRot(o, rot);
    vec4 col = texelFetch(Sampler0, ivec2(uv.xy + uv.zw * o), 0);

    if (lightFix) {
        vec3 normal = normalize(cross(p2 - p1, p3 - p1) * rd);
        col = minecraft_mix_light(Light0_Direction, Light1_Direction, normal, col);
    } else {
        col = col * tint;
    }
    if (col.a < 0.1 || col.rgb == VECNULL) return color;
    T = hit.z;
    return col;
}
