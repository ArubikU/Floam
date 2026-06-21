/* Floamy3D engine — intersect.glsl
 * Ray intersection primitives. Math is the proven CEM-S/MagicShaders set, unchanged.
 * Requires: Sampler0 in scope (texture size). Constants below.
 */

#define EXT_ENABLE 1
#define MAX_DEPTH  1024000
#define VEDEPTH    vec3(MAX_DEPTH)
#define VECNULL    vec3(0)
#define VECNULL4   vec4(0)

// Ray vs infinite plane defined by v0 + edges to v1,v2. Returns (u, v, t).
vec3 planeIntersect(in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2)
{
    vec3 v1v0 = v1 - v0;
    vec3 v2v0 = v2 - v0;
    vec3 rov0 = ro - v0;
    vec3 n = cross(v1v0, v2v0);
    vec3 q = cross(rov0, rd);
    float d = 1.0 / dot(rd, n);
    return vec3(d * dot(-q, v2v0),   // u
                d * dot( q, v1v0),   // v
                d * dot(-n, rov0));  // t
}

// Plane intersect clamped to the unit square (u,v in [0,1]).
vec3 squareIntersect(in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2)
{
    vec3 val = planeIntersect(ro, rd, v0, v1, v2);
    if (val.x < 0.0 || val.y < 0.0 || val.x > 1.0 || val.y > 1.0 || val.z < 0.0)
        val.z = MAX_DEPTH;
    return val;
}

// Plane intersect clamped to the unit triangle (u>=0, v>=0, u+v<=1).
vec3 triIntersect(in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2)
{
    vec3 val = planeIntersect(ro, rd, v0, v1, v2);
    if (val.x < 0.0 || val.y < 0.0 || val.z < 0.0 || val.x + val.y > 1.0)
        val.z = MAX_DEPTH;
    return val;
}

// True if the ray origin is already inside the AABB (used to skip self-occluding entry).
bool isInside(vec3 ro, vec3 rd, vec3 size)
{
    vec3 m = 1.0 / rd;
    vec3 n = m * ro;
    vec3 k = abs(m) * size;
    vec3 t1 = -n - k;
    float tN = max(max(t1.x, t1.y), t1.z);
    return tN < 0.0;
}

// Ray vs AABB (front faces). outNormal = hit face normal. Returns (texU, texV, t).
vec3 boxIntersect(vec3 ro, vec3 rd, vec3 size, out vec3 outNormal)
{
    vec3 m = 1.0 / rd;
    vec3 n = m * ro;
    vec3 k = abs(m) * size;
    vec3 t1 = -n - k;
    vec3 t2 = -n + k;
    float tN = max(max(t1.x, t1.y), t1.z);
    float tF = min(min(t2.x, t2.y), t2.z);
    if (tN > tF || tF < 0.0) return VEDEPTH;

    outNormal = -sign(rd) * step(t1.yzx, t1.xyz) * step(t1.zxy, t1.xyz);
    float t = tN > 0.0 ? tN : tF;

    vec3 pos = (ro + rd * t) / size;
    vec2 tex = vec2(0);
    if      (abs(outNormal.x) > 0.9) tex = pos.zy;
    else if (abs(outNormal.y) > 0.9) tex = pos.xz;
    else if (abs(outNormal.z) > 0.9) tex = pos.xy;
    return vec3(clamp(tex * 0.5 + 0.5, vec2(0), vec2(1)), t);
}

// Ray vs AABB (back faces) — used by EXT rasterizers to "see through" transparent front faces.
vec3 boxIntersectInv(vec3 ro, vec3 rd, vec3 size, out vec3 outNormal)
{
    vec3 m = 1.0 / rd;
    vec3 n = m * ro;
    vec3 k = abs(m) * size;
    vec3 t1 = -n - k;
    vec3 t2 = -n + k;
    float tN = max(max(t1.x, t1.y), t1.z);
    float tF = min(min(t2.x, t2.y), t2.z);
    if (tN > tF || tF < 0.0) return VEDEPTH;

    outNormal = sign(rd) * step(t2.xyz, t2.yzx) * step(t2.xyz, t2.zxy);

    vec3 pos = (ro + rd * tF) / size;
    vec2 tex = vec2(0);
    if      (abs(outNormal.x) > 0.9) tex = pos.zy;
    else if (abs(outNormal.y) > 0.9) tex = pos.xz;
    else if (abs(outNormal.z) > 0.9) tex = pos.xy;
    return vec3(clamp(tex * 0.5 + 0.5, vec2(0), vec2(1)), tF);
}

// Custom depth write — handles both perspective and GUI (orthographic) projection.
void writeDepth(vec3 Pos)
{
    vec4 ProjPos = (ProjMat[3][0] == -1)
        ? ProjMat * vec4(Pos, 1.0)
        : ProjMat * ModelViewMat * vec4(Pos, 1.0);
    gl_FragDepth = ProjPos.z / ProjPos.w * 0.5 + 0.5;
}
