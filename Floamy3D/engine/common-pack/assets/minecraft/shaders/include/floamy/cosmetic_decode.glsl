/* Floamy3D — data-driven cosmetic decode + render. ALIGNED WITH THE ARMOR PIPELINE: reproduces
 * ADD_BOX_ROTATE — R*(-center + pos*ms), R = euler * PIX (the JEM->CEM base) — so cosmetics render in
 * the SAME coordinate space as armor / the reference MagicShaders cape. Geometry from the generated
 * COS_DATA uint array (2 scalars packed/elem). Layout MUST match CosmeticCodec.java.
 * Lives OUTSIDE floamy/cosmetics (that dir is wiped each build). Requires in scope: center, dirTBN,
 * modelSize, TBN, color, minT, relativeUv(), boxIntersect(), sBoxWithRotation(), PIX, GameTime.
 */

// runtime-axis rotation matrix (col-major, matching matf Rotate3) — used by the generated cos_anim_rot.
mat3 cos_rot(float a, int axis) {
    float c = cos(a), s = sin(a);
    if (axis == 0) return mat3(1.0, 0.0, 0.0,  0.0, c, -s,  0.0, s, c);
    if (axis == 1) return mat3(c, 0.0, s,  0.0, 1.0, 0.0,  -s, 0.0, c);
    return mat3(c, -s, 0.0,  s, c, 0.0,  0.0, 0.0, 1.0);
}

#moj_import <floamy/cosmetics/data.glsl>

// two 16-bit scalars packed per uint (hi<<16 | lo). cos_u(i) = the i-th raw scalar (0..65535).
int cos_u(int i) {
    uint w = COS_DATA[i >> 1];
    return int((i & 1) == 0 ? (w >> 16) : (w & 0xFFFFu));
}
float cos_f(int i) { return float(cos_u(i)) / 65535.0 * (2.0 * COS_RANGE) - COS_RANGE; }

void cosmeticRender(int cemi, vec3 center, vec3 dirTBN, float modelSize, mat3 TBN, ivec2 cord, inout vec4 color, inout float minT) {
    int start, count; cos_index(cemi, start, count);
    for (int bi = 0; bi < count; bi++) {
        int gid = start + bi;
        int o = gid * COS_PPB;
        vec3 pos  = vec3(cos_f(o),   cos_f(o+1), cos_f(o+2));
        vec3 size = vec3(cos_f(o+3), cos_f(o+4), cos_f(o+5));
        mat3 Rown = mat3(cos_f(o+6),  cos_f(o+7),  cos_f(o+8),
                         cos_f(o+9),  cos_f(o+10), cos_f(o+11),
                         cos_f(o+12), cos_f(o+13), cos_f(o+14));        // in-place
        mat3 Rgroup = mat3(cos_f(o+15), cos_f(o+16), cos_f(o+17),
                           cos_f(o+18), cos_f(o+19), cos_f(o+20),
                           cos_f(o+21), cos_f(o+22), cos_f(o+23));      // orbits gp
        vec3 gp = vec3(cos_f(o+24), cos_f(o+25), cos_f(o+26));
#ifndef COS_NO_ANIM
        pos  += cos_anim_pos(gid);
        size += cos_anim_size(gid);
        Rgroup = cos_anim_rot(gid) * Rgroup;   // animate the GROUP (sways all its cubes together)
#endif
        // pre-PIX nested transform: group rotates all cubes rigidly around gp; own stays in place. Then PIX.
        vec3 mc = gp + Rgroup * (pos - gp);
        mat3 Rfull = PIX * Rgroup * Rown;
        vec3 _ro = Rfull * -center + (PIX * mc) * modelSize;
        vec3 _rd = Rfull * dirTBN;
        vec3 _sz = size * modelSize;
        vec3 _nrm; vec3 _hit = boxIntersect(_ro, _rd, _sz, _nrm, true);
        if (_hit.z < minT) {
            cosEmissive = cos_f(o+51);
            cosAlpha    = cos_f(o+52);
            vec4 u = relativeUv(floor(cos_f(o+27)+0.5), floor(cos_f(o+28)+0.5), floor(cos_f(o+29)+0.5), floor(cos_f(o+30)+0.5), cord);
            vec4 d = relativeUv(floor(cos_f(o+31)+0.5), floor(cos_f(o+32)+0.5), floor(cos_f(o+33)+0.5), floor(cos_f(o+34)+0.5), cord);
            vec4 n = relativeUv(floor(cos_f(o+35)+0.5), floor(cos_f(o+36)+0.5), floor(cos_f(o+37)+0.5), floor(cos_f(o+38)+0.5), cord);
            vec4 we= relativeUv(floor(cos_f(o+39)+0.5), floor(cos_f(o+40)+0.5), floor(cos_f(o+41)+0.5), floor(cos_f(o+42)+0.5), cord);
            vec4 so= relativeUv(floor(cos_f(o+43)+0.5), floor(cos_f(o+44)+0.5), floor(cos_f(o+45)+0.5), floor(cos_f(o+46)+0.5), cord);
            vec4 ea= relativeUv(floor(cos_f(o+47)+0.5), floor(cos_f(o+48)+0.5), floor(cos_f(o+49)+0.5), floor(cos_f(o+50)+0.5), cord);
            color = sBoxWithRotation(_ro, _rd, _sz, TBN * transpose(Rfull), color, minT, u, d, n, we, so, ea, 2., 2., 2., 2., 2., 2., true);
        }
    }
}
