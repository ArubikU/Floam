#version 150
// MC 26.2+ batches all quads into a shared vertex buffer, so gl_VertexID no longer starts at 0 per
// draw (it's offset by gl_BaseVertexARB). Subtract it so the cube/face/corner index math stays valid.
#extension GL_ARB_shader_draw_parameters : enable
#ifdef GL_ARB_shader_draw_parameters
#define VERTEX_ID (gl_VertexID - gl_BaseVertexARB)
#else
#define VERTEX_ID gl_VertexID
#endif

#define VSH

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:light.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <emissive_utils.glsl>
#moj_import <mods/armor/armorparts.glsl>
#moj_import <mods/parts.glsl>
#moj_import <cem_locs.glsl>
#moj_import <mods/redefine.glsl>
#moj_import <floamy/registry/defines.glsl>

#define INV_TEX_RES_SIX (1.0 / 64)
#define INV_TEX_RES_THREE (1.0 / 32)
#define IS_LEATHER_LAYER texelFetch(Sampler0, ivec2(0.0, 0.0), 0) == vec4(1.0) // If it's leather_layer_X.png texture

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1, UV2;
uniform mat3 IViewRotMat;
in vec3 Normal;

uniform sampler2D Sampler0,Sampler1, Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor, tintColor, lightColor;
out vec2 texCoord0;
out vec4 normal;
out vec4 cem_pos1, cem_pos2, cem_pos3, cem_pos4;
out vec3 cem_glPos;
out vec3 cem_modelFrag; // fragment model-space pos (ortho parallel-ray origin for GUI)
out vec3 cem_uv1, cem_uv2;
out vec4 cem_lightMapColor;

out vec4 overlayColor;

flat out int cem;
flat out int bodypart;
flat out int cem_reverse;
flat out vec4 cem_light;
flat out ivec4 cems;
flat out float cem_size;
flat out ivec2 RelativeCords;
flat out int armorType;
flat out int isGui;
flat out int isUpperArmor;
flat out int markforremove;
flat out int isTrim;
flat out float emissive;
flat out int isLeatherLayer;
out vec4 cem_color;



#moj_import <channel.glsl>

vec4 getCemData(ivec2 cords) {
    return floor(texelFetch(Sampler0, cords, 0) * 255.0);
}


#define COLOR_ARMOR(r,g,b) return true; case ((r<<16)+(g<<8)+b):

int colorId(vec3 c) {
    ivec3 v = ivec3(c*255);
    return (v.r<<16)+(v.g<<8)+v.b;
}
vec2 cords=vec2(0,0);

// Real obtainable leather-armor colors (default un-dyed + 16 dyes). A vertex within tolerance of one
// is REAL dyed leather, not a custom armor -> skip the whole CEM path and let it render as vanilla.
bool isVanillaLeatherColor(vec3 c) {
    ivec3 v = ivec3(c * 255.0 + 0.5);
    ivec3 R[17] = ivec3[17](
        ivec3(160,101,64), ivec3(249,255,254), ivec3(249,128,29), ivec3(199,78,189),
        ivec3(58,179,218), ivec3(254,216,61), ivec3(128,199,31), ivec3(243,139,170),
        ivec3(71,79,82),   ivec3(157,157,151),ivec3(22,156,156), ivec3(137,50,184),
        ivec3(60,68,170),  ivec3(131,84,50),  ivec3(94,124,22),  ivec3(176,46,38), ivec3(29,29,33));
    for (int i = 0; i < 17; i++) {
        ivec3 d = abs(v - R[i]);
        if (d.x <= 4 && d.y <= 4 && d.z <= 4) return true;
    }
    return false;
}

bool shouldApplyArmor(){
    if (isVanillaLeatherColor(Color.rgb)) return false;   // real leather/dye -> render vanilla, no CEM
    int vertexColorId=colorId(Color.rgb);
    switch(vertexColorId){
        default:

        #moj_import <armorcords.glsl>

        return true;
    }
    return false;
}




