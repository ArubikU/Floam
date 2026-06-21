#version 150

#define VSH

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:light.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <emissive_utils.glsl>
#moj_import <mods/armor/armorparts.glsl>
#moj_import <mods/parts.glsl>

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

bool shouldApplyArmor(){
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
        vec2 offset = 1.0 / armorAmount;

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

    // Only run CEM logic if not in GUI
    if (isGui == 0 && (isPartOne || isPartTwo)) {
        float RVC_0 = getChannel(RelativeCords,ivec2(63,31), 0);
        float RVC_1 = getChannel(RelativeCords,ivec2(63,31), 1);
        float RVC_2 = getChannel(RelativeCords,ivec2(63,31), 2);
        if(RVC_0==0 && RVC_1==0 && RVC_2==0){
            return;
        }
        //texture things
        vec2 texSize = textureSize(Sampler0, 0);
        vec2 uv = floor(texCoord0 * texSize);
        //make it relative
        uv = uv-vec2(RelativeCords.x*64,RelativeCords.y*32);
        // CEM logic
        const vec2[4] corners = vec2[4](vec2(0), vec2(0, 1), vec2(1, 1), vec2(1, 0));
        vec2 corner = corners[gl_VertexID % 4];

        int face = (gl_VertexID / 4) % 6;

        int removeAll = 0;


        int cube = (gl_VertexID / 24) % 10;
        bodypart = cube;
        
        #moj_import <mods/armor/setup.glsl>
        
        #moj_import <mods/armor/armor.glsl>
        
        if(face==TOP_FACE){
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
              bodypart = -1;
              cems = ivec4(-1);
            }
        }

        if (gl_VertexID / 4 == 3)
            corner.x = 1 - corner.x;

        if (cems[0] > 0 || cems[1] > 0 || cems[2] > 0 || cems[3] > 0 )
        {
            cem=199;
            #moj_import <cem/vert_setup.glsl>
        }
    }
}
