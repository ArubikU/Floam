/* Floamy3D engine — matf.glsl
 * Rotation matrices + rotation-name macros + pos/size hooks.
 * Imported before the CEM core. Do NOT declare #version here; the core shader owns it.
 * Derived from CEM-S/MagicShaders matf (behaviour-preserving).
 */

#define X 0
#define Y 1
#define Z 2
#define PI 3.14159265

// pos/size pass-through hooks. Kept as functions so global model transforms
// (scale, offset, debug) can be injected in one place without touching call sites.
vec3 matf_verifyPos(vec3 pos)  { return pos; }
vec3 matf_verifySize(vec3 size){ return size; }

mat3 Rotate3(float angle, int axis)
{
    float s = sin(angle);
    float c = cos(angle);
    if (axis == X)
        return mat3(1.0, 0.0, 0.0,
                    0.0,   c,  -s,
                    0.0,   s,   c);
    if (axis == Y)
        return mat3(  c, 0.0,   s,
                    0.0, 1.0, 0.0,
                     -s, 0.0,   c);
    if (axis == Z)
        return mat3(  c,  -s, 0.0,
                      s,   c, 0.0,
                    0.0, 0.0, 1.0);
    return mat3(1.0); // identity for axis-less / zero rotation
}

mat4 Rotate(float angle, int axis)
{
    float s = sin(angle);
    float c = cos(angle);
    if (axis == X)
        return mat4(1.0, 0.0, 0.0, 0.0,
                    0.0,   c,  -s, 0.0,
                    0.0,   s,   c, 0.0,
                    0.0, 0.0, 0.0, 1.0);
    if (axis == Y)
        return mat4(  c, 0.0,   s, 0.0,
                    0.0, 1.0, 0.0, 0.0,
                     -s, 0.0,   c, 0.0,
                    0.0, 0.0, 0.0, 1.0);
    if (axis == Z)
        return mat4(  c,  -s, 0.0, 0.0,
                      s,   c, 0.0, 0.0,
                    0.0, 0.0, 1.0, 0.0,
                    0.0, 0.0, 0.0, 1.0);
    return mat4(1.0);
}

mat4 RotateByAxis(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    return mat4(oc*axis.x*axis.x + c,        oc*axis.x*axis.y - axis.z*s, oc*axis.z*axis.x + axis.y*s, 0.0,
                oc*axis.x*axis.y + axis.z*s, oc*axis.y*axis.y + c,        oc*axis.y*axis.z - axis.x*s, 0.0,
                oc*axis.z*axis.x - axis.y*s, oc*axis.y*axis.z + axis.x*s, oc*axis.z*axis.z + c,        0.0,
                0.0,                         0.0,                         0.0,                         1.0);
}

// Named quarter/eighth/etc. rotations. Naming: [P|N]I<axis><denom>, P=positive N=negative.
// bare = PI/2, 25 = PI/4, 12 = PI/8, 62 = PI/16, 31 = PI/32, 16 = PI/64, 2 = PI, 3 = 1.5*PI.
#define PINULL Rotate3(0.0, X)

#define PIX   Rotate3( PI*0.5,     X)
#define PIX25 Rotate3( PI*0.25,    X)
#define PIX12 Rotate3( PI*0.125,   X)
#define PIX62 Rotate3( PI*0.0625,  X)
#define PIX31 Rotate3( PI*0.03125, X)
#define PIX16 Rotate3( PI*0.015625,X)
#define PIX2  Rotate3( PI,         X)
#define PIX3  Rotate3( PI*1.5,     X)
#define PIY   Rotate3( PI*0.5,     Y)
#define PIY25 Rotate3( PI*0.25,    Y)
#define PIY12 Rotate3( PI*0.125,   Y)
#define PIY62 Rotate3( PI*0.0625,  Y)
#define PIY31 Rotate3( PI*0.03125, Y)
#define PIY16 Rotate3( PI*0.015625,Y)
#define PIY2  Rotate3( PI,         Y)
#define PIY3  Rotate3( PI*1.5,     Y)
#define PIZ   Rotate3( PI*0.5,     Z)
#define PIZ25 Rotate3( PI*0.25,    Z)
#define PIZ12 Rotate3( PI*0.125,   Z)
#define PIZ62 Rotate3( PI*0.0625,  Z)
#define PIZ31 Rotate3( PI*0.03125, Z)
#define PIZ16 Rotate3( PI*0.015625,Z)
#define PIZ2  Rotate3( PI,         Z)
#define PIZ3  Rotate3( PI*1.5,     Z)

#define NIX   Rotate3(-PI*0.5,     X)
#define NIX25 Rotate3(-PI*0.25,    X)
#define NIX12 Rotate3(-PI*0.125,   X)
#define NIX62 Rotate3(-PI*0.0625,  X)
#define NIX31 Rotate3(-PI*0.03125, X)
#define NIX16 Rotate3(-PI*0.015625,X)
#define NIX2  Rotate3(-PI,         X)
#define NIX3  Rotate3(-PI*1.5,     X)
#define NIY   Rotate3(-PI*0.5,     Y)
#define NIY25 Rotate3(-PI*0.25,    Y)
#define NIY12 Rotate3(-PI*0.125,   Y)
#define NIY62 Rotate3(-PI*0.0625,  Y)
#define NIY31 Rotate3(-PI*0.03125, Y)
#define NIY16 Rotate3(-PI*0.015625,Y)
#define NIY2  Rotate3(-PI,         Y)
#define NIY3  Rotate3(-PI*1.5,     Y)
#define NIZ   Rotate3(-PI*0.5,     Z)
#define NIZ25 Rotate3(-PI*0.25,    Z)
#define NIZ12 Rotate3(-PI*0.125,   Z)
#define NIZ62 Rotate3(-PI*0.0625,  Z)
#define NIZ31 Rotate3(-PI*0.03125, Z)
#define NIZ16 Rotate3(-PI*0.015625,Z)
#define NIZ2  Rotate3(-PI,         Z)
#define NIZ3  Rotate3(-PI*1.5,     Z)