void main() {
    cem_color = vec4(0,1,0,1);
    isTrim = 0;
    // GUI detection
    isGui = (ProjMat[2][3] == 0.0) ? 1 : 0;
    vec3 pos = Position;

    // Common calculations
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    #moj_import <fog_reader.glsl>
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
    overlayColor = texelFetch(Sampler1, UV1, 0);

#ifndef EMISSIVE
    lightColor = texelFetch(Sampler2, UV2 / 16, 0);
#endif
    texCoord0 = UV0;
    tintColor = Color;
    emissive = 0.0; // Initialize emissive to 0
    markforremove = 0;
    // Armor-specific logic
    RelativeCords = ivec2(0);
    
    if (IS_LEATHER_LAYER) {
        ivec2 atlasSize = textureSize(Sampler0, 0);
        ivec4 fgrid = ivec4(texelFetch(Sampler0, ivec2(1,0), 0) * 255.0 + 0.5);
        vec2 armorAmount = vec2(fgrid.r, fgrid.g); // tile grid from atlas, ignores data region
        // map EXACTLY 64x32 per tile using the real texture size — the data region inflates texSize.y,
        // so 1/armorAmount overshoots into adjacent tiles for the flat (real-leather) render.
        vec2 offset = vec2(64.0, 32.0) / vec2(atlasSize);

        texCoord0 *= offset;
        shouldApplyArmor();
        if (cords.x != 0 || cords.y != 0) {
            tintColor = vec4(1);
            RelativeCords = ivec2(floor(cords));
            texCoord0 += vec2(offset.x * cords.x, offset.y * cords.y);
        }
    }
    vec4 light = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, tintColor);

    
    // CEM setup
    cem_pos1 = cem_pos2 = cem_pos3 = cem_pos4 = vec4(0);
    cem_uv1 = cem_uv2 = vec3(0);
    cem = cem_reverse = 0;
    cem_light = texelFetch(Sampler2, UV2 / 16, 0);
    cem_size = 1.0;
    cems = ivec4(-1);
    bodypart = -1;

    // Final color calculations

    #ifdef NO_CARDINAL_LIGHTING
        vertexColor = Color;
    #else
        vertexColor = light;
        if(IS_LEATHER_LAYER){
            vertexColor *= ColorModulator;
        }
    #endif

    #ifdef APPLY_TEXTURE_MATRIX
        texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
    #endif

    float ch0 = getChannel(RelativeCords, ivec2(63,30), 0);
    float ch1 = getChannel(RelativeCords, ivec2(63,30), 1);
    float ch2 = getChannel(RelativeCords, ivec2(63,30), 2);
    float ch3 = getChannel(RelativeCords, ivec2(63,30), 3);

    bool isPartOne = (ch0 == 0 && ch1 == 0 && ch2 == 0 && ch3 == 255);
    bool isPartTwo = (ch0 == 255 && ch1 == 255 && ch2 == 255 && ch3 == 255);

    // ARMOR = leather layer (isPartOne/Two markers). COSMETICS = the player's OWN skin (not leather,
    // no armor marker) -> detected by player part + the per-cosmetic marker stamped into the skin.
    bool _leather = all(equal(texelFetch(Sampler0, ivec2(0,0), 0), vec4(1.0)));
    bool isPlayer = !_leather && !isPartOne && !isPartTwo;
    if (isPartOne || isPartTwo || isPlayer) {
        float RVC_0 = 0.0, RVC_1 = 0.0, RVC_2 = 0.0;   // outer scope: armor.glsl (below) references these
        if (!isPlayer) {
            RVC_0 = getChannel(RelativeCords,ivec2(63,31), 0);
            RVC_1 = getChannel(RelativeCords,ivec2(63,31), 1);
            RVC_2 = getChannel(RelativeCords,ivec2(63,31), 2);
            if(RVC_0==0 && RVC_1==0 && RVC_2==0){ return; }
        }
        vec2 texSize = textureSize(Sampler0, 0);
        vec2 uv = floor(texCoord0 * texSize);
        uv = uv-vec2(RelativeCords.x*64,RelativeCords.y*32);
        const vec2[4] corners = vec2[4](vec2(0), vec2(0, 1), vec2(1, 1), vec2(1, 0));
        vec2 corner = corners[VERTEX_ID % 4];
        int face = (VERTEX_ID / 4) % 6;
        int removeAll = 0;
        int cube = -1;

        if (isPlayer) {
            // cosmetics OFF in GUI/inventory: render the player's original skin untouched.
            if (isGui == 1) { VERTEXT_ORIGINAL(); bodypart = -1; cems = ivec4(-1); cem = 0; return; }
            // player's own skin -> cosmetics. Player part = the model cube ordinal (cem_locs: 12 parts).
            cube = (VERTEX_ID / 24) % 12;
            bodypart = cube;
            #moj_import <floamy/registry/detect.glsl>
            // RESTORE (MagicShaders pattern): a player part NOT edited by any cosmetic renders its
            // ORIGINAL cube untouched. Without this the billboard pass eats player cubes near a cosmetic.
            if (!(cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0)) {
                VERTEXT_ORIGINAL();
                bodypart = -1;
                cems = ivec4(-1);
                cem = 0;
                return;
            }
        } else {
            vec2 _uv = uv;
            bool _head = _uv.y < 16.0;
            bool _leg  = !_head && _uv.x < 16.0;
            bool _body = !_head && _uv.x >= 16.0 && _uv.x < 40.0;
            bool _arm  = !_head && _uv.x >= 40.0;
            bool _left = ((VERTEX_ID / 24) % 2) == 1;
            if (isPartOne) {
                if (_body)      cube = STASIS_CHESTPLATE;
                else if (_arm)  cube = _left ? STASIS_LEFT_ARM  : STASIS_RIGHT_ARM;
                else if (_leg)  cube = _left ? STASIS_RIGHT_BOOT : STASIS_LEFT_BOOT;
            } else {
                if (_body)      cube = STASIS_INNER_ARMOR;
                else if (_leg)  cube = _left ? STASIS_LEFT_LEG : STASIS_RIGHT_LEG;
            }
            bodypart = cube;
            #moj_import <mods/armor/armor.glsl>
            // "clean the original": for a custom armor (internal-color marker present) HIDE any cube we
            // couldn't CEM-detect, instead of leaving the flat vanilla model peeking around the 3D armor.
            if ((RVC_0 != 0.0 || RVC_1 != 0.0 || RVC_2 != 0.0)
                && !(cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0)) {
                markforremove = 1; gl_Position = vec4(0, 0, 0, 1); overlayColor = vec4(0, 0, 0, 0); return;
            }
        }

        // Only billboard + ray-march when something was actually detected. Otherwise the skin/entity
        // renders normally (critical for the player: un-cosmeticked bodies must NOT be touched).
        bool active = (cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0);
        // billboard face: armor uses TOP (its part is removed, so any face is fine); cosmetics (player skin)
        // use BOTTOM so the hidden bottom is consumed + the visible faces stay. (1.21.9+ face order.)
        int billboardFace = isGui == 1 ? NORTH_FACE : (isPlayer ? BOTTOM_FACE : TOP_FACE);
        if (active) {
            if(face == billboardFace){
                cem_reverse = 0;
                corner = corner.yx;
                cem_size = 1;
            }else{
                if(removeAll==1){
                    markforremove = 1;
                    gl_Position = vec4(0,0,0,1);
                    overlayColor = vec4(0,0,0,0);
                    return;
                }else{
                  // non-billboard face of the edited part -> keep the ORIGINAL player cube (don't drop it)
                  bodypart = -1;
                  cems = ivec4(-1);
                  if (isPlayer) VERTEXT_ORIGINAL();
                }
            }
            if (VERTEX_ID / 4 == 3)
                corner.x = 1 - corner.x;
            if (cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0 )
            {
                cem=199;
                #moj_import <cem/vert_setup.glsl>
            }
        }
    }
}
