/* Floamy3D engine — macros.glsl
 * The ADD_* superset the model GLSL (and the bbmodel->GLSL emitter) targets.
 * Faces are ALWAYS in natural order: down, up, north, east, south, west.
 * Each face is vec4(pixelX, pixelY, pixelW, pixelH); pass vec4(0) to disable a face.
 * Requires in scope: center, dirTBN, modelSize, TBN, color, minT, vertexColor.
 * Depends on matf.glsl, intersect.glsl, raster.glsl.
 */

// Ray origin/dir/TBN for an un-rotated vs pivot-rotated box.
#define F_RO_FLAT(pos)            (-center + matf_verifyPos(pos) * modelSize)
#define F_RO_ROT(pos, pivot, R)   ( R * (-center + (matf_verifyPos(pos) + (pivot)) * modelSize) - (pivot) * modelSize )

// ---- master box macro -------------------------------------------------------
// All other box macros expand to this. rotations dR..wR in {0,1,2,3}.
#define ADD_BOX_FULL(ro, rd, tbn, size, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir, ext, keepBlack) { \
    color = f_sBox(ro, rd, matf_verifySize(size) * modelSize, tbn, color, minT, \
                   d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir, ext, keepBlack); }

// Plain textured box.
#define ADD_BOX(pos, size, d,u,n,e,s,w) \
    ADD_BOX_FULL(F_RO_FLAT(pos), dirTBN, TBN, size, d,u,n,e,s,w, 0.,0.,0.,0.,0.,0., false, false, false)

// Mirrored (left/right symmetric part) — the reversed-foot fix: just flip this flag.
#define ADD_BOX_MIRROR(pos, size, d,u,n,e,s,w) \
    ADD_BOX_FULL(F_RO_FLAT(pos), dirTBN, TBN, size, d,u,n,e,s,w, 0.,0.,0.,0.,0.,0., true, false, false)

// Per-face UV rotation.
#define ADD_BOX_ROT(pos, size, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR) \
    ADD_BOX_FULL(F_RO_FLAT(pos), dirTBN, TBN, size, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, false, false, false)

// 3D pivot rotation (R = a Rotate3/named macro, pivot = vec3).
#define ADD_BOX_ROTATE(pos, size, R, pivot, d,u,n,e,s,w) \
    ADD_BOX_FULL(F_RO_ROT(pos, pivot, R), R * dirTBN, TBN * inverse(R), size, d,u,n,e,s,w, 0.,0.,0.,0.,0.,0., false, false, false)

// 3D pivot rotation + per-face UV rotation + mirror (the everything macro).
#define ADD_BOX_ROTATE_FULL(pos, size, R, pivot, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir) \
    ADD_BOX_FULL(F_RO_ROT(pos, pivot, R), R * dirTBN, TBN * inverse(R), size, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir, false, false)

// EXT: see through transparent front faces (cosmetics with holes / inner / inverted surfaces).
#define ADD_BOX_EXT(pos, size, d,u,n,e,s,w) \
    ADD_BOX_FULL(F_RO_FLAT(pos), dirTBN, TBN, size, d,u,n,e,s,w, 0.,0.,0.,0.,0.,0., false, true, false)

#define ADD_BOX_EXT_ROTATE(pos, size, R, pivot, d,u,n,e,s,w) \
    ADD_BOX_FULL(F_RO_ROT(pos, pivot, R), R * dirTBN, TBN * inverse(R), size, d,u,n,e,s,w, 0.,0.,0.,0.,0.,0., false, true, false)

// EXT everything: pivot rotation + per-face rotation + mirror, with inside-out fallback.
#define ADD_BOX_EXT_ROTATE_FULL(pos, size, R, pivot, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir) \
    ADD_BOX_FULL(F_RO_ROT(pos, pivot, R), R * dirTBN, TBN * inverse(R), size, d,u,n,e,s,w, dR,uR,nR,eR,sR,wR, mir, true, false)

// ---- solid boxes ------------------------------------------------------------
#define ADD_BOX_SOLID(pos, size, newColor) { \
    color = f_sBoxSolid(F_RO_FLAT(pos), dirTBN, matf_verifySize(size) * modelSize, TBN, color, minT, newColor, false, false); }
#define ADD_BOX_SOLID_EMISSIVE(pos, size, newColor) { \
    color = f_sBoxSolid(F_RO_FLAT(pos), dirTBN, matf_verifySize(size) * modelSize, TBN, color, minT, newColor, true, false); }

// ---- planar surfaces --------------------------------------------------------
#define ADD_SQUARE(p1, p2, p3, uv) { \
    color = f_sSquare(-center, dirTBN, matf_verifyPos(p1) * modelSize, matf_verifyPos(p2) * modelSize, matf_verifyPos(p3) * modelSize, \
                      uv, 0.0, false, false, vertexColor, color, minT); }
#define ADD_SQUARE_ROT(p1, p2, p3, uv, rot) { \
    color = f_sSquare(-center, dirTBN, matf_verifyPos(p1) * modelSize, matf_verifyPos(p2) * modelSize, matf_verifyPos(p3) * modelSize, \
                      uv, rot, false, false, vertexColor, color, minT); }
#define ADD_SQUARE_LIGHTFIX(p1, p2, p3, uv) { \
    color = f_sSquare(-center, dirTBN, matf_verifyPos(p1) * modelSize, matf_verifyPos(p2) * modelSize, matf_verifyPos(p3) * modelSize, \
                      uv, 0.0, false, true, vertexColor, color, minT); }
#define ADD_TRIANGLE(p1, p2, p3, uv) { \
    color = f_sTris(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, \
                    uv, 0.0, false, false, vertexColor, color, minT); }
#define ADD_TRIANGLE_ROT(p1, p2, p3, uv, rot) { \
    color = f_sTris(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, \
                    uv, rot, false, false, vertexColor, color, minT); }

#define APPLY_SHADOW() { color *= cem_light; }
