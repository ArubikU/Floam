/* Floamy3D — data-driven armor decode.
 * Reads per-box geometry from the leather atlas data region (Sampler0) instead of a giant
 * compiled switch. Byte layout MUST match ArmorDataCodec.java.
 * Requires in scope: Sampler0, relativeUv(). Decoded box is rendered by the caller.
 */

#define FD_BASE 1000
#define FD_PPB  20           // pixels per box
#define FD_RANGE 64.0

float fd_dec(int hi, int lo) { return float(hi * 256 + lo) / 65535.0 * (2.0 * FD_RANGE) - FD_RANGE; }

ivec4 fd_px(int x, int y) { return ivec4(texelFetch(Sampler0, ivec2(x, y), 0) * 255.0 + 0.5); }

// Grid (cols,rows) is stored at atlas pixel (1,0): R=cols, G=rows.
void fd_grid(out int w, out int indexY, out int dataY0) {
    ivec4 g = fd_px(1, 0);
    int cols = g.r, rows = g.g;
    w = cols * 64;
    indexY = rows * 32;
    dataY0 = indexY + 1;
}

// (firstOrdinal, count) for a cem id; count=0 if the id is not an armor part.
void fd_index(int cemi, int w, int indexY, out int start, out int count) {
    int part = cemi - FD_BASE;
    if (part < 0) { start = 0; count = 0; return; }
    ivec4 px = fd_px(part % w, indexY + part / w);
    start = px.r * 256 + px.g;
    count = (px.a < 128) ? 0 : px.b;
}

// Decode box `o` (global ordinal) into geometry. Faces returned in sBox order: u,d,n,w,s,e.
void fd_box(int o, int w, int dataY0, ivec2 cord,
            out vec3 pos, out vec3 size, out mat3 R,
            out vec4 u, out vec4 d, out vec4 n, out vec4 we, out vec4 so, out vec4 ea) {
    float D[40];
    for (int k = 0; k < FD_PPB; k++) {
        int lp = o * FD_PPB + k;
        ivec4 p = fd_px(lp % w, dataY0 + lp / w);
        D[2 * k]     = fd_dec(p.r, p.g);
        D[2 * k + 1] = fd_dec(p.b, p.a);
    }
    pos  = vec3(D[0], D[1], D[2]);
    size = vec3(D[3], D[4], D[5]);
    R = mat3(D[6], D[7], D[8], D[9], D[10], D[11], D[12], D[13], D[14]);
    u  = relativeUv(floor(D[15] + 0.5), floor(D[16] + 0.5), floor(D[17] + 0.5), floor(D[18] + 0.5), cord);
    d  = relativeUv(floor(D[19] + 0.5), floor(D[20] + 0.5), floor(D[21] + 0.5), floor(D[22] + 0.5), cord);
    n  = relativeUv(floor(D[23] + 0.5), floor(D[24] + 0.5), floor(D[25] + 0.5), floor(D[26] + 0.5), cord);
    we = relativeUv(floor(D[27] + 0.5), floor(D[28] + 0.5), floor(D[29] + 0.5), floor(D[30] + 0.5), cord);
    so = relativeUv(floor(D[31] + 0.5), floor(D[32] + 0.5), floor(D[33] + 0.5), floor(D[34] + 0.5), cord);
    ea = relativeUv(floor(D[35] + 0.5), floor(D[36] + 0.5), floor(D[37] + 0.5), floor(D[38] + 0.5), cord);
}
