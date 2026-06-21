// Floamy3D — reference dump of how each armor compiles (the box
// geometry AFTER parsers/*.jp transforms) BEFORE it is encoded into the leather
// atlas data region. Read-only; the shader actually decodes the texture, not this.

// ===== CASSUTO_ARMOR1_PACK  (internal-color 0,0,180) =====
#define CEM_CASSUTO_ARMOR1_PACK_CHESTPLATE 1000   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_CASSUTO_ARMOR1_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.0250,1.0250,3.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,21,-8,-6,RelativeCords), relativeUv(64,0,0,0,RelativeCords),
        relativeUv(41,21,8,2,RelativeCords), relativeUv(55,21,-6,2,RelativeCords),
        relativeUv(55,21,8,2,RelativeCords), relativeUv(35,21,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-10.0000), vec3(5.0250,3.0250,4.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,8,10,-8,RelativeCords), relativeUv(8,0,10,8,RelativeCords),
        relativeUv(8,8,10,6,RelativeCords), relativeUv(18,8,8,6,RelativeCords),
        relativeUv(36,8,-10,6,RelativeCords), relativeUv(0,8,8,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7071,-3.5250,-13.0000), vec3(5.5250,5.5250,0.5250), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,17,-11,-1,RelativeCords), relativeUv(13,17,-11,-1,RelativeCords),
        relativeUv(37,9,11,11,RelativeCords), relativeUv(14,17,-1,11,RelativeCords),
        vec4(0), relativeUv(1,17,1,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_LEFT_FEET 1001   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR1_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_RIGHT_FEET 1002   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR1_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_LEFT_ARM 1003   // -> bone STASIS_LEFT_ARM, 6 box(es)
case CEM_CASSUTO_ARMOR1_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.5000), vec3(2.0250,6.5250,2.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(31,15,-4,4,RelativeCords), relativeUv(27,15,-4,4,RelativeCords),
        relativeUv(23,19,4,13,RelativeCords), relativeUv(19,19,4,13,RelativeCords),
        relativeUv(35,19,-4,13,RelativeCords), relativeUv(27,19,4,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-13.5000), vec3(3.0250,2.0250,1.5250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,0,-6,3,RelativeCords), relativeUv(46,0,-6,3,RelativeCords),
        relativeUv(40,3,6,4,RelativeCords), relativeUv(37,3,3,4,RelativeCords),
        relativeUv(55,3,-6,4,RelativeCords), relativeUv(46,3,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5000,0.0000,-3.5000), vec3(0.5250,0.5250,1.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,1,-1,2,RelativeCords), relativeUv(61,1,-1,2,RelativeCords),
        relativeUv(60,3,1,1,RelativeCords), relativeUv(58,3,2,1,RelativeCords),
        relativeUv(64,3,-1,1,RelativeCords), relativeUv(61,3,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8071,0.0000,-6.6000), vec3(2.0250,2.0250,2.5250), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(58,23,-4,5,RelativeCords), relativeUv(54,23,-4,5,RelativeCords),
        relativeUv(50,28,4,4,RelativeCords), relativeUv(45,28,5,4,RelativeCords),
        relativeUv(63,28,-4,4,RelativeCords), relativeUv(54,28,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8464,-0.0000,-15.1464), vec3(2.0000,1.5000,1.5000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(61,7,-4,3,RelativeCords), relativeUv(57,7,-4,3,RelativeCords),
        relativeUv(53,10,4,3,RelativeCords), relativeUv(50,10,3,3,RelativeCords),
        relativeUv(64,10,-4,3,RelativeCords), relativeUv(57,10,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.6749,0.0000,-14.4393), vec3(0.5000,2.0000,0.5000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(6,2,-1,1,RelativeCords), relativeUv(5,2,-1,1,RelativeCords),
        relativeUv(4,3,1,4,RelativeCords), relativeUv(3,3,1,4,RelativeCords),
        relativeUv(7,3,-1,4,RelativeCords), relativeUv(5,3,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_RIGHT_ARM 1004   // -> bone STASIS_RIGHT_ARM, 6 box(es)
case CEM_CASSUTO_ARMOR1_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.5000), vec3(2.0250,6.5250,2.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(31,15,-4,4,RelativeCords), relativeUv(27,15,-4,4,RelativeCords),
        relativeUv(23,19,4,13,RelativeCords), relativeUv(19,19,4,13,RelativeCords),
        relativeUv(35,19,-4,13,RelativeCords), relativeUv(27,19,4,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5000,0.0000,-3.5000), vec3(0.5250,0.5250,1.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,1,-1,2,RelativeCords), relativeUv(61,1,-1,2,RelativeCords),
        relativeUv(60,3,1,1,RelativeCords), relativeUv(58,3,2,1,RelativeCords),
        relativeUv(64,3,-1,1,RelativeCords), relativeUv(61,3,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,-0.0000,-13.5000), vec3(3.0250,2.0250,1.5250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,0,-6,3,RelativeCords), relativeUv(46,0,-6,3,RelativeCords),
        relativeUv(40,3,6,4,RelativeCords), relativeUv(37,3,3,4,RelativeCords),
        relativeUv(55,3,-6,4,RelativeCords), relativeUv(46,3,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8071,0.0000,-6.6000), vec3(2.0250,2.0250,2.5250), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,23,-4,5,RelativeCords), relativeUv(54,23,-4,5,RelativeCords),
        relativeUv(50,28,4,4,RelativeCords), relativeUv(45,28,5,4,RelativeCords),
        relativeUv(63,28,-4,4,RelativeCords), relativeUv(54,28,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8464,-0.0000,-15.1464), vec3(2.0000,1.5000,1.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(61,7,-4,3,RelativeCords), relativeUv(57,7,-4,3,RelativeCords),
        relativeUv(53,10,4,3,RelativeCords), relativeUv(50,10,3,3,RelativeCords),
        relativeUv(64,10,-4,3,RelativeCords), relativeUv(57,10,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.6749,-0.0000,-14.4393), vec3(0.5000,2.0000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,2,-1,1,RelativeCords), relativeUv(5,2,-1,1,RelativeCords),
        relativeUv(4,3,1,4,RelativeCords), relativeUv(3,3,1,4,RelativeCords),
        relativeUv(7,3,-1,4,RelativeCords), relativeUv(5,3,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_INNER_ARMOR 1005   // -> bone STASIS_INNER_ARMOR, 1 box(es)
case CEM_CASSUTO_ARMOR1_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_LEFT_LEG 1006   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR1_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2481,0.0000,-8.7284), vec3(1.5250,3.5250,3.0250), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,3,6,RelativeCords), relativeUv(9,0,3,6,RelativeCords),
        relativeUv(6,6,3,7,RelativeCords), relativeUv(0,6,6,7,RelativeCords),
        relativeUv(18,6,-3,7,RelativeCords), relativeUv(9,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR1_PACK_RIGHT_LEG 1007   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR1_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2481,0.0000,-8.7284), vec3(1.5250,3.5250,3.0250), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,3,6,RelativeCords), relativeUv(9,0,3,6,RelativeCords),
        relativeUv(6,6,3,7,RelativeCords), relativeUv(0,6,6,7,RelativeCords),
        relativeUv(18,6,-3,7,RelativeCords), relativeUv(9,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CASSUTO_ARMOR2_PACK  (internal-color 0,0,181) =====
#define CEM_CASSUTO_ARMOR2_PACK_CHESTPLATE 1008   // -> bone STASIS_CHESTPLATE, 2 box(es)
case CEM_CASSUTO_ARMOR2_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-3.0000), vec3(4.0000,3.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(12,4,8,-4,RelativeCords), relativeUv(4,0,8,4,RelativeCords),
        relativeUv(4,4,8,6,RelativeCords), relativeUv(12,4,4,6,RelativeCords),
        relativeUv(24,4,-8,6,RelativeCords), relativeUv(0,4,4,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-9.0000), vec3(4.5000,3.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(49,6,9,-6,RelativeCords), relativeUv(40,0,9,6,RelativeCords),
        relativeUv(40,6,9,6,RelativeCords), relativeUv(49,6,6,6,RelativeCords),
        relativeUv(64,6,-9,6,RelativeCords), relativeUv(34,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_LEFT_FEET 1009   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR2_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(2.7500,3.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,23,4,4,RelativeCords), relativeUv(8,23,4,4,RelativeCords),
        relativeUv(4,27,4,5,RelativeCords), relativeUv(0,27,4,5,RelativeCords),
        relativeUv(16,27,-4,5,RelativeCords), relativeUv(8,27,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_RIGHT_FEET 1010   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR2_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(2.7500,3.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,23,4,4,RelativeCords), relativeUv(8,23,4,4,RelativeCords),
        relativeUv(4,27,4,5,RelativeCords), relativeUv(0,27,4,5,RelativeCords),
        relativeUv(16,27,-4,5,RelativeCords), relativeUv(8,27,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_LEFT_ARM 1011   // -> bone STASIS_LEFT_ARM, 9 box(es)
case CEM_CASSUTO_ARMOR2_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6913,0.0000,-9.5381), vec3(1.0000,1.5000,1.5000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(7,10,-2,3,RelativeCords), relativeUv(5,10,-2,3,RelativeCords),
        relativeUv(3,13,2,3,RelativeCords), relativeUv(0,13,3,3,RelativeCords),
        relativeUv(10,13,-2,3,RelativeCords), relativeUv(5,13,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8913,0.0000,-5.0381), vec3(1.5000,2.0000,2.5000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(59,23,-3,5,RelativeCords), relativeUv(56,23,-3,5,RelativeCords),
        relativeUv(53,28,3,4,RelativeCords), relativeUv(48,28,5,4,RelativeCords),
        relativeUv(64,28,-3,4,RelativeCords), relativeUv(56,28,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-5.5000), vec3(2.0000,3.5000,2.0000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(60,12,-4,4,RelativeCords), relativeUv(56,12,-4,4,RelativeCords),
        relativeUv(52,16,4,7,RelativeCords), relativeUv(48,16,4,7,RelativeCords),
        relativeUv(64,16,-4,7,RelativeCords), relativeUv(56,16,4,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-11.5000), vec3(2.5000,2.5000,2.5000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(34,7,-5,5,RelativeCords), relativeUv(29,7,-5,5,RelativeCords),
        relativeUv(24,12,5,5,RelativeCords), relativeUv(19,12,5,5,RelativeCords),
        relativeUv(39,12,-5,5,RelativeCords), relativeUv(29,12,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-6.5355,0.0000,-16.8284), vec3(0.5000,0.5000,2.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(30,18,-1,4,RelativeCords), relativeUv(29,18,-1,4,RelativeCords),
        relativeUv(28,22,1,1,RelativeCords), relativeUv(24,22,4,1,RelativeCords),
        relativeUv(34,22,-1,1,RelativeCords), relativeUv(29,22,4,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1213,0.0000,-16.8284), vec3(1.5000,0.5000,2.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(36,0,-3,4,RelativeCords), relativeUv(33,0,-3,4,RelativeCords),
        relativeUv(30,4,3,1,RelativeCords), relativeUv(26,4,4,1,RelativeCords),
        relativeUv(40,4,-3,1,RelativeCords), relativeUv(33,4,4,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2213,2.4000,-13.2929), vec3(1.0000,1.0000,0.5000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(63,3,-2,1,RelativeCords), relativeUv(61,3,-2,1,RelativeCords),
        relativeUv(59,4,2,2,RelativeCords), relativeUv(58,4,1,2,RelativeCords),
        relativeUv(64,4,-2,2,RelativeCords), relativeUv(61,4,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-14.0000), vec3(2.0000,3.0000,3.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(42,17,-4,6,RelativeCords), relativeUv(38,17,-4,6,RelativeCords),
        relativeUv(34,23,4,6,RelativeCords), relativeUv(28,23,6,6,RelativeCords),
        relativeUv(48,23,-4,6,RelativeCords), relativeUv(38,23,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5858,0.0000,-10.4645), vec3(1.5000,0.5000,2.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(36,0,-3,4,RelativeCords), relativeUv(33,0,-3,4,RelativeCords),
        relativeUv(30,4,3,1,RelativeCords), relativeUv(26,4,4,1,RelativeCords),
        relativeUv(40,4,-3,1,RelativeCords), relativeUv(33,4,4,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_RIGHT_ARM 1012   // -> bone STASIS_RIGHT_ARM, 10 box(es)
case CEM_CASSUTO_ARMOR2_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-5.5000), vec3(2.0000,3.5000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,12,-4,4,RelativeCords), relativeUv(56,12,-4,4,RelativeCords),
        relativeUv(52,16,4,7,RelativeCords), relativeUv(48,16,4,7,RelativeCords),
        relativeUv(64,16,-4,7,RelativeCords), relativeUv(56,16,4,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,-0.0000,-11.5000), vec3(2.5000,2.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(34,7,-5,5,RelativeCords), relativeUv(29,7,-5,5,RelativeCords),
        relativeUv(24,12,5,5,RelativeCords), relativeUv(19,12,5,5,RelativeCords),
        relativeUv(39,12,-5,5,RelativeCords), relativeUv(29,12,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8913,0.0000,-5.0381), vec3(1.5000,2.0000,2.5000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(59,23,-3,5,RelativeCords), relativeUv(56,23,-3,5,RelativeCords),
        relativeUv(53,28,3,4,RelativeCords), relativeUv(48,28,5,4,RelativeCords),
        relativeUv(64,28,-3,4,RelativeCords), relativeUv(56,28,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6913,-0.0000,-9.5381), vec3(1.0000,1.5000,1.5000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,10,-2,3,RelativeCords), relativeUv(5,10,-2,3,RelativeCords),
        relativeUv(3,13,2,3,RelativeCords), relativeUv(0,13,3,3,RelativeCords),
        relativeUv(10,13,-2,3,RelativeCords), relativeUv(5,13,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5858,-0.0000,-10.4645), vec3(1.5000,0.5000,2.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,0,-3,4,RelativeCords), relativeUv(33,0,-3,4,RelativeCords),
        relativeUv(30,4,3,1,RelativeCords), relativeUv(26,4,4,1,RelativeCords),
        relativeUv(40,4,-3,1,RelativeCords), relativeUv(33,4,4,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2929,-0.0000,-13.2929), vec3(2.0000,2.0000,3.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,11,-4,6,RelativeCords), relativeUv(16,11,-4,6,RelativeCords),
        relativeUv(12,17,4,4,RelativeCords), relativeUv(6,17,6,4,RelativeCords),
        relativeUv(26,17,-4,4,RelativeCords), relativeUv(16,17,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2213,-2.4000,-13.2929), vec3(1.0000,1.0000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(63,3,-2,1,RelativeCords), relativeUv(61,3,-2,1,RelativeCords),
        relativeUv(59,4,2,2,RelativeCords), relativeUv(58,4,1,2,RelativeCords),
        relativeUv(64,4,-2,2,RelativeCords), relativeUv(61,4,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1213,-0.0000,-14.7071), vec3(2.0000,1.0000,2.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,26,-4,4,RelativeCords), relativeUv(24,26,-4,4,RelativeCords),
        relativeUv(20,30,4,2,RelativeCords), relativeUv(16,30,4,2,RelativeCords),
        relativeUv(32,30,-4,2,RelativeCords), relativeUv(24,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2213,-2.4000,-15.3929), vec3(1.0000,1.0000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(63,3,-2,1,RelativeCords), relativeUv(61,3,-2,1,RelativeCords),
        relativeUv(59,4,2,2,RelativeCords), relativeUv(58,4,1,2,RelativeCords),
        relativeUv(64,4,-2,2,RelativeCords), relativeUv(61,4,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2213,2.4000,-13.2929), vec3(1.0000,1.0000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(63,3,-2,1,RelativeCords), relativeUv(61,3,-2,1,RelativeCords),
        relativeUv(59,4,2,2,RelativeCords), relativeUv(58,4,1,2,RelativeCords),
        relativeUv(64,4,-2,2,RelativeCords), relativeUv(61,4,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_INNER_ARMOR 1013   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_CASSUTO_ARMOR2_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.0000,6.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-2.5000,-1.0000), vec3(2.0000,2.0000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,0,4,1,RelativeCords), relativeUv(28,0,4,1,RelativeCords),
        relativeUv(24,1,4,4,RelativeCords), relativeUv(23,1,1,4,RelativeCords),
        relativeUv(33,1,-4,4,RelativeCords), relativeUv(28,1,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_LEFT_LEG 1014   // -> bone STASIS_LEFT_LEG, 5 box(es)
case CEM_CASSUTO_ARMOR2_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.0000,6.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5000,2.5000,-8.5000), vec3(1.4750,3.4750,0.4750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,0,3,1,RelativeCords), relativeUv(4,0,3,1,RelativeCords),
        relativeUv(1,1,3,7,RelativeCords), relativeUv(0,1,1,7,RelativeCords),
        relativeUv(8,1,-3,7,RelativeCords), relativeUv(4,1,1,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.2990,0.0000,-4.5573), vec3(0.5000,1.0000,2.0000), mat3(0.70711,0.00000,0.70711,-0.70711,0.00000,0.70711,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,26,1,4,RelativeCords), relativeUv(59,26,1,4,RelativeCords),
        relativeUv(58,30,1,2,RelativeCords), relativeUv(54,30,4,2,RelativeCords),
        relativeUv(64,30,-1,2,RelativeCords), relativeUv(59,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.3519,0.0000,-8.7284), vec3(1.5250,3.5250,3.0250), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,0,3,6,RelativeCords), relativeUv(55,0,3,6,RelativeCords),
        relativeUv(52,6,3,7,RelativeCords), relativeUv(46,6,6,7,RelativeCords),
        relativeUv(64,6,-3,7,RelativeCords), relativeUv(55,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-4.5000), vec3(2.0000,1.5000,2.5000), mat3(0.70711,-0.00000,-0.70711,0.70711,0.00000,0.70711,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(33,0,4,5,RelativeCords), relativeUv(37,0,4,5,RelativeCords),
        relativeUv(33,5,4,3,RelativeCords), relativeUv(28,5,5,3,RelativeCords),
        relativeUv(46,5,-4,3,RelativeCords), relativeUv(37,5,5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR2_PACK_RIGHT_LEG 1015   // -> bone STASIS_RIGHT_LEG, 5 box(es)
case CEM_CASSUTO_ARMOR2_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.0000,6.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5000,-2.5000,-8.5000), vec3(1.4750,3.4750,0.4750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,0,3,1,RelativeCords), relativeUv(4,0,3,1,RelativeCords),
        relativeUv(1,1,3,7,RelativeCords), relativeUv(0,1,1,7,RelativeCords),
        relativeUv(8,1,-3,7,RelativeCords), relativeUv(4,1,1,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.3519,0.0000,-8.7284), vec3(1.5250,3.5250,3.0250), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,0,3,6,RelativeCords), relativeUv(55,0,3,6,RelativeCords),
        relativeUv(52,6,3,7,RelativeCords), relativeUv(46,6,6,7,RelativeCords),
        relativeUv(64,6,-3,7,RelativeCords), relativeUv(55,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-4.5000), vec3(2.0000,1.5000,2.5000), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(33,0,4,5,RelativeCords), relativeUv(37,0,4,5,RelativeCords),
        relativeUv(33,5,4,3,RelativeCords), relativeUv(28,5,5,3,RelativeCords),
        relativeUv(46,5,-4,3,RelativeCords), relativeUv(37,5,5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.2990,0.0000,-4.5573), vec3(0.5000,1.0000,2.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,26,1,4,RelativeCords), relativeUv(59,26,1,4,RelativeCords),
        relativeUv(58,30,1,2,RelativeCords), relativeUv(54,30,4,2,RelativeCords),
        relativeUv(64,30,-1,2,RelativeCords), relativeUv(59,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CASSUTO_ARMOR3_PACK  (internal-color 0,0,182) =====
#define CEM_CASSUTO_ARMOR3_PACK_CHESTPLATE 1016   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_CASSUTO_ARMOR3_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2000,-9.8000), vec3(5.0000,3.0000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,1,10,-1,RelativeCords), relativeUv(1,0,10,1,RelativeCords),
        relativeUv(1,1,10,6,RelativeCords), relativeUv(11,1,1,6,RelativeCords),
        relativeUv(22,1,-10,6,RelativeCords), relativeUv(0,1,1,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7000,-3.5000,-2.7929), vec3(1.5000,1.5000,1.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,10,3,-2,RelativeCords), relativeUv(15,8,3,2,RelativeCords),
        relativeUv(15,10,3,3,RelativeCords), relativeUv(18,10,2,3,RelativeCords),
        relativeUv(23,10,-3,3,RelativeCords), relativeUv(13,10,2,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_LEFT_FEET 1017   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR3_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_RIGHT_FEET 1018   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR3_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_LEFT_ARM 1019   // -> bone STASIS_LEFT_ARM, 10 box(es)
case CEM_CASSUTO_ARMOR3_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,0.0000,-4.5000), vec3(2.0000,2.5000,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(38,1,-4,7,RelativeCords), relativeUv(34,1,-4,7,RelativeCords),
        relativeUv(30,8,4,5,RelativeCords), relativeUv(23,8,7,5,RelativeCords),
        relativeUv(45,8,-4,5,RelativeCords), relativeUv(34,8,7,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.7000,-0.0000,-18.0000), vec3(0.5000,3.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,0,-1,2,RelativeCords), relativeUv(27,0,-1,2,RelativeCords),
        relativeUv(26,2,1,6,RelativeCords), relativeUv(24,2,2,6,RelativeCords),
        relativeUv(30,2,-1,6,RelativeCords), relativeUv(27,2,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7000,-0.0000,-17.5000), vec3(0.5000,2.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,18,-1,2,RelativeCords), relativeUv(61,18,-1,2,RelativeCords),
        relativeUv(60,20,1,5,RelativeCords), relativeUv(58,20,2,5,RelativeCords),
        relativeUv(64,20,-1,5,RelativeCords), relativeUv(61,20,2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1273,-0.0000,-22.2564), vec3(0.5000,2.0000,1.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(62,26,-1,2,RelativeCords), relativeUv(61,26,-1,2,RelativeCords),
        relativeUv(60,28,1,4,RelativeCords), relativeUv(58,28,2,4,RelativeCords),
        relativeUv(64,28,-1,4,RelativeCords), relativeUv(61,28,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0178,-0.0000,-17.6143), vec3(1.4750,0.9750,0.9750), mat3(-0.00000,0.70711,0.70711,0.00000,-0.70711,0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(62,14,-3,2,RelativeCords), relativeUv(59,14,-3,2,RelativeCords),
        relativeUv(56,16,3,2,RelativeCords), relativeUv(54,16,2,2,RelativeCords),
        relativeUv(64,16,-3,2,RelativeCords), relativeUv(59,16,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.7040,0.0000,-7.6680), vec3(0.5000,1.0000,1.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(62,0,-1,2,RelativeCords), relativeUv(61,0,-1,2,RelativeCords),
        relativeUv(60,2,1,2,RelativeCords), relativeUv(58,2,2,2,RelativeCords),
        relativeUv(64,2,-1,2,RelativeCords), relativeUv(61,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6434,0.0000,-8.0216), vec3(0.5000,1.5000,2.0000), mat3(0.00000,-0.70711,0.70711,0.00000,-0.70711,-0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(6,7,-1,4,RelativeCords), relativeUv(5,7,-1,4,RelativeCords),
        relativeUv(4,11,1,3,RelativeCords), relativeUv(0,11,4,3,RelativeCords),
        relativeUv(10,11,-1,3,RelativeCords), relativeUv(5,11,4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.8775,-0.0000,-16.9249), vec3(0.5000,1.0000,3.0000), mat3(0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(12,8,-1,6,RelativeCords), relativeUv(11,8,-1,6,RelativeCords),
        relativeUv(10,14,1,2,RelativeCords), relativeUv(4,14,6,2,RelativeCords),
        relativeUv(18,14,-1,2,RelativeCords), relativeUv(11,14,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6173,0.0000,-12.5761), vec3(2.0000,3.5000,3.0000), mat3(0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(58,0,-4,6,RelativeCords), relativeUv(54,0,-4,6,RelativeCords),
        relativeUv(50,6,4,7,RelativeCords), relativeUv(44,6,6,7,RelativeCords),
        relativeUv(64,6,-4,7,RelativeCords), relativeUv(54,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_RIGHT_ARM 1020   // -> bone STASIS_RIGHT_ARM, 10 box(es)
case CEM_CASSUTO_ARMOR3_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,0.0000,-4.5000), vec3(2.0000,2.5000,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(38,1,-4,7,RelativeCords), relativeUv(34,1,-4,7,RelativeCords),
        relativeUv(30,8,4,5,RelativeCords), relativeUv(23,8,7,5,RelativeCords),
        relativeUv(45,8,-4,5,RelativeCords), relativeUv(34,8,7,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.7000,-0.0000,-18.0000), vec3(0.5000,3.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,0,-1,2,RelativeCords), relativeUv(27,0,-1,2,RelativeCords),
        relativeUv(26,2,1,6,RelativeCords), relativeUv(24,2,2,6,RelativeCords),
        relativeUv(30,2,-1,6,RelativeCords), relativeUv(27,2,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7000,-0.0000,-17.5000), vec3(0.5000,2.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,18,-1,2,RelativeCords), relativeUv(61,18,-1,2,RelativeCords),
        relativeUv(60,20,1,5,RelativeCords), relativeUv(58,20,2,5,RelativeCords),
        relativeUv(64,20,-1,5,RelativeCords), relativeUv(61,20,2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6173,-0.0000,-12.5761), vec3(2.0000,3.5000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,0,-4,6,RelativeCords), relativeUv(54,0,-4,6,RelativeCords),
        relativeUv(50,6,4,7,RelativeCords), relativeUv(44,6,6,7,RelativeCords),
        relativeUv(64,6,-4,7,RelativeCords), relativeUv(54,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.8775,-0.0000,-16.9249), vec3(0.5000,1.0000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(12,8,-1,6,RelativeCords), relativeUv(11,8,-1,6,RelativeCords),
        relativeUv(10,14,1,2,RelativeCords), relativeUv(4,14,6,2,RelativeCords),
        relativeUv(18,14,-1,2,RelativeCords), relativeUv(11,14,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.7040,0.0000,-7.6680), vec3(0.5000,1.0000,1.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,0,-1,2,RelativeCords), relativeUv(61,0,-1,2,RelativeCords),
        relativeUv(60,2,1,2,RelativeCords), relativeUv(58,2,2,2,RelativeCords),
        relativeUv(64,2,-1,2,RelativeCords), relativeUv(61,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6434,0.0000,-8.0216), vec3(0.5000,1.5000,2.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,7,-1,4,RelativeCords), relativeUv(5,7,-1,4,RelativeCords),
        relativeUv(4,11,1,3,RelativeCords), relativeUv(0,11,4,3,RelativeCords),
        relativeUv(10,11,-1,3,RelativeCords), relativeUv(5,11,4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0178,-0.0000,-17.6143), vec3(1.4750,0.9750,0.9750), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,14,-3,2,RelativeCords), relativeUv(59,14,-3,2,RelativeCords),
        relativeUv(56,16,3,2,RelativeCords), relativeUv(54,16,2,2,RelativeCords),
        relativeUv(64,16,-3,2,RelativeCords), relativeUv(59,16,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1273,-0.0000,-22.2564), vec3(0.5000,2.0000,1.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,26,-1,2,RelativeCords), relativeUv(61,26,-1,2,RelativeCords),
        relativeUv(60,28,1,4,RelativeCords), relativeUv(58,28,2,4,RelativeCords),
        relativeUv(64,28,-1,4,RelativeCords), relativeUv(61,28,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_INNER_ARMOR 1021   // -> bone STASIS_INNER_ARMOR, 1 box(es)
case CEM_CASSUTO_ARMOR3_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_LEFT_LEG 1022   // -> bone STASIS_LEFT_LEG, 6 box(es)
case CEM_CASSUTO_ARMOR3_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8221,-5.0000,-11.8425), vec3(0.0000,5.5000,2.0000), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,17,0,4,RelativeCords), relativeUv(60,21,0,-4,RelativeCords),
        relativeUv(64,21,0,11,RelativeCords), relativeUv(64,21,-4,11,RelativeCords),
        relativeUv(60,21,0,11,RelativeCords), relativeUv(56,21,4,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.6221,-0.0000,-11.8425), vec3(2.0000,5.5000,4.0000), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,0,4,8,RelativeCords), relativeUv(52,0,4,8,RelativeCords),
        relativeUv(48,8,4,11,RelativeCords), relativeUv(40,8,8,11,RelativeCords),
        relativeUv(64,8,-4,11,RelativeCords), relativeUv(52,8,8,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8221,5.0000,-11.8425), vec3(0.0000,5.5000,2.0000), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,21,0,-4,RelativeCords), relativeUv(60,17,0,4,RelativeCords),
        relativeUv(60,21,0,11,RelativeCords), relativeUv(60,21,4,11,RelativeCords),
        relativeUv(64,21,0,11,RelativeCords), relativeUv(60,21,-4,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-6.3127,0.0000,-7.3352), vec3(0.4750,2.4750,2.4750), mat3(0.92388,0.00000,0.38268,-0.27060,-0.70711,0.65328,0.27060,-0.70711,-0.65328), vec3(0,0,0),
        relativeUv(33,0,1,5,RelativeCords), relativeUv(34,0,1,5,RelativeCords),
        relativeUv(33,5,1,5,RelativeCords), relativeUv(28,5,5,5,RelativeCords),
        relativeUv(40,5,-1,5,RelativeCords), relativeUv(34,5,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.6074,0.0000,-4.8342), vec3(1.0000,2.5000,3.0000), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,2,6,RelativeCords), relativeUv(8,0,2,6,RelativeCords),
        relativeUv(6,6,2,5,RelativeCords), relativeUv(0,6,6,5,RelativeCords),
        relativeUv(16,6,-2,5,RelativeCords), relativeUv(8,6,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR3_PACK_RIGHT_LEG 1023   // -> bone STASIS_RIGHT_LEG, 6 box(es)
case CEM_CASSUTO_ARMOR3_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.6074,0.0000,-4.8342), vec3(1.0000,2.5000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,2,6,RelativeCords), relativeUv(8,0,2,6,RelativeCords),
        relativeUv(6,6,2,5,RelativeCords), relativeUv(0,6,6,5,RelativeCords),
        relativeUv(16,6,-2,5,RelativeCords), relativeUv(8,6,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-6.3127,-0.0000,-7.3352), vec3(0.4750,2.4750,2.4750), mat3(0.92388,-0.00000,0.38268,0.27060,0.70711,-0.65328,-0.27060,0.70711,0.65328), vec3(0,0,0),
        relativeUv(33,0,1,5,RelativeCords), relativeUv(34,0,1,5,RelativeCords),
        relativeUv(33,5,1,5,RelativeCords), relativeUv(28,5,5,5,RelativeCords),
        relativeUv(40,5,-1,5,RelativeCords), relativeUv(34,5,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.6221,0.0000,-11.8425), vec3(2.0000,5.5000,4.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,0,4,8,RelativeCords), relativeUv(52,0,4,8,RelativeCords),
        relativeUv(48,8,4,11,RelativeCords), relativeUv(40,8,8,11,RelativeCords),
        relativeUv(64,8,-4,11,RelativeCords), relativeUv(52,8,8,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8221,5.0000,-11.8425), vec3(0.0000,5.5000,2.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,17,0,4,RelativeCords), relativeUv(60,21,0,-4,RelativeCords),
        relativeUv(64,21,0,11,RelativeCords), relativeUv(56,21,4,11,RelativeCords),
        relativeUv(60,21,0,11,RelativeCords), relativeUv(64,21,-4,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8221,-5.0000,-11.8425), vec3(0.0000,5.5000,2.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,21,0,-4,RelativeCords), relativeUv(60,17,0,4,RelativeCords),
        relativeUv(60,21,0,11,RelativeCords), relativeUv(60,21,-4,11,RelativeCords),
        relativeUv(64,21,0,11,RelativeCords), relativeUv(60,21,4,11,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CASSUTO_ARMOR4_PACK  (internal-color 0,0,183) =====
#define CEM_CASSUTO_ARMOR4_PACK_CHESTPLATE 1024   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_CASSUTO_ARMOR4_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2000,-10.3000), vec3(5.0000,2.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(53,11,10,-1,RelativeCords), relativeUv(43,10,10,1,RelativeCords),
        relativeUv(43,11,10,5,RelativeCords), relativeUv(53,11,1,5,RelativeCords),
        relativeUv(64,11,-10,5,RelativeCords), relativeUv(42,11,1,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1907,-2.6381,-8.2849), vec3(2.0000,2.0000,1.5000), mat3(0.70711,0.27060,0.65328,0.59537,0.27060,-0.75651,-0.38149,0.92388,0.03024), vec3(0,0,0),
        relativeUv(41,11,-4,-1,RelativeCords), relativeUv(37,11,-4,-1,RelativeCords),
        relativeUv(33,11,4,4,RelativeCords), relativeUv(38,11,-1,4,RelativeCords),
        relativeUv(38,11,4,4,RelativeCords), relativeUv(32,11,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_LEFT_FEET 1025   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR4_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_RIGHT_FEET 1026   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR4_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_LEFT_ARM 1027   // -> bone STASIS_LEFT_ARM, 3 box(es)
case CEM_CASSUTO_ARMOR4_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-5.5000), vec3(1.7750,2.2750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,-2,4,RelativeCords), relativeUv(58,0,-2,4,RelativeCords),
        relativeUv(56,4,2,3,RelativeCords), relativeUv(52,4,4,3,RelativeCords),
        relativeUv(64,4,-2,3,RelativeCords), relativeUv(58,4,4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7000,0.0000,-6.6000), vec3(1.5000,2.0000,1.5000), mat3(-0.00000,0.70711,0.70711,0.00000,-0.70711,0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(29,1,-3,3,RelativeCords), relativeUv(26,1,-3,3,RelativeCords),
        relativeUv(23,4,3,4,RelativeCords), relativeUv(20,4,3,4,RelativeCords),
        relativeUv(32,4,-3,4,RelativeCords), relativeUv(26,4,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_RIGHT_ARM 1028   // -> bone STASIS_RIGHT_ARM, 5 box(es)
case CEM_CASSUTO_ARMOR4_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,-0.0000,-12.5000), vec3(3.2500,3.2500,3.2500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(47,0,-5,5,RelativeCords), relativeUv(42,0,-5,5,RelativeCords),
        relativeUv(37,5,5,5,RelativeCords), relativeUv(32,5,5,5,RelativeCords),
        relativeUv(52,5,-5,5,RelativeCords), relativeUv(42,5,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-5.5000), vec3(1.7750,2.2750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,-2,4,RelativeCords), relativeUv(58,0,-2,4,RelativeCords),
        relativeUv(56,4,2,3,RelativeCords), relativeUv(52,4,4,3,RelativeCords),
        relativeUv(64,4,-2,3,RelativeCords), relativeUv(58,4,4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0000,-0.0000,-14.3000), vec3(1.7500,2.2500,1.7500), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,-2,2,RelativeCords), relativeUv(4,0,-2,2,RelativeCords),
        relativeUv(2,2,2,3,RelativeCords), relativeUv(0,2,2,3,RelativeCords),
        relativeUv(8,2,-2,3,RelativeCords), relativeUv(4,2,2,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7000,0.0000,-6.6000), vec3(1.5000,2.0000,1.5000), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(29,1,-3,3,RelativeCords), relativeUv(26,1,-3,3,RelativeCords),
        relativeUv(23,4,3,4,RelativeCords), relativeUv(20,4,3,4,RelativeCords),
        relativeUv(32,4,-3,4,RelativeCords), relativeUv(26,4,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_INNER_ARMOR 1029   // -> bone STASIS_INNER_ARMOR, 1 box(es)
case CEM_CASSUTO_ARMOR4_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_LEFT_LEG 1030   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR4_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.4693,0.0000,-9.3045), vec3(1.7500,3.7500,3.7500), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,2,6,RelativeCords), relativeUv(56,0,2,6,RelativeCords),
        relativeUv(54,6,2,6,RelativeCords), relativeUv(48,6,6,6,RelativeCords),
        relativeUv(64,6,-2,6,RelativeCords), relativeUv(56,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR4_PACK_RIGHT_LEG 1031   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR4_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.4693,0.0000,-9.3045), vec3(1.7500,3.7500,3.7500), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,2,6,RelativeCords), relativeUv(56,0,2,6,RelativeCords),
        relativeUv(54,6,2,6,RelativeCords), relativeUv(48,6,6,6,RelativeCords),
        relativeUv(64,6,-2,6,RelativeCords), relativeUv(56,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CASSUTO_ARMOR5_PACK  (internal-color 0,0,184) =====
#define CEM_CASSUTO_ARMOR5_PACK_CHESTPLATE 1032   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_CASSUTO_ARMOR5_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.7500,-10.2000), vec3(5.0000,2.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,2,10,-2,RelativeCords), relativeUv(42,0,10,2,RelativeCords),
        relativeUv(42,2,10,5,RelativeCords), relativeUv(52,2,2,5,RelativeCords),
        relativeUv(64,2,-10,5,RelativeCords), relativeUv(40,2,2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-5.2500,-9.9000), vec3(2.0000,2.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(34,11,4,-1,RelativeCords), relativeUv(30,10,4,1,RelativeCords),
        relativeUv(30,11,4,5,RelativeCords), relativeUv(34,11,1,5,RelativeCords),
        relativeUv(39,11,-4,5,RelativeCords), relativeUv(29,11,1,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_LEFT_FEET 1033   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR5_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_RIGHT_FEET 1034   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_CASSUTO_ARMOR5_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_LEFT_ARM 1035   // -> bone STASIS_LEFT_ARM, 6 box(es)
case CEM_CASSUTO_ARMOR5_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6000,0.0000,-2.5000), vec3(1.0000,1.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,7,-2,2,RelativeCords), relativeUv(46,7,-2,2,RelativeCords),
        relativeUv(44,9,2,2,RelativeCords), relativeUv(42,9,2,2,RelativeCords),
        relativeUv(50,9,-2,2,RelativeCords), relativeUv(46,9,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6000,0.0000,-11.5000), vec3(1.0000,0.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,8,-2,2,RelativeCords), relativeUv(60,8,-2,2,RelativeCords),
        relativeUv(58,10,2,1,RelativeCords), relativeUv(56,10,2,1,RelativeCords),
        relativeUv(64,10,-2,1,RelativeCords), relativeUv(60,10,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.8071,-0.0000,-15.4071), vec3(0.7000,1.2000,2.7000), mat3(-0.00000,0.70711,0.70711,0.00000,-0.70711,0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(32,0,-1,5,RelativeCords), relativeUv(31,0,-1,5,RelativeCords),
        relativeUv(30,5,1,2,RelativeCords), relativeUv(25,5,5,2,RelativeCords),
        relativeUv(37,5,-1,2,RelativeCords), relativeUv(31,5,5,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4480,-0.0000,-16.6698), vec3(0.5000,1.0000,1.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(54,7,-1,2,RelativeCords), relativeUv(53,7,-1,2,RelativeCords),
        relativeUv(52,9,1,2,RelativeCords), relativeUv(50,9,2,2,RelativeCords),
        relativeUv(56,9,-1,2,RelativeCords), relativeUv(53,9,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7501,0.0000,-13.7712), vec3(1.0000,2.5000,2.0000), mat3(0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(60,11,-2,4,RelativeCords), relativeUv(58,11,-2,4,RelativeCords),
        relativeUv(56,15,2,5,RelativeCords), relativeUv(52,15,4,5,RelativeCords),
        relativeUv(64,15,-2,5,RelativeCords), relativeUv(58,15,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_RIGHT_ARM 1036   // -> bone STASIS_RIGHT_ARM, 6 box(es)
case CEM_CASSUTO_ARMOR5_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6000,-0.0000,-11.5000), vec3(1.0000,0.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,8,-2,2,RelativeCords), relativeUv(60,8,-2,2,RelativeCords),
        relativeUv(58,10,2,1,RelativeCords), relativeUv(56,10,2,1,RelativeCords),
        relativeUv(64,10,-2,1,RelativeCords), relativeUv(60,10,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6000,0.0000,-2.5000), vec3(1.0000,1.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,7,-2,2,RelativeCords), relativeUv(46,7,-2,2,RelativeCords),
        relativeUv(44,9,2,2,RelativeCords), relativeUv(42,9,2,2,RelativeCords),
        relativeUv(50,9,-2,2,RelativeCords), relativeUv(46,9,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.8071,-0.0000,-15.4071), vec3(0.7000,1.2000,2.7000), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(32,0,-1,5,RelativeCords), relativeUv(31,0,-1,5,RelativeCords),
        relativeUv(30,5,1,2,RelativeCords), relativeUv(25,5,5,2,RelativeCords),
        relativeUv(37,5,-1,2,RelativeCords), relativeUv(31,5,5,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4480,-0.0000,-16.6698), vec3(0.5000,1.0000,1.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,7,-1,2,RelativeCords), relativeUv(53,7,-1,2,RelativeCords),
        relativeUv(52,9,1,2,RelativeCords), relativeUv(50,9,2,2,RelativeCords),
        relativeUv(56,9,-1,2,RelativeCords), relativeUv(53,9,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7501,-0.0000,-13.7712), vec3(1.0000,2.5000,2.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,11,-2,4,RelativeCords), relativeUv(58,11,-2,4,RelativeCords),
        relativeUv(56,15,2,5,RelativeCords), relativeUv(52,15,4,5,RelativeCords),
        relativeUv(64,15,-2,5,RelativeCords), relativeUv(58,15,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_INNER_ARMOR 1037   // -> bone STASIS_INNER_ARMOR, 4 box(es)
case CEM_CASSUTO_ARMOR5_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.3000,-1.5000), vec3(1.5000,1.5000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,0,3,1,RelativeCords), relativeUv(60,0,3,1,RelativeCords),
        relativeUv(57,1,3,3,RelativeCords), relativeUv(56,1,1,3,RelativeCords),
        relativeUv(64,1,-3,3,RelativeCords), relativeUv(60,1,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.5000,-2.5000,-1.0000), vec3(1.0000,2.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,0,2,1,RelativeCords), relativeUv(3,0,2,1,RelativeCords),
        relativeUv(1,1,2,4,RelativeCords), relativeUv(0,1,1,4,RelativeCords),
        relativeUv(6,1,-2,4,RelativeCords), relativeUv(3,1,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.5000,-2.5000,-1.0000), vec3(1.0000,2.0000,0.5000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,0,2,1,RelativeCords), relativeUv(3,0,2,1,RelativeCords),
        relativeUv(1,1,2,4,RelativeCords), relativeUv(0,1,1,4,RelativeCords),
        relativeUv(6,1,-2,4,RelativeCords), relativeUv(3,1,1,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_LEFT_LEG 1038   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR5_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5307,0.0000,-8.8045), vec3(1.3000,4.3000,2.8000), mat3(0.92388,0.00000,0.38268,-0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,1,4,RelativeCords), relativeUv(55,0,1,4,RelativeCords),
        relativeUv(54,4,1,7,RelativeCords), relativeUv(50,4,4,7,RelativeCords),
        relativeUv(60,4,-1,7,RelativeCords), relativeUv(55,4,4,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR5_PACK_RIGHT_LEG 1039   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_CASSUTO_ARMOR5_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5372,0.0000,-8.8072), vec3(1.3000,4.3000,2.8000), mat3(0.92321,-0.00000,0.38430,0.38430,0.00000,-0.92321,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,1,4,RelativeCords), relativeUv(55,0,1,4,RelativeCords),
        relativeUv(54,4,1,7,RelativeCords), relativeUv(50,4,4,7,RelativeCords),
        relativeUv(60,4,-1,7,RelativeCords), relativeUv(55,4,4,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CASSUTO_ARMOR6_PACK  (internal-color 0,0,185) =====
#define CEM_CASSUTO_ARMOR6_PACK_CHESTPLATE 1040   // -> bone STASIS_CHESTPLATE, 2 box(es)
case CEM_CASSUTO_ARMOR6_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2000,-9.4000), vec3(2.5000,2.5000,0.5000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,1,5,-1,RelativeCords), relativeUv(53,0,5,1,RelativeCords),
        relativeUv(53,1,5,5,RelativeCords), relativeUv(58,1,1,5,RelativeCords),
        relativeUv(64,1,-5,5,RelativeCords), relativeUv(52,1,1,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_LEFT_FEET 1041   // -> bone STASIS_LEFT_BOOT, 2 box(es)
case CEM_CASSUTO_ARMOR6_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1000,0.0000,-4.0000), vec3(3.0000,4.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(30,0,6,7,RelativeCords), relativeUv(30,0,6,7,RelativeCords),
        relativeUv(30,0,6,6,RelativeCords), relativeUv(36,0,-6,7,RelativeCords),
        relativeUv(36,0,-6,6,RelativeCords), relativeUv(30,0,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_RIGHT_FEET 1042   // -> bone STASIS_RIGHT_BOOT, 2 box(es)
case CEM_CASSUTO_ARMOR6_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1000,0.0000,-4.0000), vec3(3.0000,4.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,0,-6,7,RelativeCords), relativeUv(36,0,-6,7,RelativeCords),
        relativeUv(36,0,-6,6,RelativeCords), relativeUv(30,0,6,7,RelativeCords),
        relativeUv(30,0,6,6,RelativeCords), relativeUv(36,0,-6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_LEFT_ARM 1043   // -> bone STASIS_LEFT_ARM, 4 box(es)
case CEM_CASSUTO_ARMOR6_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-6.0000,0.0000,-8.0000), vec3(3.0000,6.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(64,20,-6,0,RelativeCords), relativeUv(58,20,-6,0,RelativeCords),
        relativeUv(58,20,6,12,RelativeCords), relativeUv(58,20,-0,12,RelativeCords),
        relativeUv(64,20,-6,12,RelativeCords), relativeUv(64,0,0,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4000,0.0000,-13.0000), vec3(3.2750,2.7750,3.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,1,-5,5,RelativeCords), relativeUv(47,1,-5,5,RelativeCords),
        relativeUv(42,6,5,4,RelativeCords), relativeUv(37,6,5,4,RelativeCords),
        relativeUv(57,6,-5,4,RelativeCords), relativeUv(47,6,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.1197,3.3000,-13.1764), vec3(3.5000,4.0000,0.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(64,12,-7,0,RelativeCords), relativeUv(57,12,-7,0,RelativeCords),
        relativeUv(64,12,-7,8,RelativeCords), relativeUv(57,12,-0,8,RelativeCords),
        relativeUv(64,0,0,0,RelativeCords), relativeUv(50,12,0,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_RIGHT_ARM 1044   // -> bone STASIS_RIGHT_ARM, 4 box(es)
case CEM_CASSUTO_ARMOR6_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4000,-0.0000,-13.0000), vec3(3.2750,2.7750,3.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,1,-5,5,RelativeCords), relativeUv(47,1,-5,5,RelativeCords),
        relativeUv(42,6,5,4,RelativeCords), relativeUv(37,6,5,4,RelativeCords),
        relativeUv(57,6,-5,4,RelativeCords), relativeUv(47,6,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-6.0000,-0.0000,-8.0000), vec3(3.0000,6.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,20,6,0,RelativeCords), relativeUv(52,20,6,0,RelativeCords),
        relativeUv(64,20,-6,12,RelativeCords), relativeUv(64,0,-0,0,RelativeCords),
        relativeUv(58,20,6,12,RelativeCords), relativeUv(58,20,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1852,-3.3000,-12.2744), vec3(3.5000,4.0000,0.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,12,7,0,RelativeCords), relativeUv(50,12,7,0,RelativeCords),
        relativeUv(57,12,7,8,RelativeCords), relativeUv(50,12,-0,8,RelativeCords),
        relativeUv(64,0,0,0,RelativeCords), relativeUv(57,12,0,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_INNER_ARMOR 1045   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_CASSUTO_ARMOR6_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1239,0.0000,0.1173), vec3(6.0000,1.5000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(34,0,12,6,RelativeCords), relativeUv(46,0,12,6,RelativeCords),
        relativeUv(34,6,12,3,RelativeCords), relativeUv(28,6,6,3,RelativeCords),
        relativeUv(64,6,-12,3,RelativeCords), relativeUv(46,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_LEFT_LEG 1046   // -> bone STASIS_LEFT_LEG, 1 box(es)
case CEM_CASSUTO_ARMOR6_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CASSUTO_ARMOR6_PACK_RIGHT_LEG 1047   // -> bone STASIS_RIGHT_LEG, 1 box(es)
case CEM_CASSUTO_ARMOR6_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ARUBIK_COWBOY_PACK  (internal-color 61,0,0) =====
#define CEM_ARUBIK_COWBOY_PACK_CHESTPLATE 1048   // -> bone STASIS_CHESTPLATE, 4 box(es)
case CEM_ARUBIK_COWBOY_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.0000,-5.7500), vec3(5.0000,7.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,0,-8,-0,RelativeCords), relativeUv(28,0,-8,0,RelativeCords),
        relativeUv(20,0,8,13,RelativeCords), relativeUv(28,0,-0,13,RelativeCords),
        relativeUv(12,0,8,13,RelativeCords), relativeUv(20,0,0,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(8.1274,-1.4317,-6.0000), vec3(1.0000,6.0000,0.0000), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(31,20,-2,-0,RelativeCords), relativeUv(29,20,-2,0,RelativeCords),
        relativeUv(27,20,2,12,RelativeCords), relativeUv(29,20,-0,12,RelativeCords),
        relativeUv(44,0,2,12,RelativeCords), relativeUv(27,20,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-7.8360,-4.8304,-6.0000), vec3(1.0000,6.0000,0.0000), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(23,20,-2,-0,RelativeCords), relativeUv(21,20,-2,0,RelativeCords),
        relativeUv(19,20,2,12,RelativeCords), relativeUv(21,20,-0,12,RelativeCords),
        relativeUv(44,0,2,12,RelativeCords), relativeUv(19,20,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_LEFT_FEET 1049   // -> bone STASIS_LEFT_BOOT, 2 box(es)
case CEM_ARUBIK_COWBOY_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.2000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_RIGHT_FEET 1050   // -> bone STASIS_RIGHT_BOOT, 2 box(es)
case CEM_ARUBIK_COWBOY_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_LEFT_ARM 1051   // -> bone STASIS_LEFT_ARM, 2 box(es)
case CEM_ARUBIK_COWBOY_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,-5,5,RelativeCords), relativeUv(37,0,-5,5,RelativeCords),
        relativeUv(33,5,5,13,RelativeCords), relativeUv(28,5,5,13,RelativeCords),
        relativeUv(46,5,-5,13,RelativeCords), relativeUv(37,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_RIGHT_ARM 1052   // -> bone STASIS_RIGHT_ARM, 2 box(es)
case CEM_ARUBIK_COWBOY_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,-5,5,RelativeCords), relativeUv(37,0,-5,5,RelativeCords),
        relativeUv(33,5,5,13,RelativeCords), relativeUv(28,5,5,13,RelativeCords),
        relativeUv(46,5,-5,13,RelativeCords), relativeUv(37,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_INNER_ARMOR 1053   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_ARUBIK_COWBOY_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.5000), vec3(4.7500,6.5000,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_LEFT_LEG 1054   // -> bone STASIS_LEFT_LEG, 4 box(es)
case CEM_ARUBIK_COWBOY_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0596,-7.5889,-6.2625), vec3(0.0000,6.2625,2.3750), mat3(0.92388,0.38268,-0.00000,0.00000,0.00000,1.00000,0.38268,-0.92388,0.00000), vec3(0,0,0),
        relativeUv(43,-4,0,5,RelativeCords), relativeUv(43,-4,0,5,RelativeCords),
        relativeUv(43,1,0,13,RelativeCords), relativeUv(38,1,5,13,RelativeCords),
        relativeUv(48,1,-0,13,RelativeCords), relativeUv(43,1,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.4974,-4.2214,-6.2625), vec3(0.0000,6.2625,2.3750), mat3(0.92388,0.38268,-0.00000,0.00000,0.00000,1.00000,0.38268,-0.92388,0.00000), vec3(0,0,0),
        relativeUv(43,-4,0,5,RelativeCords), relativeUv(43,-4,0,5,RelativeCords),
        relativeUv(43,1,0,13,RelativeCords), relativeUv(38,1,5,13,RelativeCords),
        relativeUv(48,1,-0,13,RelativeCords), relativeUv(43,1,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.1250,-6.3750), vec3(3.0000,6.8750,2.8750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(51,0,5,5,RelativeCords), relativeUv(56,0,5,5,RelativeCords),
        relativeUv(51,5,5,13,RelativeCords), relativeUv(46,5,5,13,RelativeCords),
        relativeUv(66,5,-5,13,RelativeCords), relativeUv(56,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ARUBIK_COWBOY_PACK_RIGHT_LEG 1055   // -> bone STASIS_RIGHT_LEG, 4 box(es)
case CEM_ARUBIK_COWBOY_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.2000,-0.1250,-6.3750), vec3(3.0000,6.8750,2.8750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(51,0,5,5,RelativeCords), relativeUv(56,0,5,5,RelativeCords),
        relativeUv(51,5,5,13,RelativeCords), relativeUv(46,5,5,13,RelativeCords),
        relativeUv(66,5,-5,13,RelativeCords), relativeUv(56,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.7795,1.7128,-6.2625), vec3(0.0000,6.2625,2.3750), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(42,0,0,-4,RelativeCords), relativeUv(42,-4,0,4,RelativeCords),
        relativeUv(42,0,0,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords),
        relativeUv(46,0,0,12,RelativeCords), relativeUv(46,0,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.3748,4.9880,-6.2625), vec3(0.0000,6.2625,2.3750), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(42,0,0,-4,RelativeCords), relativeUv(42,-4,0,4,RelativeCords),
        relativeUv(42,0,0,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords),
        relativeUv(46,0,0,12,RelativeCords), relativeUv(46,0,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ZEKERN_BOAR_HIDE  (internal-color 71,0,0) =====
#define CEM_ZEKERN_BOAR_HIDE_CHESTPLATE 1056   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_ZEKERN_BOAR_HIDE_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.6000,-3.4000,-8.1000), vec3(1.5000,2.5000,0.0000), mat3(0.75683,-0.02060,0.65328,0.54973,-0.52060,-0.65328,0.35355,0.85355,-0.38268), vec3(0,0,0),
        relativeUv(3,3,3,-0,RelativeCords), relativeUv(0,3,3,0,RelativeCords),
        relativeUv(0,3,3,5,RelativeCords), relativeUv(3,3,0,5,RelativeCords),
        relativeUv(6,3,-3,5,RelativeCords), relativeUv(0,3,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6000,-3.4000,-8.1000), vec3(1.5000,2.5000,0.0000), mat3(0.75683,0.02060,-0.65328,-0.54973,-0.52060,-0.65328,-0.35355,0.85355,-0.38268), vec3(0,0,0),
        relativeUv(3,3,3,-0,RelativeCords), relativeUv(0,3,3,0,RelativeCords),
        relativeUv(0,3,3,5,RelativeCords), relativeUv(3,3,0,5,RelativeCords),
        relativeUv(6,3,-3,5,RelativeCords), relativeUv(0,3,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_LEFT_FEET 1057   // -> bone STASIS_LEFT_BOOT, 2 box(es)
case CEM_ZEKERN_BOAR_HIDE_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0393,-3.8107,-1.8500), vec3(0.0000,1.5000,1.5000), mat3(0.70711,0.70711,-0.00000,0.00000,0.00000,1.00000,0.70711,-0.70711,0.00000), vec3(0,0,0),
        relativeUv(17,-3,0,3,RelativeCords), relativeUv(17,-3,0,3,RelativeCords),
        relativeUv(17,0,0,3,RelativeCords), relativeUv(14,0,3,3,RelativeCords),
        relativeUv(20,0,-0,3,RelativeCords), relativeUv(17,0,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_RIGHT_FEET 1058   // -> bone STASIS_RIGHT_BOOT, 2 box(es)
case CEM_ZEKERN_BOAR_HIDE_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0393,3.8107,-1.8500), vec3(0.0000,1.5000,1.5000), mat3(0.70711,0.70711,0.00000,0.00000,0.00000,-1.00000,-0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(17,-3,0,3,RelativeCords), relativeUv(17,-3,0,3,RelativeCords),
        relativeUv(17,0,0,3,RelativeCords), relativeUv(14,0,3,3,RelativeCords),
        relativeUv(20,0,-0,3,RelativeCords), relativeUv(17,0,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_LEFT_ARM 1059   // -> bone STASIS_LEFT_ARM, 6 box(es)
case CEM_ZEKERN_BOAR_HIDE_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0879,-2.1000,-5.2879), vec3(1.5000,2.5000,0.0000), mat3(0.35355,0.38268,0.85355,-0.14645,-0.87859,0.45457,0.92388,-0.28571,-0.25459), vec3(0,0,0),
        relativeUv(19,5,-3,0,RelativeCords), relativeUv(16,5,-3,0,RelativeCords),
        relativeUv(13,5,3,5,RelativeCords), relativeUv(13,5,0,5,RelativeCords),
        relativeUv(19,5,-3,5,RelativeCords), relativeUv(16,5,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0879,2.1000,-5.2879), vec3(1.5000,2.5000,0.0000), mat3(-0.35355,0.38268,0.85355,0.14645,-0.87859,0.45457,0.92388,0.28571,0.25459), vec3(0,0,0),
        relativeUv(19,5,-3,0,RelativeCords), relativeUv(16,5,-3,0,RelativeCords),
        relativeUv(13,5,3,5,RelativeCords), relativeUv(13,5,0,5,RelativeCords),
        relativeUv(19,5,-3,5,RelativeCords), relativeUv(16,5,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,0.0000,-13.8000), vec3(2.5000,1.5000,3.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(58,0,-5,6,RelativeCords), relativeUv(53,0,-5,6,RelativeCords),
        relativeUv(48,6,5,3,RelativeCords), relativeUv(42,6,6,3,RelativeCords),
        relativeUv(64,6,-5,3,RelativeCords), relativeUv(53,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2230,2.8821,-11.0572), vec3(2.5000,1.5000,0.0000), mat3(-0.14645,0.02691,0.98885,-0.35355,-0.93503,-0.02691,0.92388,-0.35355,0.14645), vec3(0,0,0),
        relativeUv(48,0,-5,0,RelativeCords), relativeUv(43,0,-5,0,RelativeCords),
        relativeUv(38,0,5,3,RelativeCords), relativeUv(38,0,0,3,RelativeCords),
        relativeUv(48,0,-5,3,RelativeCords), relativeUv(43,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2230,-2.8821,-11.0572), vec3(2.5000,1.5000,0.0000), mat3(0.14645,0.02691,0.98885,0.35355,-0.93503,-0.02691,0.92388,0.35355,-0.14645), vec3(0,0,0),
        relativeUv(48,0,-5,0,RelativeCords), relativeUv(43,0,-5,0,RelativeCords),
        relativeUv(38,0,5,3,RelativeCords), relativeUv(38,0,0,3,RelativeCords),
        relativeUv(48,0,-5,3,RelativeCords), relativeUv(43,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_RIGHT_ARM 1060   // -> bone STASIS_RIGHT_ARM, 6 box(es)
case CEM_ZEKERN_BOAR_HIDE_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,-0.0000,-13.8000), vec3(2.5000,1.5000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,0,-5,6,RelativeCords), relativeUv(53,0,-5,6,RelativeCords),
        relativeUv(48,6,5,3,RelativeCords), relativeUv(42,6,6,3,RelativeCords),
        relativeUv(64,6,-5,3,RelativeCords), relativeUv(53,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2230,-2.8821,-11.0572), vec3(2.5000,1.5000,0.0000), mat3(0.98885,0.14645,-0.02691,0.02691,-0.35355,-0.93503,-0.14645,0.92388,-0.35355), vec3(0,0,0),
        relativeUv(48,0,-5,0,RelativeCords), relativeUv(43,0,-5,0,RelativeCords),
        relativeUv(38,0,5,3,RelativeCords), relativeUv(38,0,0,3,RelativeCords),
        relativeUv(48,0,-5,3,RelativeCords), relativeUv(43,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2230,2.8821,-11.0572), vec3(2.5000,1.5000,0.0000), mat3(0.98885,-0.14645,-0.02691,0.02691,0.35355,-0.93503,0.14645,0.92388,0.35355), vec3(0,0,0),
        relativeUv(48,0,-5,0,RelativeCords), relativeUv(43,0,-5,0,RelativeCords),
        relativeUv(38,0,5,3,RelativeCords), relativeUv(38,0,0,3,RelativeCords),
        relativeUv(48,0,-5,3,RelativeCords), relativeUv(43,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0879,-2.1000,-5.2879), vec3(1.5000,2.5000,0.0000), mat3(0.85355,0.35355,-0.38268,-0.45457,0.14645,-0.87859,-0.25459,0.92388,0.28571), vec3(0,0,0),
        relativeUv(19,5,-3,0,RelativeCords), relativeUv(16,5,-3,0,RelativeCords),
        relativeUv(13,5,3,5,RelativeCords), relativeUv(13,5,0,5,RelativeCords),
        relativeUv(19,5,-3,5,RelativeCords), relativeUv(16,5,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.0879,2.1000,-5.2879), vec3(1.5000,2.5000,0.0000), mat3(0.85355,-0.35355,-0.38268,-0.45457,-0.14645,-0.87859,0.25459,0.92388,-0.28571), vec3(0,0,0),
        relativeUv(19,5,-3,0,RelativeCords), relativeUv(16,5,-3,0,RelativeCords),
        relativeUv(13,5,3,5,RelativeCords), relativeUv(13,5,0,5,RelativeCords),
        relativeUv(19,5,-3,5,RelativeCords), relativeUv(16,5,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_INNER_ARMOR 1061   // -> bone STASIS_INNER_ARMOR, 4 box(es)
case CEM_ZEKERN_BOAR_HIDE_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5250,6.5250,2.5250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.8973,-4.1515,-1.4642), vec3(2.5000,1.5000,0.0000), mat3(0.92388,-0.00000,0.38268,0.35355,0.38268,-0.85355,-0.14645,0.92388,0.35355), vec3(0,0,0),
        relativeUv(37,3,5,0,RelativeCords), relativeUv(42,3,5,0,RelativeCords),
        relativeUv(37,3,5,3,RelativeCords), relativeUv(37,3,0,3,RelativeCords),
        relativeUv(47,3,-5,3,RelativeCords), relativeUv(42,3,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.8973,-4.1515,-1.4642), vec3(2.5000,1.5000,0.0000), mat3(0.92388,0.00000,-0.38268,-0.35355,0.38268,-0.85355,0.14645,0.92388,0.35355), vec3(0,0,0),
        relativeUv(37,3,5,0,RelativeCords), relativeUv(42,3,5,0,RelativeCords),
        relativeUv(37,3,5,3,RelativeCords), relativeUv(37,3,0,3,RelativeCords),
        relativeUv(47,3,-5,3,RelativeCords), relativeUv(42,3,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.3000,-2.0000), vec3(1.5000,1.0000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(1,0,3,1,RelativeCords), relativeUv(4,0,3,1,RelativeCords),
        relativeUv(1,1,3,2,RelativeCords), relativeUv(0,1,1,2,RelativeCords),
        relativeUv(8,1,-3,2,RelativeCords), relativeUv(4,1,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_LEFT_LEG 1062   // -> bone STASIS_LEFT_LEG, 3 box(es)
case CEM_ZEKERN_BOAR_HIDE_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.8000,0.0000,-7.6000), vec3(0.8000,1.3000,2.8000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,3,1,5,RelativeCords), relativeUv(6,3,1,5,RelativeCords),
        relativeUv(5,8,1,2,RelativeCords), relativeUv(0,8,5,2,RelativeCords),
        relativeUv(12,8,-1,2,RelativeCords), relativeUv(6,8,5,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5607,3.0607,-11.4000), vec3(1.5000,2.0000,0.0000), mat3(0.70711,-0.70711,0.00000,0.00000,0.00000,1.00000,-0.70711,-0.70711,0.00000), vec3(0,0,0),
        relativeUv(8,0,3,0,RelativeCords), relativeUv(11,0,3,0,RelativeCords),
        relativeUv(8,0,3,4,RelativeCords), relativeUv(8,0,0,4,RelativeCords),
        relativeUv(14,0,-3,4,RelativeCords), relativeUv(11,0,0,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_BOAR_HIDE_RIGHT_LEG 1063   // -> bone STASIS_RIGHT_LEG, 3 box(es)
case CEM_ZEKERN_BOAR_HIDE_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.8000,0.0000,-7.6000), vec3(0.8000,1.3000,2.8000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,3,1,5,RelativeCords), relativeUv(6,3,1,5,RelativeCords),
        relativeUv(5,8,1,2,RelativeCords), relativeUv(0,8,5,2,RelativeCords),
        relativeUv(12,8,-1,2,RelativeCords), relativeUv(6,8,5,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5607,-3.0607,-11.4000), vec3(1.5000,2.0000,0.0000), mat3(0.70711,-0.70711,-0.00000,0.00000,0.00000,-1.00000,0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(8,0,3,0,RelativeCords), relativeUv(11,0,3,0,RelativeCords),
        relativeUv(8,0,3,4,RelativeCords), relativeUv(8,0,0,4,RelativeCords),
        relativeUv(14,0,-3,4,RelativeCords), relativeUv(11,0,0,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ZEKERN_CHAINMAIL_SP  (internal-color 72,0,0) =====
#define CEM_ZEKERN_CHAINMAIL_SP_CHESTPLATE 1064   // -> bone STASIS_CHESTPLATE, 1 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_LEFT_FEET 1065   // -> bone STASIS_LEFT_BOOT, 3 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-5.5000), vec3(3.0000,0.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,6,6,RelativeCords), relativeUv(12,0,6,6,RelativeCords),
        relativeUv(6,6,6,1,RelativeCords), relativeUv(0,6,6,1,RelativeCords),
        relativeUv(24,6,-6,1,RelativeCords), relativeUv(12,6,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,1.8478,-4.7654), vec3(3.0000,1.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268), vec3(0,0,0),
        relativeUv(33,0,6,4,RelativeCords), relativeUv(39,0,6,4,RelativeCords),
        relativeUv(33,4,6,2,RelativeCords), relativeUv(29,4,4,2,RelativeCords),
        relativeUv(49,4,-6,2,RelativeCords), relativeUv(39,4,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_RIGHT_FEET 1066   // -> bone STASIS_RIGHT_BOOT, 4 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-5.5000), vec3(3.0000,0.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,6,6,RelativeCords), relativeUv(12,0,6,6,RelativeCords),
        relativeUv(6,6,6,1,RelativeCords), relativeUv(0,6,6,1,RelativeCords),
        relativeUv(24,6,-6,1,RelativeCords), relativeUv(12,6,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-1.8478,-4.7654), vec3(3.0000,1.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(33,0,6,4,RelativeCords), relativeUv(39,0,6,4,RelativeCords),
        relativeUv(33,4,6,2,RelativeCords), relativeUv(29,4,4,2,RelativeCords),
        relativeUv(49,4,-6,2,RelativeCords), relativeUv(39,4,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.1000,-4.2000), vec3(1.0000,1.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.70711,-0.70711,0.00000,0.70711,0.70711), vec3(0,0,0),
        relativeUv(21,0,2,2,RelativeCords), relativeUv(23,0,2,2,RelativeCords),
        relativeUv(21,2,2,2,RelativeCords), relativeUv(19,2,2,2,RelativeCords),
        relativeUv(27,2,-2,2,RelativeCords), relativeUv(23,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_LEFT_ARM 1067   // -> bone STASIS_LEFT_ARM, 1 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_RIGHT_ARM 1068   // -> bone STASIS_RIGHT_ARM, 1 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_INNER_ARMOR 1069   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(4.9000,0.9000,2.9000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,10,6,RelativeCords), relativeUv(16,0,10,6,RelativeCords),
        relativeUv(6,6,10,2,RelativeCords), relativeUv(0,6,6,2,RelativeCords),
        relativeUv(32,6,-10,2,RelativeCords), relativeUv(16,6,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_LEFT_LEG 1070   // -> bone STASIS_LEFT_LEG, 1 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_CHAINMAIL_SP_RIGHT_LEG 1071   // -> bone STASIS_RIGHT_LEG, 1 box(es)
case CEM_ZEKERN_CHAINMAIL_SP_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== TUGKAN_FALLEN_CHAMPION  (internal-color 180,0,0) =====
#define CEM_TUGKAN_FALLEN_CHAMPION_CHESTPLATE 1072   // -> bone STASIS_CHESTPLATE, 9 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-4.0000), vec3(4.0500,2.5500,2.5500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,2,1,-1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        relativeUv(40,10,8,5,RelativeCords), relativeUv(40,10,-5,5,RelativeCords),
        relativeUv(23,10,8,5,RelativeCords), relativeUv(59,17,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-9.5000), vec3(5.2500,3.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(39,10,10,-5,RelativeCords), relativeUv(39,0,10,5,RelativeCords),
        relativeUv(54,6,10,6,RelativeCords), relativeUv(54,6,-5,6,RelativeCords),
        relativeUv(54,0,10,6,RelativeCords), relativeUv(49,0,5,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(5.3750,-0.7010,-11.8505), vec3(2.0000,0.5000,4.0000), mat3(0.86603,-0.00000,0.50000,0.43301,0.50000,-0.75000,-0.25000,0.86603,0.43301), vec3(0,0,0),
        relativeUv(0,16,4,-8,RelativeCords), relativeUv(11,0,4,8,RelativeCords),
        relativeUv(0,3,4,1,RelativeCords), relativeUv(31,8,-8,1,RelativeCords),
        relativeUv(0,4,4,1,RelativeCords), relativeUv(23,9,8,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(5.6250,0.1651,-11.4175), vec3(-0.5000,-1.0000,-1.5000), mat3(0.86603,-0.00000,0.50000,0.43301,0.50000,-0.75000,-0.25000,0.86603,0.43301), vec3(0,0,0),
        relativeUv(5,2,-1,-1,RelativeCords), relativeUv(5,1,-1,1,RelativeCords),
        relativeUv(5,1,-1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,0,-1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.3750,-0.7010,-11.8505), vec3(2.0000,0.5000,4.0000), mat3(0.86603,0.00000,-0.50000,-0.43301,0.50000,-0.75000,0.25000,0.86603,0.43301), vec3(0,0,0),
        relativeUv(4,16,-4,-8,RelativeCords), relativeUv(15,0,-4,8,RelativeCords),
        relativeUv(4,3,-4,1,RelativeCords), relativeUv(23,9,8,1,RelativeCords),
        relativeUv(4,4,-4,1,RelativeCords), relativeUv(31,8,-8,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.6250,0.1651,-11.4175), vec3(-0.5000,-1.0000,-1.5000), mat3(0.86603,0.00000,-0.50000,-0.43301,0.50000,-0.75000,0.25000,0.86603,0.43301), vec3(0,0,0),
        relativeUv(4,2,1,-1,RelativeCords), relativeUv(4,1,1,1,RelativeCords),
        relativeUv(4,1,1,1,RelativeCords), relativeUv(1,1,-1,-1,RelativeCords),
        relativeUv(0,0,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7071,-3.0000,-10.5000), vec3(1.5000,1.5000,1.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,5,3,-2,RelativeCords), relativeUv(4,3,3,2,RelativeCords),
        relativeUv(4,5,3,3,RelativeCords), relativeUv(2,5,-2,3,RelativeCords),
        relativeUv(7,5,3,3,RelativeCords), relativeUv(2,5,2,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.1625,-3.2185,-8.2181), vec3(3.0000,2.5000,0.5000), mat3(0.90984,0.17365,-0.37687,-0.39521,0.08583,-0.91457,-0.12647,0.98106,0.14672), vec3(0,0,0),
        relativeUv(17,2,6,-1,RelativeCords), relativeUv(17,0,6,1,RelativeCords),
        relativeUv(17,7,6,5,RelativeCords), relativeUv(17,7,-1,5,RelativeCords),
        relativeUv(17,2,6,5,RelativeCords), relativeUv(15,7,1,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.1625,-3.2185,-8.2181), vec3(3.0000,2.5000,0.5000), mat3(0.90984,-0.17365,0.37687,0.39521,0.08583,-0.91457,0.12647,0.98106,0.14672), vec3(0,0,0),
        relativeUv(23,2,-6,-1,RelativeCords), relativeUv(23,0,-6,1,RelativeCords),
        relativeUv(23,7,-6,5,RelativeCords), relativeUv(15,7,1,5,RelativeCords),
        relativeUv(23,2,-6,5,RelativeCords), relativeUv(17,7,-1,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_LEFT_ARM 1073   // -> bone STASIS_LEFT_ARM, 2 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-10.0000), vec3(2.0000,4.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(39,8,-4,4,RelativeCords), relativeUv(35,8,-4,4,RelativeCords),
        relativeUv(23,0,4,8,RelativeCords), relativeUv(31,0,-4,8,RelativeCords),
        relativeUv(31,0,4,8,RelativeCords), relativeUv(35,0,4,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2500,0.0000,-12.5000), vec3(1.2500,2.7500,2.2500), mat3(0.00000,-0.86603,0.50000,0.00000,-0.50000,-0.86603,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(12,9,-2,4,RelativeCords), relativeUv(10,9,-2,4,RelativeCords),
        relativeUv(5,9,2,5,RelativeCords), relativeUv(64,12,-4,5,RelativeCords),
        relativeUv(15,0,2,5,RelativeCords), relativeUv(56,12,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_ARM 1074   // -> bone STASIS_RIGHT_ARM, 2 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-10.0000), vec3(2.0000,4.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(35,8,4,4,RelativeCords), relativeUv(31,8,4,4,RelativeCords),
        relativeUv(27,0,-4,8,RelativeCords), relativeUv(35,0,4,8,RelativeCords),
        relativeUv(35,0,-4,8,RelativeCords), relativeUv(31,0,-4,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2500,-0.0000,-12.5000), vec3(1.2500,2.7500,2.2500), mat3(0.50000,-0.00000,0.86603,0.86603,0.00000,-0.50000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(10,9,2,4,RelativeCords), relativeUv(8,9,2,4,RelativeCords),
        relativeUv(7,9,-2,5,RelativeCords), relativeUv(56,12,4,5,RelativeCords),
        relativeUv(17,0,-2,5,RelativeCords), relativeUv(64,12,-4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_LEFT_FEET 1075   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(2.3000,2.8000,2.3000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,27,4,5,RelativeCords), relativeUv(4,27,-4,5,RelativeCords),
        relativeUv(12,27,4,5,RelativeCords), relativeUv(8,27,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_FEET 1076   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(2.3000,2.8000,2.3000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(8,27,-4,5,RelativeCords), relativeUv(8,27,4,5,RelativeCords),
        relativeUv(16,27,-4,5,RelativeCords), relativeUv(4,27,-4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_INNER_ARMOR 1077   // -> bone STASIS_INNER_ARMOR, 5 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-0.8500), vec3(4.3000,1.1500,2.8000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,8,8,5,RelativeCords), relativeUv(48,8,8,5,RelativeCords),
        relativeUv(56,13,8,2,RelativeCords), relativeUv(48,10,-5,2,RelativeCords),
        relativeUv(48,13,8,2,RelativeCords), relativeUv(43,8,5,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7500,0.1250,-1.0000), vec3(0.0000,1.2500,3.1250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(2,0,-2,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.7500,0.0000,-1.0000), vec3(0.0000,1.2500,3.2500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(2,1,-1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2500,-1.0000), vec3(4.7500,1.2500,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(0,0,2,1,RelativeCords), relativeUv(2,1,-1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,3.2000,-1.0000), vec3(4.7500,1.2500,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(2,1,-1,1,RelativeCords),
        relativeUv(0,0,2,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_LEFT_LEG 1078   // -> bone STASIS_LEFT_LEG, 4 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-8.0000), vec3(2.2750,4.2750,2.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(44,0,4,4,RelativeCords), relativeUv(44,4,4,4,RelativeCords),
        relativeUv(56,0,4,8,RelativeCords), relativeUv(56,0,-4,8,RelativeCords),
        relativeUv(48,0,4,8,RelativeCords), relativeUv(60,0,4,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.7500,-0.2500,-7.5000), vec3(0.0000,4.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,2,1,RelativeCords), relativeUv(2,0,-2,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7500,-0.2500,-7.5000), vec3(0.0000,4.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,2,1,RelativeCords), relativeUv(3,1,-2,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,-2.9500,-7.5000), vec3(2.7500,4.2500,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(3,1,-2,1,RelativeCords),
        relativeUv(0,0,2,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_LEG 1079   // -> bone STASIS_RIGHT_LEG, 4 box(es)
case CEM_TUGKAN_FALLEN_CHAMPION_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-8.0000), vec3(2.2750,4.2750,2.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,0,-4,4,RelativeCords), relativeUv(48,4,-4,4,RelativeCords),
        relativeUv(60,0,-4,8,RelativeCords), relativeUv(60,0,4,8,RelativeCords),
        relativeUv(52,0,-4,8,RelativeCords), relativeUv(56,0,-4,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7500,0.2500,-7.5000), vec3(0.0000,4.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,2,1,RelativeCords), relativeUv(2,0,-2,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.7500,0.2500,-7.5000), vec3(0.0000,4.2500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,2,1,RelativeCords), relativeUv(3,1,-2,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,2,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,2.9500,-7.5000), vec3(2.7500,4.2500,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(0,0,1,1,RelativeCords),
        relativeUv(1,1,1,1,RelativeCords), relativeUv(3,1,-2,1,RelativeCords),
        relativeUv(0,0,2,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== KINII_DURNHART_PACK  (internal-color 60,0,0) =====
#define CEM_KINII_DURNHART_PACK_CHESTPLATE 1080   // -> bone STASIS_CHESTPLATE, 5 box(es)
case CEM_KINII_DURNHART_PACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.7181,-6.4580), vec3(4.0000,2.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(40,0,8,-0,RelativeCords), relativeUv(32,0,8,0,RelativeCords),
        relativeUv(32,0,8,5,RelativeCords), relativeUv(40,0,0,5,RelativeCords),
        relativeUv(48,0,-8,5,RelativeCords), relativeUv(32,0,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-5.5721,-2.6832), vec3(4.0000,2.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268), vec3(0,0,0),
        relativeUv(48,0,-8,-0,RelativeCords), relativeUv(40,0,-8,0,RelativeCords),
        relativeUv(32,5,8,-5,RelativeCords), relativeUv(40,0,-0,5,RelativeCords),
        relativeUv(40,0,8,5,RelativeCords), relativeUv(32,0,0,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.8732,-1.0185,-6.0250), vec3(1.7500,6.0250,0.0000), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,0,4,-0,RelativeCords), relativeUv(20,0,4,0,RelativeCords),
        relativeUv(20,0,4,12,RelativeCords), relativeUv(24,0,0,12,RelativeCords),
        relativeUv(27,0,-4,12,RelativeCords), relativeUv(20,0,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.8647,-5.4880,-6.0500), vec3(1.7500,6.0250,0.0000), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(30,0,4,-0,RelativeCords), relativeUv(26,0,4,0,RelativeCords),
        relativeUv(26,0,4,12,RelativeCords), relativeUv(30,0,0,12,RelativeCords),
        relativeUv(33,0,-4,12,RelativeCords), relativeUv(26,0,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_LEFT_FEET 1081   // -> bone STASIS_LEFT_BOOT, 2 box(es)
case CEM_KINII_DURNHART_PACK_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0500,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_RIGHT_FEET 1082   // -> bone STASIS_RIGHT_BOOT, 2 box(es)
case CEM_KINII_DURNHART_PACK_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_LEFT_ARM 1083   // -> bone STASIS_LEFT_ARM, 4 box(es)
case CEM_KINII_DURNHART_PACK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,-5,5,RelativeCords), relativeUv(9,0,-5,5,RelativeCords),
        relativeUv(5,5,5,13,RelativeCords), relativeUv(0,5,5,13,RelativeCords),
        relativeUv(18,5,-5,13,RelativeCords), relativeUv(9,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(14.6052,-0.0000,-19.2747), vec3(3.5000,2.2500,4.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(60,0,-6,7,RelativeCords), relativeUv(54,0,-6,7,RelativeCords),
        relativeUv(49,7,6,3,RelativeCords), relativeUv(42,7,7,3,RelativeCords),
        relativeUv(66,7,-6,3,RelativeCords), relativeUv(54,7,7,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1250,0.1250,-16.0000), vec3(1.3750,2.2500,3.5000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(59,9,-1,5,RelativeCords), relativeUv(58,14,-1,-5,RelativeCords),
        relativeUv(58,14,-1,3,RelativeCords), relativeUv(58,14,5,3,RelativeCords),
        relativeUv(64,14,-1,3,RelativeCords), relativeUv(57,14,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_RIGHT_ARM 1084   // -> bone STASIS_RIGHT_ARM, 4 box(es)
case CEM_KINII_DURNHART_PACK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,-5,5,RelativeCords), relativeUv(9,0,-5,5,RelativeCords),
        relativeUv(5,5,5,13,RelativeCords), relativeUv(0,5,5,13,RelativeCords),
        relativeUv(18,5,-5,13,RelativeCords), relativeUv(9,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1250,-0.1250,-16.0000), vec3(1.3750,2.2500,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,9,-1,6,RelativeCords), relativeUv(59,9,-1,6,RelativeCords),
        relativeUv(58,15,1,3,RelativeCords), relativeUv(52,15,6,3,RelativeCords),
        relativeUv(66,15,-1,3,RelativeCords), relativeUv(59,15,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(15.3927,0.0000,-19.2921), vec3(3.3750,2.2500,3.8750), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(59,0,-5,6,RelativeCords), relativeUv(54,0,-5,6,RelativeCords),
        relativeUv(48,6,5,3,RelativeCords), relativeUv(42,6,6,3,RelativeCords),
        relativeUv(65,6,-5,3,RelativeCords), relativeUv(54,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_INNER_ARMOR 1085   // -> bone STASIS_INNER_ARMOR, 3 box(es)
case CEM_KINII_DURNHART_PACK_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.5000), vec3(4.7500,6.5000,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1250,0.0000,0.0000), vec3(5.3750,3.0000,3.2500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,5,-9,-5,RelativeCords), relativeUv(59,0,-9,5,RelativeCords),
        relativeUv(41,5,9,5,RelativeCords), relativeUv(41,5,-5,5,RelativeCords),
        relativeUv(55,5,9,5,RelativeCords), relativeUv(50,5,5,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1250,8.9649,4.7583), vec3(4.8750,4.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268), vec3(0,0,0),
        relativeUv(46,10,10,0,RelativeCords), relativeUv(56,10,10,0,RelativeCords),
        relativeUv(46,10,10,9,RelativeCords), relativeUv(46,10,0,9,RelativeCords),
        relativeUv(66,10,-10,9,RelativeCords), relativeUv(56,10,0,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_LEFT_LEG 1086   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_KINII_DURNHART_PACK_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0755,0.0000,-6.3378), vec3(2.8750,2.7500,2.8750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,5,RelativeCords), relativeUv(12,20,-4,5,RelativeCords),
        relativeUv(12,20,4,5,RelativeCords), relativeUv(0,20,4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_DURNHART_PACK_RIGHT_LEG 1087   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_KINII_DURNHART_PACK_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0388,0.0250,-6.2920), vec3(2.7500,2.7500,2.8750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(8,20,-4,5,RelativeCords), relativeUv(0,20,4,5,RelativeCords),
        relativeUv(12,20,4,5,RelativeCords), relativeUv(12,20,-4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== KINII_FEERAL  (internal-color 61,0,1) =====
#define CEM_KINII_FEERAL_CHESTPLATE 1088   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_KINII_FEERAL_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.8732,-1.0185,-6.0250), vec3(1.7500,6.0250,0.0000), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,0,4,-0,RelativeCords), relativeUv(20,0,4,0,RelativeCords),
        relativeUv(20,0,4,12,RelativeCords), relativeUv(24,0,0,12,RelativeCords),
        relativeUv(27,0,-4,12,RelativeCords), relativeUv(20,0,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.8647,-5.4880,-6.0500), vec3(1.7500,6.0250,0.0000), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(30,0,4,-0,RelativeCords), relativeUv(26,0,4,0,RelativeCords),
        relativeUv(26,0,4,12,RelativeCords), relativeUv(30,0,0,12,RelativeCords),
        relativeUv(33,0,-4,12,RelativeCords), relativeUv(26,0,0,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_LEFT_FEET 1089   // -> bone STASIS_LEFT_BOOT, 3 box(es)
case CEM_KINII_FEERAL_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0500,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1500,-17.7865,-3.0285), vec3(1.7500,1.7500,1.7500), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268), vec3(0,0,0),
        relativeUv(42,2,2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords),
        relativeUv(42,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords),
        relativeUv(48,4,-2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_RIGHT_FEET 1090   // -> bone STASIS_RIGHT_BOOT, 3 box(es)
case CEM_KINII_FEERAL_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1000,17.7865,-3.0285), vec3(1.7500,1.7500,1.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(42,2,2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords),
        relativeUv(42,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords),
        relativeUv(48,4,-2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_LEFT_ARM 1091   // -> bone STASIS_LEFT_ARM, 5 box(es)
case CEM_KINII_FEERAL_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1250,0.1250,-16.0000), vec3(1.3750,2.2500,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(59,9,-1,5,RelativeCords), relativeUv(58,14,-1,-5,RelativeCords),
        relativeUv(58,14,-1,3,RelativeCords), relativeUv(58,14,5,3,RelativeCords),
        relativeUv(64,14,-1,3,RelativeCords), relativeUv(57,14,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,-5,5,RelativeCords), relativeUv(9,0,-5,5,RelativeCords),
        relativeUv(5,5,5,13,RelativeCords), relativeUv(0,5,5,13,RelativeCords),
        relativeUv(18,5,-5,13,RelativeCords), relativeUv(9,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(14.6052,-0.0000,-19.2747), vec3(3.5000,2.2500,4.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(60,0,-6,7,RelativeCords), relativeUv(54,0,-6,7,RelativeCords),
        relativeUv(49,7,6,3,RelativeCords), relativeUv(42,7,7,3,RelativeCords),
        relativeUv(66,7,-6,3,RelativeCords), relativeUv(54,7,7,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(29.0076,0.1250,-9.4850), vec3(1.7500,1.7500,1.7500), mat3(-0.00000,0.70711,0.70711,0.00000,-0.70711,0.70711,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(46,2,-2,2,RelativeCords), relativeUv(44,2,-2,2,RelativeCords),
        relativeUv(42,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords),
        relativeUv(48,4,-2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_RIGHT_ARM 1092   // -> bone STASIS_RIGHT_ARM, 5 box(es)
case CEM_KINII_FEERAL_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(3.0000,7.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,-5,5,RelativeCords), relativeUv(9,0,-5,5,RelativeCords),
        relativeUv(5,5,5,13,RelativeCords), relativeUv(0,5,5,13,RelativeCords),
        relativeUv(18,5,-5,13,RelativeCords), relativeUv(9,5,5,13,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.1250,-0.1250,-16.0000), vec3(1.3750,2.2500,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,9,-1,6,RelativeCords), relativeUv(59,9,-1,6,RelativeCords),
        relativeUv(58,15,1,3,RelativeCords), relativeUv(52,15,6,3,RelativeCords),
        relativeUv(66,15,-1,3,RelativeCords), relativeUv(59,15,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(15.3927,0.0000,-19.2921), vec3(3.3750,2.2500,3.8750), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(59,0,-5,6,RelativeCords), relativeUv(54,0,-5,6,RelativeCords),
        relativeUv(48,6,5,3,RelativeCords), relativeUv(42,6,6,3,RelativeCords),
        relativeUv(65,6,-5,3,RelativeCords), relativeUv(54,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(34.5203,-0.1250,-20.6669), vec3(1.7500,1.7500,1.7500), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(46,2,-2,2,RelativeCords), relativeUv(44,2,-2,2,RelativeCords),
        relativeUv(42,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords),
        relativeUv(48,4,-2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_INNER_ARMOR 1093   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_KINII_FEERAL_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.5000), vec3(4.7500,6.5000,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_LEFT_LEG 1094   // -> bone STASIS_LEFT_LEG, 1 box(es)
case CEM_KINII_FEERAL_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_KINII_FEERAL_RIGHT_LEG 1095   // -> bone STASIS_RIGHT_LEG, 1 box(es)
case CEM_KINII_FEERAL_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== LICORN_FENRIR  (internal-color 0,180,0) =====
#define CEM_LICORN_FENRIR_CHESTPLATE 1096   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_LICORN_FENRIR_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,4.0000,-5.0000), vec3(4.0500,5.0500,2.0500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,3,-2,-3,RelativeCords), relativeUv(58,0,-2,3,RelativeCords),
        relativeUv(58,0,-2,3,RelativeCords), relativeUv(63,6,-4,10,RelativeCords),
        relativeUv(58,0,-2,3,RelativeCords), relativeUv(63,6,-4,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.1000,6.1000,2.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,20,-8,-4,RelativeCords), relativeUv(12,20,-8,-4,RelativeCords),
        relativeUv(4,20,8,12,RelativeCords), relativeUv(16,20,-4,12,RelativeCords),
        relativeUv(16,20,8,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-0.6645,-8.7582), vec3(4.0750,3.5750,3.5750), mat3(1.00000,0.00000,0.00000,0.00000,-0.90631,-0.42262,0.00000,0.42262,-0.90631), vec3(0,0,0),
        relativeUv(23,7,-8,-7,RelativeCords), relativeUv(15,7,-8,-7,RelativeCords),
        relativeUv(7,7,8,7,RelativeCords), relativeUv(22,7,-7,7,RelativeCords),
        relativeUv(22,7,8,7,RelativeCords), relativeUv(0,7,7,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_LEFT_FEET 1097   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_LICORN_FENRIR_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(2.6000,2.1000,2.6000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(30,20,5,5,RelativeCords), relativeUv(35,20,5,5,RelativeCords),
        relativeUv(30,25,5,4,RelativeCords), relativeUv(25,25,5,4,RelativeCords),
        relativeUv(45,25,-5,4,RelativeCords), relativeUv(35,25,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_RIGHT_FEET 1098   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_LICORN_FENRIR_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(2.6000,2.1000,2.6000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(30,20,5,5,RelativeCords), relativeUv(35,20,5,5,RelativeCords),
        relativeUv(30,25,5,4,RelativeCords), relativeUv(25,25,5,4,RelativeCords),
        relativeUv(45,25,-5,4,RelativeCords), relativeUv(35,25,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_LEFT_ARM 1099   // -> bone STASIS_LEFT_ARM, 5 box(es)
case CEM_LICORN_FENRIR_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,0.0000,-5.5000), vec3(1.5000,2.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,4,-3,6,RelativeCords), relativeUv(47,4,-3,6,RelativeCords),
        relativeUv(44,10,3,5,RelativeCords), relativeUv(38,10,6,5,RelativeCords),
        relativeUv(56,10,-3,5,RelativeCords), relativeUv(47,10,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-13.0000), vec3(2.6000,2.1000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,15,-5,6,RelativeCords), relativeUv(52,15,-5,6,RelativeCords),
        relativeUv(47,21,5,4,RelativeCords), relativeUv(41,21,6,4,RelativeCords),
        relativeUv(63,21,-5,4,RelativeCords), relativeUv(52,21,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.5000,0.0000,-5.5000), vec3(1.5000,2.5000,3.0000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(58,2,-3,5,RelativeCords), relativeUv(58,2,-3,5,RelativeCords),
        relativeUv(52,3,3,5,RelativeCords), relativeUv(58,2,-3,5,RelativeCords),
        relativeUv(55,3,-3,5,RelativeCords), relativeUv(55,2,3,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7900,2.3659,-16.1531), vec3(1.0000,3.0000,1.5000), mat3(-0.38268,-0.00000,0.92388,-0.65328,-0.70711,-0.27060,0.65328,-0.70711,0.27060), vec3(0,0,0),
        relativeUv(37,1,-2,3,RelativeCords), relativeUv(35,1,-2,3,RelativeCords),
        relativeUv(33,4,2,6,RelativeCords), relativeUv(30,4,3,6,RelativeCords),
        relativeUv(40,4,-2,6,RelativeCords), relativeUv(35,4,3,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5748,4.2604,-18.2037), vec3(0.9750,1.9750,1.9750), mat3(-0.38268,-0.00000,0.92388,-0.65328,-0.70711,-0.27060,0.65328,-0.70711,0.27060), vec3(0,0,0),
        relativeUv(34,10,-2,4,RelativeCords), relativeUv(32,10,-2,4,RelativeCords),
        relativeUv(30,14,2,4,RelativeCords), relativeUv(26,14,4,4,RelativeCords),
        relativeUv(38,14,-2,4,RelativeCords), relativeUv(32,14,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_RIGHT_ARM 1100   // -> bone STASIS_RIGHT_ARM, 5 box(es)
case CEM_LICORN_FENRIR_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,-0.0000,-13.0000), vec3(2.6000,2.1000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,15,-5,6,RelativeCords), relativeUv(52,15,-5,6,RelativeCords),
        relativeUv(47,21,5,4,RelativeCords), relativeUv(41,21,6,4,RelativeCords),
        relativeUv(63,21,-5,4,RelativeCords), relativeUv(52,21,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.5000,0.0000,-5.5000), vec3(1.5000,2.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(55,2,3,5,RelativeCords), relativeUv(55,2,3,5,RelativeCords),
        relativeUv(55,3,-3,5,RelativeCords), relativeUv(55,2,3,5,RelativeCords),
        relativeUv(52,3,3,5,RelativeCords), relativeUv(58,2,-3,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,0.0000,-5.5000), vec3(1.5000,2.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,4,-3,6,RelativeCords), relativeUv(47,4,-3,6,RelativeCords),
        relativeUv(44,10,3,5,RelativeCords), relativeUv(38,10,6,5,RelativeCords),
        relativeUv(56,10,-3,5,RelativeCords), relativeUv(47,10,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7900,-2.3659,-16.1531), vec3(1.0000,3.0000,1.5000), mat3(0.92388,0.38268,0.00000,0.27060,-0.65328,-0.70711,-0.27060,0.65328,-0.70711), vec3(0,0,0),
        relativeUv(37,1,-2,3,RelativeCords), relativeUv(35,1,-2,3,RelativeCords),
        relativeUv(33,4,2,6,RelativeCords), relativeUv(30,4,3,6,RelativeCords),
        relativeUv(40,4,-2,6,RelativeCords), relativeUv(35,4,3,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.5748,-4.2604,-18.2037), vec3(0.9750,1.9750,1.9750), mat3(0.92388,0.38268,0.00000,0.27060,-0.65328,-0.70711,-0.27060,0.65328,-0.70711), vec3(0,0,0),
        relativeUv(34,10,-2,4,RelativeCords), relativeUv(32,10,-2,4,RelativeCords),
        relativeUv(30,14,2,4,RelativeCords), relativeUv(26,14,4,4,RelativeCords),
        relativeUv(38,14,-2,4,RelativeCords), relativeUv(32,14,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_INNER_ARMOR 1101   // -> bone STASIS_INNER_ARMOR, 1 box(es)
case CEM_LICORN_FENRIR_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(4.7750,2.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(12,4,-8,-4,RelativeCords), relativeUv(20,0,-8,4,RelativeCords),
        relativeUv(4,12,8,4,RelativeCords), relativeUv(4,12,-4,4,RelativeCords),
        relativeUv(16,12,8,4,RelativeCords), relativeUv(12,12,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_LEFT_LEG 1102   // -> bone STASIS_LEFT_LEG, 3 box(es)
case CEM_LICORN_FENRIR_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-10.0000), vec3(1.6000,3.1000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(30,18,3,6,RelativeCords), relativeUv(33,18,3,6,RelativeCords),
        relativeUv(30,24,3,6,RelativeCords), relativeUv(24,24,6,6,RelativeCords),
        relativeUv(42,24,-3,6,RelativeCords), relativeUv(33,24,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.0000,0.0000,-10.0000), vec3(1.0000,3.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,2,6,RelativeCords), relativeUv(44,0,2,6,RelativeCords),
        relativeUv(42,6,2,6,RelativeCords), relativeUv(36,6,6,6,RelativeCords),
        relativeUv(52,6,-2,6,RelativeCords), relativeUv(44,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-7.5000), vec3(2.1000,4.6000,2.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(9,18,4,4,RelativeCords), relativeUv(13,18,4,4,RelativeCords),
        relativeUv(9,22,4,9,RelativeCords), relativeUv(5,22,4,9,RelativeCords),
        relativeUv(21,22,-4,9,RelativeCords), relativeUv(13,22,4,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_LICORN_FENRIR_RIGHT_LEG 1103   // -> bone STASIS_RIGHT_LEG, 3 box(es)
case CEM_LICORN_FENRIR_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-10.0000), vec3(1.6000,3.1000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(30,18,3,6,RelativeCords), relativeUv(33,18,3,6,RelativeCords),
        relativeUv(30,24,3,6,RelativeCords), relativeUv(24,24,6,6,RelativeCords),
        relativeUv(42,24,-3,6,RelativeCords), relativeUv(33,24,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.0000,-0.0000,-10.0000), vec3(1.0000,3.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,2,6,RelativeCords), relativeUv(44,0,2,6,RelativeCords),
        relativeUv(42,6,2,6,RelativeCords), relativeUv(36,6,6,6,RelativeCords),
        relativeUv(52,6,-2,6,RelativeCords), relativeUv(44,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-7.5000), vec3(2.1000,4.6000,2.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(9,18,4,4,RelativeCords), relativeUv(13,18,4,4,RelativeCords),
        relativeUv(9,22,4,9,RelativeCords), relativeUv(5,22,4,9,RelativeCords),
        relativeUv(21,22,-4,9,RelativeCords), relativeUv(13,22,4,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== LICORN_KIRITO_BLACK  (internal-color 180,0,1) =====
#define CEM_LICORN_KIRITO_BLACK_CHESTPLATE 1104   // -> bone STASIS_CHESTPLATE, 14 box(es)
case CEM_LICORN_KIRITO_BLACK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-7.5500), vec3(3.0000,0.7500,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,0,3,5,RelativeCords), relativeUv(21,0,3,5,RelativeCords),
        relativeUv(29,5,3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        relativeUv(21,5,3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(4.5250,1.0250,3.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,8,12,5,RelativeCords), relativeUv(20,13,12,-5,RelativeCords),
        relativeUv(20,0,-20,3,RelativeCords), relativeUv(20,5,12,3,RelativeCords),
        relativeUv(32,5,-12,3,RelativeCords), relativeUv(32,5,-12,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.0000,6.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,16,-8,4,RelativeCords), relativeUv(28,16,-8,4,RelativeCords),
        relativeUv(28,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.5000,-13.0000), vec3(3.0000,1.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(15,14,-6,3,RelativeCords), relativeUv(9,14,-6,3,RelativeCords),
        relativeUv(18,17,-6,2,RelativeCords), relativeUv(9,17,3,2,RelativeCords),
        relativeUv(9,17,-6,2,RelativeCords), relativeUv(3,17,-3,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.9542,0.0000,-6.8347), vec3(2.0000,0.7500,2.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(27,0,-3,5,RelativeCords), relativeUv(24,0,-3,5,RelativeCords),
        relativeUv(32,5,-3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        relativeUv(24,5,-3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.8210,0.0000,-11.8198), vec3(2.4750,0.7750,2.5250), mat3(0.38268,0.00000,-0.92388,-0.92388,0.00000,-0.38268,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(27,0,-3,5,RelativeCords), relativeUv(24,0,-3,5,RelativeCords),
        relativeUv(32,5,-3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        relativeUv(24,5,-3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.5607,-1.7519,0.0607), vec3(1.0000,3.0000,0.0000), mat3(0.92388,-0.00000,0.38268,0.35355,-0.38268,-0.85355,0.14645,0.92388,-0.35355), vec3(0,0,0),
        relativeUv(64,0,2,-0,RelativeCords), relativeUv(62,0,2,0,RelativeCords),
        relativeUv(61,0,3,6,RelativeCords), relativeUv(62,0,-0,6,RelativeCords),
        relativeUv(62,26,2,6,RelativeCords), relativeUv(64,0,0,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.5607,-1.7519,0.0607), vec3(1.0000,3.0000,0.0000), mat3(0.92388,0.00000,-0.38268,-0.35355,-0.38268,-0.85355,-0.14645,0.92388,-0.35355), vec3(0,0,0),
        relativeUv(66,0,-2,-0,RelativeCords), relativeUv(64,0,-2,0,RelativeCords),
        relativeUv(64,0,-3,6,RelativeCords), relativeUv(64,0,-0,6,RelativeCords),
        relativeUv(64,26,-2,6,RelativeCords), relativeUv(62,0,0,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2349,-3.1000,-7.6771), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,-2,1,RelativeCords), relativeUv(40,0,-2,1,RelativeCords),
        relativeUv(43,1,-2,2,RelativeCords), relativeUv(40,1,1,2,RelativeCords),
        relativeUv(40,1,-2,2,RelativeCords), relativeUv(38,1,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5090,-2.5000,-6.2940), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.8187,-2.5000,-7.2507), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7374,-2.5000,-8.8782), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.9866,0.0000,3.9194), vec3(2.0000,5.0000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,0,-4,6,RelativeCords), relativeUv(54,0,-4,6,RelativeCords),
        relativeUv(64,6,-4,10,RelativeCords), relativeUv(54,6,6,10,RelativeCords),
        relativeUv(54,6,-4,10,RelativeCords), relativeUv(50,6,-6,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.9866,0.0000,3.9194), vec3(2.0000,5.0000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,4,6,RelativeCords), relativeUv(50,0,4,6,RelativeCords),
        relativeUv(60,6,4,10,RelativeCords), relativeUv(50,6,-6,10,RelativeCords),
        relativeUv(50,6,4,10,RelativeCords), relativeUv(54,6,6,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== LICORN_KIRITO_WHITE  (internal-color 180,0,2) =====
#define CEM_LICORN_KIRITO_WHITE_CHESTPLATE 1105   // -> bone STASIS_CHESTPLATE, 14 box(es)
case CEM_LICORN_KIRITO_WHITE_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-7.5500), vec3(3.0000,0.7500,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,0,3,5,RelativeCords), relativeUv(21,0,3,5,RelativeCords),
        relativeUv(29,5,3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        relativeUv(21,5,3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.0000), vec3(4.5250,1.0250,3.0250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,8,12,5,RelativeCords), relativeUv(20,13,12,-5,RelativeCords),
        relativeUv(20,0,-20,3,RelativeCords), relativeUv(20,5,12,3,RelativeCords),
        relativeUv(32,5,-12,3,RelativeCords), relativeUv(32,5,-12,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.0000,6.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,16,-8,4,RelativeCords), relativeUv(28,16,-8,4,RelativeCords),
        relativeUv(28,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.5000,-13.0000), vec3(3.0000,1.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(15,14,-6,3,RelativeCords), relativeUv(9,14,-6,3,RelativeCords),
        relativeUv(18,17,-6,2,RelativeCords), relativeUv(9,17,3,2,RelativeCords),
        relativeUv(9,17,-6,2,RelativeCords), relativeUv(3,17,-3,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.9542,0.0000,-6.8347), vec3(2.0000,0.7500,2.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(27,0,-3,5,RelativeCords), relativeUv(24,0,-3,5,RelativeCords),
        relativeUv(32,5,-3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        relativeUv(24,5,-3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.8210,0.0000,-11.8198), vec3(2.4750,0.7750,2.5250), mat3(0.38268,0.00000,-0.92388,-0.92388,0.00000,-0.38268,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(27,0,-3,5,RelativeCords), relativeUv(24,0,-3,5,RelativeCords),
        relativeUv(32,5,-3,3,RelativeCords), relativeUv(24,5,5,3,RelativeCords),
        relativeUv(24,5,-3,3,RelativeCords), relativeUv(21,5,-5,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.5607,-1.7519,0.0607), vec3(1.0000,3.0000,0.0000), mat3(0.92388,-0.00000,0.38268,0.35355,-0.38268,-0.85355,0.14645,0.92388,-0.35355), vec3(0,0,0),
        relativeUv(64,0,2,-0,RelativeCords), relativeUv(62,0,2,0,RelativeCords),
        relativeUv(61,0,3,6,RelativeCords), relativeUv(62,0,-0,6,RelativeCords),
        relativeUv(62,26,2,6,RelativeCords), relativeUv(64,0,0,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.5607,-1.7519,0.0607), vec3(1.0000,3.0000,0.0000), mat3(0.92388,0.00000,-0.38268,-0.35355,-0.38268,-0.85355,-0.14645,0.92388,-0.35355), vec3(0,0,0),
        relativeUv(66,0,-2,-0,RelativeCords), relativeUv(64,0,-2,0,RelativeCords),
        relativeUv(64,0,-3,6,RelativeCords), relativeUv(64,0,-0,6,RelativeCords),
        relativeUv(64,26,-2,6,RelativeCords), relativeUv(62,0,0,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2349,-3.1000,-7.6771), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(42,0,-2,1,RelativeCords), relativeUv(40,0,-2,1,RelativeCords),
        relativeUv(43,1,-2,2,RelativeCords), relativeUv(40,1,1,2,RelativeCords),
        relativeUv(40,1,-2,2,RelativeCords), relativeUv(38,1,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.5090,-2.5000,-6.2940), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.8187,-2.5000,-7.2507), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7374,-2.5000,-8.8782), vec3(1.0000,1.0000,0.5000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,9,-2,1,RelativeCords), relativeUv(41,9,-2,1,RelativeCords),
        relativeUv(44,10,-2,2,RelativeCords), relativeUv(41,10,1,2,RelativeCords),
        relativeUv(41,10,-2,2,RelativeCords), relativeUv(39,10,-1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.9866,0.0000,3.9194), vec3(2.0000,5.0000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,0,-4,6,RelativeCords), relativeUv(54,0,-4,6,RelativeCords),
        relativeUv(64,6,-4,10,RelativeCords), relativeUv(54,6,6,10,RelativeCords),
        relativeUv(54,6,-4,10,RelativeCords), relativeUv(50,6,-6,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.9866,0.0000,3.9194), vec3(2.0000,5.0000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(54,0,4,6,RelativeCords), relativeUv(50,0,4,6,RelativeCords),
        relativeUv(60,6,4,10,RelativeCords), relativeUv(50,6,-6,10,RelativeCords),
        relativeUv(50,6,4,10,RelativeCords), relativeUv(54,6,6,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== MASAKI_SPIKE  (internal-color 0,180,1) =====
#define CEM_MASAKI_SPIKE_CHESTPLATE 1106   // -> bone STASIS_CHESTPLATE, 7 box(es)
case CEM_MASAKI_SPIKE_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.4510,-4.7482,-6.6500), vec3(0.0000,6.0000,1.1250), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(0,2,0,-2,RelativeCords), relativeUv(0,0,0,2,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(35,0,2,12,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(35,0,2,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.8033,-2.9328,-6.6500), vec3(0.0000,6.0000,1.1250), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(0,2,0,-2,RelativeCords), relativeUv(0,0,0,2,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(35,0,2,12,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(35,0,2,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.6783,-2.6828,-6.6500), vec3(0.0000,6.0000,1.1250), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(0,2,0,-2,RelativeCords), relativeUv(0,0,0,2,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(32,0,2,12,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(32,0,2,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7010,-4.2482,-6.6500), vec3(0.0000,6.0000,1.1250), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(0,2,0,-2,RelativeCords), relativeUv(0,0,0,2,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(32,0,2,12,RelativeCords),
        relativeUv(0,0,0,11,RelativeCords), relativeUv(32,0,2,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1903,-0.2189,-6.0250), vec3(2.0000,6.7750,0.7500), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(23,32,-3,-1,RelativeCords), relativeUv(27,21,-3,-1,RelativeCords),
        relativeUv(24,20,3,12,RelativeCords), relativeUv(32,20,-1,12,RelativeCords),
        relativeUv(21,20,3,12,RelativeCords), relativeUv(24,20,1,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0894,-4.7268,-6.0500), vec3(2.0000,6.7750,0.7500), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(23,32,-3,-1,RelativeCords), relativeUv(24,21,-3,-1,RelativeCords),
        relativeUv(21,20,3,12,RelativeCords), relativeUv(24,20,-1,12,RelativeCords),
        relativeUv(24,20,-3,12,RelativeCords), relativeUv(16,20,1,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_LEFT_FEET 1107   // -> bone STASIS_LEFT_BOOT, 3 box(es)
case CEM_MASAKI_SPIKE_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0375,4.2500,-1.0000), vec3(2.0375,0.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(35,5,3,-2,RelativeCords), relativeUv(35,3,3,2,RelativeCords),
        relativeUv(0,0,5,0,RelativeCords), relativeUv(3,0,-3,0,RelativeCords),
        relativeUv(0,0,5,0,RelativeCords), relativeUv(0,0,3,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.2000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_RIGHT_FEET 1108   // -> bone STASIS_RIGHT_BOOT, 3 box(es)
case CEM_MASAKI_SPIKE_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.1625,-4.2500,-1.0000), vec3(2.0375,0.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(35,5,3,-2,RelativeCords), relativeUv(35,3,3,2,RelativeCords),
        relativeUv(0,0,5,0,RelativeCords), relativeUv(3,0,-3,0,RelativeCords),
        relativeUv(0,0,5,0,RelativeCords), relativeUv(0,0,3,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,0.0000), vec3(3.0000,1.2500,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(4,30,4,2,RelativeCords), relativeUv(4,30,-4,2,RelativeCords),
        relativeUv(12,30,4,2,RelativeCords), relativeUv(8,30,4,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_LEFT_ARM 1109   // -> bone STASIS_LEFT_ARM, 5 box(es)
case CEM_MASAKI_SPIKE_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6500,1.4500,-15.4000), vec3(1.0000,4.5000,0.0000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(0,0,-0,2,RelativeCords), relativeUv(0,0,-0,2,RelativeCords),
        relativeUv(37,0,2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        relativeUv(39,0,-2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.6500,-1.4000,-15.4000), vec3(1.0000,4.5000,0.0000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(0,0,-0,2,RelativeCords), relativeUv(0,0,-0,2,RelativeCords),
        relativeUv(37,0,2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        relativeUv(39,0,-2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-18.1537,0.0000,-9.4912), vec3(3.0000,2.2500,3.0000), mat3(0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,20,-4,-4,RelativeCords),
        relativeUv(48,20,-4,3,RelativeCords), relativeUv(48,20,4,3,RelativeCords),
        relativeUv(56,20,-4,3,RelativeCords), relativeUv(44,20,-4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(17.3710,-0.0000,-19.8751), vec3(2.2500,3.5000,2.7500), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(52,0,-4,4,RelativeCords), relativeUv(48,4,-4,-4,RelativeCords),
        relativeUv(48,4,-4,6,RelativeCords), relativeUv(48,4,4,6,RelativeCords),
        relativeUv(44,4,4,6,RelativeCords), relativeUv(44,4,-4,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_RIGHT_ARM 1110   // -> bone STASIS_RIGHT_ARM, 5 box(es)
case CEM_MASAKI_SPIKE_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.3500,1.4000,-15.4000), vec3(1.0000,4.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(0,0,-0,2,RelativeCords), relativeUv(0,0,-0,2,RelativeCords),
        relativeUv(39,0,-2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        relativeUv(37,0,2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.3500,-1.4500,-15.4000), vec3(1.0000,4.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(0,0,-0,2,RelativeCords), relativeUv(0,0,-0,2,RelativeCords),
        relativeUv(39,0,-2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        relativeUv(37,0,2,9,RelativeCords), relativeUv(39,0,-2,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(17.2014,0.0000,-11.8113), vec3(2.2500,3.5000,2.7500), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,0,-4,4,RelativeCords), relativeUv(44,4,4,-4,RelativeCords),
        relativeUv(44,4,4,6,RelativeCords), relativeUv(40,4,4,6,RelativeCords),
        relativeUv(48,4,-4,6,RelativeCords), relativeUv(52,4,-4,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-19.1722,-0.0000,-9.4129), vec3(2.8750,2.2500,2.8750), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,16,4,4,RelativeCords), relativeUv(44,20,4,-4,RelativeCords),
        relativeUv(44,20,4,3,RelativeCords), relativeUv(44,20,-4,3,RelativeCords),
        relativeUv(52,20,4,3,RelativeCords), relativeUv(48,20,4,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_INNER_ARMOR 1111   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_MASAKI_SPIKE_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.5000), vec3(4.7500,6.5000,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(20,20,-4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_LEFT_LEG 1112   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_MASAKI_SPIKE_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.7995,0.1250,-8.3378), vec3(2.5000,2.7500,2.7500), mat3(0.92388,-0.00000,-0.38268,0.38268,0.00000,0.92388,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(8,20,-4,5,RelativeCords), relativeUv(8,20,4,5,RelativeCords),
        relativeUv(16,20,-4,5,RelativeCords), relativeUv(4,20,-4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_MASAKI_SPIKE_RIGHT_LEG 1113   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_MASAKI_SPIKE_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2888,-0.1000,-8.2920), vec3(2.5000,2.7500,2.7500), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,5,RelativeCords), relativeUv(0,20,4,5,RelativeCords),
        relativeUv(12,20,4,5,RelativeCords), relativeUv(12,20,-4,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== REFMAP  (internal-color 200,100,60) =====
#define CEM_REFMAP_CHESTPLATE 1114   // -> bone STASIS_CHESTPLATE, 5 box(es)
case CEM_REFMAP_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(3,2,2,-2,RelativeCords), relativeUv(2,0,2,2,RelativeCords),
        relativeUv(2,2,2,2,RelativeCords), relativeUv(3,2,2,2,RelativeCords),
        relativeUv(6,2,-2,2,RelativeCords), relativeUv(0,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(9,2,2,-2,RelativeCords), relativeUv(8,0,2,2,RelativeCords),
        relativeUv(8,2,2,2,RelativeCords), relativeUv(9,2,2,2,RelativeCords),
        relativeUv(12,2,-2,2,RelativeCords), relativeUv(6,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,-1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(15,2,2,-2,RelativeCords), relativeUv(14,0,2,2,RelativeCords),
        relativeUv(14,2,2,2,RelativeCords), relativeUv(15,2,2,2,RelativeCords),
        relativeUv(18,2,-2,2,RelativeCords), relativeUv(12,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(21,2,2,-2,RelativeCords), relativeUv(20,0,2,2,RelativeCords),
        relativeUv(20,2,2,2,RelativeCords), relativeUv(21,2,2,2,RelativeCords),
        relativeUv(24,2,-2,2,RelativeCords), relativeUv(18,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(27,2,2,-2,RelativeCords), relativeUv(26,0,2,2,RelativeCords),
        relativeUv(26,2,2,2,RelativeCords), relativeUv(27,2,2,2,RelativeCords),
        relativeUv(30,2,-2,2,RelativeCords), relativeUv(24,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_LEFT_ARM 1115   // -> bone STASIS_LEFT_ARM, 5 box(es)
case CEM_REFMAP_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2500,1.2500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,0,-2,2,RelativeCords), relativeUv(3,0,-2,2,RelativeCords),
        relativeUv(2,2,2,2,RelativeCords), relativeUv(0,2,2,2,RelativeCords),
        relativeUv(6,2,-2,2,RelativeCords), relativeUv(3,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7500,1.2500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,0,-2,2,RelativeCords), relativeUv(9,0,-2,2,RelativeCords),
        relativeUv(8,2,2,2,RelativeCords), relativeUv(6,2,2,2,RelativeCords),
        relativeUv(12,2,-2,2,RelativeCords), relativeUv(9,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2500,1.2500,-5.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(17,0,-2,2,RelativeCords), relativeUv(15,0,-2,2,RelativeCords),
        relativeUv(14,2,2,2,RelativeCords), relativeUv(12,2,2,2,RelativeCords),
        relativeUv(18,2,-2,2,RelativeCords), relativeUv(15,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2500,-1.7500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(23,0,-2,2,RelativeCords), relativeUv(21,0,-2,2,RelativeCords),
        relativeUv(20,2,2,2,RelativeCords), relativeUv(18,2,2,2,RelativeCords),
        relativeUv(24,2,-2,2,RelativeCords), relativeUv(21,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.7500,-1.7500,-5.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(29,0,-2,2,RelativeCords), relativeUv(27,0,-2,2,RelativeCords),
        relativeUv(26,2,2,2,RelativeCords), relativeUv(24,2,2,2,RelativeCords),
        relativeUv(30,2,-2,2,RelativeCords), relativeUv(27,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_RIGHT_ARM 1116   // -> bone STASIS_RIGHT_ARM, 5 box(es)
case CEM_REFMAP_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,-1.2500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(35,0,-2,2,RelativeCords), relativeUv(33,0,-2,2,RelativeCords),
        relativeUv(32,2,2,2,RelativeCords), relativeUv(30,2,2,2,RelativeCords),
        relativeUv(36,2,-2,2,RelativeCords), relativeUv(33,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7500,-1.2500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(41,0,-2,2,RelativeCords), relativeUv(39,0,-2,2,RelativeCords),
        relativeUv(38,2,2,2,RelativeCords), relativeUv(36,2,2,2,RelativeCords),
        relativeUv(42,2,-2,2,RelativeCords), relativeUv(39,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,-1.2500,-5.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(47,0,-2,2,RelativeCords), relativeUv(45,0,-2,2,RelativeCords),
        relativeUv(44,2,2,2,RelativeCords), relativeUv(42,2,2,2,RelativeCords),
        relativeUv(48,2,-2,2,RelativeCords), relativeUv(45,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,1.7500,-2.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(53,0,-2,2,RelativeCords), relativeUv(51,0,-2,2,RelativeCords),
        relativeUv(50,2,2,2,RelativeCords), relativeUv(48,2,2,2,RelativeCords),
        relativeUv(54,2,-2,2,RelativeCords), relativeUv(51,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.7500,1.7500,-5.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(59,0,-2,2,RelativeCords), relativeUv(57,0,-2,2,RelativeCords),
        relativeUv(56,2,2,2,RelativeCords), relativeUv(54,2,2,2,RelativeCords),
        relativeUv(60,2,-2,2,RelativeCords), relativeUv(57,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_LEFT_FEET 1117   // -> bone STASIS_LEFT_BOOT, 5 box(es)
case CEM_REFMAP_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.1000,1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(2,0,2,2,RelativeCords), relativeUv(3,0,2,2,RelativeCords),
        relativeUv(2,2,2,2,RelativeCords), relativeUv(0,2,2,2,RelativeCords),
        relativeUv(6,2,-2,2,RelativeCords), relativeUv(3,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.9000,1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,0,2,2,RelativeCords), relativeUv(9,0,2,2,RelativeCords),
        relativeUv(8,2,2,2,RelativeCords), relativeUv(6,2,2,2,RelativeCords),
        relativeUv(12,2,-2,2,RelativeCords), relativeUv(9,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.1000,1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,2,2,RelativeCords), relativeUv(15,0,2,2,RelativeCords),
        relativeUv(14,2,2,2,RelativeCords), relativeUv(12,2,2,2,RelativeCords),
        relativeUv(18,2,-2,2,RelativeCords), relativeUv(15,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.9000,-1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,0,2,2,RelativeCords), relativeUv(27,0,2,2,RelativeCords),
        relativeUv(26,2,2,2,RelativeCords), relativeUv(24,2,2,2,RelativeCords),
        relativeUv(30,2,-2,2,RelativeCords), relativeUv(27,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.1000,-1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,0,2,2,RelativeCords), relativeUv(21,0,2,2,RelativeCords),
        relativeUv(20,2,2,2,RelativeCords), relativeUv(18,2,2,2,RelativeCords),
        relativeUv(24,2,-2,2,RelativeCords), relativeUv(21,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_RIGHT_FEET 1118   // -> bone STASIS_RIGHT_BOOT, 5 box(es)
case CEM_REFMAP_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(32,0,2,2,RelativeCords), relativeUv(33,0,2,2,RelativeCords),
        relativeUv(32,2,2,2,RelativeCords), relativeUv(30,2,2,2,RelativeCords),
        relativeUv(36,2,-2,2,RelativeCords), relativeUv(33,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(38,0,2,2,RelativeCords), relativeUv(39,0,2,2,RelativeCords),
        relativeUv(38,2,2,2,RelativeCords), relativeUv(36,2,2,2,RelativeCords),
        relativeUv(42,2,-2,2,RelativeCords), relativeUv(39,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,-1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(44,0,2,2,RelativeCords), relativeUv(45,0,2,2,RelativeCords),
        relativeUv(44,2,2,2,RelativeCords), relativeUv(42,2,2,2,RelativeCords),
        relativeUv(48,2,-2,2,RelativeCords), relativeUv(45,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,0,2,2,RelativeCords), relativeUv(51,0,2,2,RelativeCords),
        relativeUv(50,2,2,2,RelativeCords), relativeUv(48,2,2,2,RelativeCords),
        relativeUv(54,2,-2,2,RelativeCords), relativeUv(51,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7500,1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,0,2,2,RelativeCords), relativeUv(57,0,2,2,RelativeCords),
        relativeUv(56,2,2,2,RelativeCords), relativeUv(54,2,2,2,RelativeCords),
        relativeUv(60,2,-2,2,RelativeCords), relativeUv(57,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_INNER_ARMOR 1119   // -> bone STASIS_INNER_ARMOR, 5 box(es)
case CEM_REFMAP_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(2,0,2,2,RelativeCords), relativeUv(3,0,2,2,RelativeCords),
        relativeUv(2,2,2,2,RelativeCords), relativeUv(0,2,2,2,RelativeCords),
        relativeUv(6,2,-2,2,RelativeCords), relativeUv(3,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,0,2,2,RelativeCords), relativeUv(9,0,2,2,RelativeCords),
        relativeUv(8,2,2,2,RelativeCords), relativeUv(6,2,2,2,RelativeCords),
        relativeUv(12,2,-2,2,RelativeCords), relativeUv(9,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,-1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,2,2,RelativeCords), relativeUv(15,0,2,2,RelativeCords),
        relativeUv(14,2,2,2,RelativeCords), relativeUv(12,2,2,2,RelativeCords),
        relativeUv(18,2,-2,2,RelativeCords), relativeUv(15,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2500,1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,0,2,2,RelativeCords), relativeUv(21,0,2,2,RelativeCords),
        relativeUv(20,2,2,2,RelativeCords), relativeUv(18,2,2,2,RelativeCords),
        relativeUv(24,2,-2,2,RelativeCords), relativeUv(21,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2500,1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,0,2,2,RelativeCords), relativeUv(27,0,2,2,RelativeCords),
        relativeUv(26,2,2,2,RelativeCords), relativeUv(24,2,2,2,RelativeCords),
        relativeUv(30,2,-2,2,RelativeCords), relativeUv(27,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_LEFT_LEG 1120   // -> bone STASIS_LEFT_LEG, 5 box(es)
case CEM_REFMAP_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2500,1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(2,0,2,2,RelativeCords), relativeUv(3,0,2,2,RelativeCords),
        relativeUv(2,2,2,2,RelativeCords), relativeUv(0,2,2,2,RelativeCords),
        relativeUv(6,2,-2,2,RelativeCords), relativeUv(3,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.7500,1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,0,2,2,RelativeCords), relativeUv(9,0,2,2,RelativeCords),
        relativeUv(8,2,2,2,RelativeCords), relativeUv(6,2,2,2,RelativeCords),
        relativeUv(12,2,-2,2,RelativeCords), relativeUv(9,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2500,1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,0,2,2,RelativeCords), relativeUv(15,0,2,2,RelativeCords),
        relativeUv(14,2,2,2,RelativeCords), relativeUv(12,2,2,2,RelativeCords),
        relativeUv(18,2,-2,2,RelativeCords), relativeUv(15,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2500,-1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,0,2,2,RelativeCords), relativeUv(21,0,2,2,RelativeCords),
        relativeUv(20,2,2,2,RelativeCords), relativeUv(18,2,2,2,RelativeCords),
        relativeUv(24,2,-2,2,RelativeCords), relativeUv(21,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.7500,-1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,0,2,2,RelativeCords), relativeUv(27,0,2,2,RelativeCords),
        relativeUv(26,2,2,2,RelativeCords), relativeUv(24,2,2,2,RelativeCords),
        relativeUv(30,2,-2,2,RelativeCords), relativeUv(27,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_REFMAP_RIGHT_LEG 1121   // -> bone STASIS_RIGHT_LEG, 5 box(es)
case CEM_REFMAP_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(32,0,2,2,RelativeCords), relativeUv(33,0,2,2,RelativeCords),
        relativeUv(32,2,2,2,RelativeCords), relativeUv(30,2,2,2,RelativeCords),
        relativeUv(36,2,-2,2,RelativeCords), relativeUv(33,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7500,-1.2500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(38,0,2,2,RelativeCords), relativeUv(39,0,2,2,RelativeCords),
        relativeUv(38,2,2,2,RelativeCords), relativeUv(36,2,2,2,RelativeCords),
        relativeUv(42,2,-2,2,RelativeCords), relativeUv(39,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,-1.2500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(44,0,2,2,RelativeCords), relativeUv(45,0,2,2,RelativeCords),
        relativeUv(44,2,2,2,RelativeCords), relativeUv(42,2,2,2,RelativeCords),
        relativeUv(48,2,-2,2,RelativeCords), relativeUv(45,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.2500,1.7500,-0.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,0,2,2,RelativeCords), relativeUv(51,0,2,2,RelativeCords),
        relativeUv(50,2,2,2,RelativeCords), relativeUv(48,2,2,2,RelativeCords),
        relativeUv(54,2,-2,2,RelativeCords), relativeUv(51,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.7500,1.7500,-3.7500), vec3(0.7500,0.7500,0.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,0,2,2,RelativeCords), relativeUv(57,0,2,2,RelativeCords),
        relativeUv(56,2,2,2,RelativeCords), relativeUv(54,2,2,2,RelativeCords),
        relativeUv(60,2,-2,2,RelativeCords), relativeUv(57,2,2,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ZEKERN_SENTINEL  (internal-color 73,0,0) =====
#define CEM_ZEKERN_SENTINEL_CHESTPLATE 1122   // -> bone STASIS_CHESTPLATE, 4 box(es)
case CEM_ZEKERN_SENTINEL_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7750,6.7750,2.7750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.7346,-0.0000,-12.8478), vec3(0.5250,3.0250,3.0250), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,6,1,-6,RelativeCords), relativeUv(6,0,1,6,RelativeCords),
        relativeUv(6,6,1,6,RelativeCords), relativeUv(7,6,6,6,RelativeCords),
        relativeUv(14,6,-1,6,RelativeCords), relativeUv(0,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.7346,0.0000,-12.8478), vec3(0.5250,3.0250,3.0250), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,6,1,-6,RelativeCords), relativeUv(6,0,1,6,RelativeCords),
        relativeUv(6,6,1,6,RelativeCords), relativeUv(7,6,6,6,RelativeCords),
        relativeUv(14,6,-1,6,RelativeCords), relativeUv(0,6,6,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-1.6000,-10.0000), vec3(2.7750,2.7750,2.7750), mat3(0.70711,0.50000,0.50000,0.00000,0.70711,-0.70711,-0.70711,0.50000,0.50000), vec3(0,0,0),
        relativeUv(56,4,4,-4,RelativeCords), relativeUv(52,0,4,4,RelativeCords),
        relativeUv(52,4,4,4,RelativeCords), relativeUv(56,4,4,4,RelativeCords),
        relativeUv(64,4,-4,4,RelativeCords), relativeUv(48,4,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_LEFT_FEET 1123   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_ZEKERN_SENTINEL_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_RIGHT_FEET 1124   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_ZEKERN_SENTINEL_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_LEFT_ARM 1125   // -> bone STASIS_LEFT_ARM, 4 box(es)
case CEM_ZEKERN_SENTINEL_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-7.5000), vec3(3.0000,0.5000,3.0000), mat3(0.00000,0.00000,1.00000,0.00000,-1.00000,-0.00000,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(32,0,-6,6,RelativeCords), relativeUv(26,0,-6,6,RelativeCords),
        relativeUv(20,6,6,1,RelativeCords), relativeUv(14,6,6,1,RelativeCords),
        relativeUv(38,6,-6,1,RelativeCords), relativeUv(26,6,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.3478,0.0000,-14.2654), vec3(2.2500,3.2500,3.7500), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(44,5,-3,6,RelativeCords), relativeUv(41,5,-3,6,RelativeCords),
        relativeUv(38,11,3,5,RelativeCords), relativeUv(32,11,6,5,RelativeCords),
        relativeUv(50,11,-3,5,RelativeCords), relativeUv(41,11,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.4619,0.0000,-8.1913), vec3(0.5000,2.0000,1.0000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(18,0,-1,2,RelativeCords), relativeUv(17,0,-1,2,RelativeCords),
        relativeUv(16,2,1,4,RelativeCords), relativeUv(14,2,2,4,RelativeCords),
        relativeUv(20,2,-1,4,RelativeCords), relativeUv(17,2,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_RIGHT_ARM 1126   // -> bone STASIS_RIGHT_ARM, 3 box(es)
case CEM_ZEKERN_SENTINEL_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.4619,-0.0000,-8.1913), vec3(0.5000,2.0000,1.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,0,-1,2,RelativeCords), relativeUv(17,0,-1,2,RelativeCords),
        relativeUv(16,2,1,4,RelativeCords), relativeUv(14,2,2,4,RelativeCords),
        relativeUv(20,2,-1,4,RelativeCords), relativeUv(17,2,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.3478,-0.0000,-14.2654), vec3(2.2500,3.2500,3.7500), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(44,5,-3,6,RelativeCords), relativeUv(41,5,-3,6,RelativeCords),
        relativeUv(38,11,3,5,RelativeCords), relativeUv(32,11,6,5,RelativeCords),
        relativeUv(50,11,-3,5,RelativeCords), relativeUv(41,11,6,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_INNER_ARMOR 1127   // -> bone STASIS_INNER_ARMOR, 3 box(es)
case CEM_ZEKERN_SENTINEL_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-2.5000,-0.5000), vec3(1.5000,3.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(1,0,3,1,RelativeCords), relativeUv(4,0,3,1,RelativeCords),
        relativeUv(1,1,3,7,RelativeCords), relativeUv(0,1,1,7,RelativeCords),
        relativeUv(8,1,-3,7,RelativeCords), relativeUv(4,1,1,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-2.5000,3.6000), vec3(1.4750,1.4750,0.4750), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(57,0,3,1,RelativeCords), relativeUv(60,0,3,1,RelativeCords),
        relativeUv(57,1,3,3,RelativeCords), relativeUv(56,1,1,3,RelativeCords),
        relativeUv(64,1,-3,3,RelativeCords), relativeUv(60,1,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_LEFT_LEG 1128   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_ZEKERN_SENTINEL_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5250,6.5250,2.5250), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-8.0000), vec3(1.0000,2.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,0,2,4,RelativeCords), relativeUv(28,0,2,4,RelativeCords),
        relativeUv(26,4,2,4,RelativeCords), relativeUv(22,4,4,4,RelativeCords),
        relativeUv(34,4,-2,4,RelativeCords), relativeUv(28,4,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_SENTINEL_RIGHT_LEG 1129   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_ZEKERN_SENTINEL_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,0.0000,-8.0000), vec3(1.0000,2.0000,2.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,0,2,4,RelativeCords), relativeUv(28,0,2,4,RelativeCords),
        relativeUv(26,4,2,4,RelativeCords), relativeUv(22,4,4,4,RelativeCords),
        relativeUv(34,4,-2,4,RelativeCords), relativeUv(28,4,4,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== CILIO_SHOES  (internal-color 0,70,0) =====
#define CEM_CILIO_SHOES_LEFT_FEET 1130   // -> bone STASIS_LEFT_BOOT, 4 box(es)
case CEM_CILIO_SHOES_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,0.0000,-6.6500), vec3(3.4000,1.9500,3.8500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(21,8,-7,-8,RelativeCords), relativeUv(21,8,-7,8,RelativeCords),
        relativeUv(21,10,7,4,RelativeCords), relativeUv(8,21,-8,4,RelativeCords),
        relativeUv(8,22,7,4,RelativeCords), relativeUv(21,0,8,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,1.3500,-0.6250), vec3(3.5500,1.3750,5.6500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,11,-7,-11,RelativeCords), relativeUv(14,0,-7,11,RelativeCords),
        relativeUv(0,25,7,3,RelativeCords), relativeUv(25,16,-11,3,RelativeCords),
        relativeUv(25,14,7,3,RelativeCords), relativeUv(14,19,11,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,1.3000,-3.3500), vec3(3.4500,1.3500,5.2000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(7,21,-7,-10,RelativeCords), relativeUv(14,11,-7,10,RelativeCords),
        relativeUv(25,17,7,3,RelativeCords), relativeUv(31,4,-10,3,RelativeCords),
        relativeUv(25,20,7,3,RelativeCords), relativeUv(21,7,10,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(5.1250,0.1361,-1.3642), vec3(2.4000,2.2750,0.8500), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268), vec3(0,0,0),
        relativeUv(9,28,5,-2,RelativeCords), relativeUv(14,27,5,2,RelativeCords),
        relativeUv(20,22,-5,5,RelativeCords), relativeUv(7,26,2,5,RelativeCords),
        relativeUv(25,22,-5,5,RelativeCords), relativeUv(27,23,-2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_CILIO_SHOES_RIGHT_FEET 1131   // -> bone STASIS_RIGHT_BOOT, 4 box(es)
case CEM_CILIO_SHOES_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,0.0000,-6.6500), vec3(3.4000,1.9500,3.8500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(14,8,7,-8,RelativeCords), relativeUv(14,8,7,8,RelativeCords),
        relativeUv(28,10,-7,4,RelativeCords), relativeUv(21,0,8,4,RelativeCords),
        relativeUv(15,22,-7,4,RelativeCords), relativeUv(8,21,-8,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,-1.3500,-0.6250), vec3(3.5500,1.3750,5.6500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(0,11,7,-11,RelativeCords), relativeUv(7,0,7,11,RelativeCords),
        relativeUv(7,25,-7,3,RelativeCords), relativeUv(14,19,11,3,RelativeCords),
        relativeUv(32,14,-7,3,RelativeCords), relativeUv(25,16,-11,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.3000,-1.3000,-3.3500), vec3(3.4500,1.3500,5.2000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(0,21,7,-10,RelativeCords), relativeUv(7,11,7,10,RelativeCords),
        relativeUv(32,17,-7,3,RelativeCords), relativeUv(21,7,10,3,RelativeCords),
        relativeUv(32,20,-7,3,RelativeCords), relativeUv(31,4,-10,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(5.1000,-0.1361,-1.3642), vec3(2.4000,2.2750,0.8500), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(9,28,5,-2,RelativeCords), relativeUv(14,27,5,2,RelativeCords),
        relativeUv(20,22,-5,5,RelativeCords), relativeUv(7,26,2,5,RelativeCords),
        relativeUv(25,22,-5,5,RelativeCords), relativeUv(27,23,-2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ZEKERN_STARTED  (internal-color 70,0,0) =====
#define CEM_ZEKERN_STARTED_CHESTPLATE 1132   // -> bone STASIS_CHESTPLATE, 9 box(es)
case CEM_ZEKERN_STARTED_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.7750,0.0000,-1.6750), vec3(1.0000,0.5000,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(43,14,2,-7,RelativeCords), relativeUv(41,7,2,7,RelativeCords),
        relativeUv(41,14,2,1,RelativeCords), relativeUv(43,14,7,1,RelativeCords),
        relativeUv(52,14,-2,1,RelativeCords), relativeUv(34,14,7,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5000,4.0000,-7.5000), vec3(1.5000,4.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,23,3,-1,RelativeCords), relativeUv(57,22,3,1,RelativeCords),
        relativeUv(57,23,3,9,RelativeCords), relativeUv(60,23,1,9,RelativeCords),
        relativeUv(64,23,-3,9,RelativeCords), relativeUv(56,23,1,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.4552,-0.0000,-11.1579), vec3(1.0000,1.5000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,6,2,-6,RelativeCords), relativeUv(54,0,2,6,RelativeCords),
        relativeUv(54,6,2,3,RelativeCords), relativeUv(56,6,6,3,RelativeCords),
        relativeUv(64,6,-2,3,RelativeCords), relativeUv(48,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.4552,0.0000,-11.1579), vec3(1.0000,1.5000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,6,2,-6,RelativeCords), relativeUv(54,0,2,6,RelativeCords),
        relativeUv(54,6,2,3,RelativeCords), relativeUv(56,6,6,3,RelativeCords),
        relativeUv(64,6,-2,3,RelativeCords), relativeUv(48,6,6,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.8436,-0.0000,-10.9414), vec3(0.9750,0.9750,2.9750), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(40,6,2,-6,RelativeCords), relativeUv(38,0,2,6,RelativeCords),
        relativeUv(38,6,2,2,RelativeCords), relativeUv(40,6,6,2,RelativeCords),
        relativeUv(48,6,-2,2,RelativeCords), relativeUv(32,6,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.8436,0.0000,-10.9414), vec3(0.9750,0.9750,2.9750), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(40,6,2,-6,RelativeCords), relativeUv(38,0,2,6,RelativeCords),
        relativeUv(38,6,2,2,RelativeCords), relativeUv(40,6,6,2,RelativeCords),
        relativeUv(48,6,-2,2,RelativeCords), relativeUv(32,6,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(1.3500,0.0000,-4.2500), vec3(0.5000,4.5000,3.5000), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(10,7,1,-7,RelativeCords), relativeUv(9,0,1,7,RelativeCords),
        relativeUv(9,7,1,9,RelativeCords), relativeUv(10,7,7,9,RelativeCords),
        relativeUv(18,7,-1,9,RelativeCords), relativeUv(2,7,7,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2510,0.0000,-10.1053), vec3(0.5000,3.0000,3.5000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(26,8,1,-7,RelativeCords), relativeUv(25,1,1,7,RelativeCords),
        relativeUv(25,8,1,6,RelativeCords), relativeUv(26,8,7,6,RelativeCords),
        relativeUv(34,8,-1,6,RelativeCords), relativeUv(18,8,7,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_LEFT_FEET 1133   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_ZEKERN_STARTED_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_RIGHT_FEET 1134   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_ZEKERN_STARTED_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_LEFT_ARM 1135   // -> bone STASIS_LEFT_ARM, 2 box(es)
case CEM_ZEKERN_STARTED_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.2000,0.0000,-9.3000), vec3(0.5000,1.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,0,-1,3,RelativeCords), relativeUv(4,0,-1,3,RelativeCords),
        relativeUv(3,3,1,2,RelativeCords), relativeUv(0,3,3,2,RelativeCords),
        relativeUv(8,3,-1,2,RelativeCords), relativeUv(4,3,3,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_RIGHT_ARM 1136   // -> bone STASIS_RIGHT_ARM, 2 box(es)
case CEM_ZEKERN_STARTED_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.2000,-0.0000,-9.3000), vec3(0.5000,1.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,0,-1,3,RelativeCords), relativeUv(4,0,-1,3,RelativeCords),
        relativeUv(3,3,1,2,RelativeCords), relativeUv(0,3,3,2,RelativeCords),
        relativeUv(8,3,-1,2,RelativeCords), relativeUv(4,3,3,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_INNER_ARMOR 1137   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_ZEKERN_STARTED_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.5000,2.7000,0.0000), vec3(1.5000,2.0000,1.0000), mat3(0.70711,0.70711,0.00000,0.00000,0.00000,-1.00000,-0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(56,9,3,2,RelativeCords), relativeUv(59,9,3,2,RelativeCords),
        relativeUv(56,11,3,4,RelativeCords), relativeUv(54,11,2,4,RelativeCords),
        relativeUv(64,11,-3,4,RelativeCords), relativeUv(59,11,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_LEFT_LEG 1138   // -> bone STASIS_LEFT_LEG, 1 box(es)
case CEM_ZEKERN_STARTED_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_STARTED_RIGHT_LEG 1139   // -> bone STASIS_RIGHT_LEG, 1 box(es)
case CEM_ZEKERN_STARTED_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== TOURNE_FIN_ARMOR  (internal-color 150,0,0) =====
#define CEM_TOURNE_FIN_ARMOR_CHESTPLATE 1140   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_TOURNE_FIN_ARMOR_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.6000,6.6000,2.6000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,16,-8,-4,RelativeCords), relativeUv(8,4,-8,-4,RelativeCords),
        relativeUv(8,4,8,12,RelativeCords), relativeUv(44,4,4,12,RelativeCords),
        relativeUv(0,4,8,12,RelativeCords), relativeUv(44,4,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.4000,6.4000,2.4000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,16,-8,-4,RelativeCords), relativeUv(16,4,-8,-4,RelativeCords),
        relativeUv(16,0,8,12,RelativeCords), relativeUv(32,0,4,12,RelativeCords),
        relativeUv(24,0,8,12,RelativeCords), relativeUv(32,0,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.3000,6.3000,2.3000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,20,-8,-4,RelativeCords), relativeUv(28,20,-8,-4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RIGHT_ARM 1141   // -> bone STASIS_RIGHT_ARM, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3100,6.3100,2.3100), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,16,4,4,RelativeCords), relativeUv(44,20,4,-4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords),
        relativeUv(52,20,4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,4,4,RelativeCords), relativeUv(56,4,4,-4,RelativeCords),
        relativeUv(52,4,4,12,RelativeCords), relativeUv(52,4,-4,12,RelativeCords),
        relativeUv(56,4,4,12,RelativeCords), relativeUv(64,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_LEFT_ARM 1142   // -> bone STASIS_LEFT_ARM, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,4,4,RelativeCords), relativeUv(56,4,4,-4,RelativeCords),
        relativeUv(52,4,4,12,RelativeCords), relativeUv(52,4,-4,12,RelativeCords),
        relativeUv(56,4,4,12,RelativeCords), relativeUv(64,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3100,6.3100,2.3100), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,16,4,4,RelativeCords), relativeUv(44,20,4,-4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords),
        relativeUv(52,20,4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_INNER_ARMOR 1143   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.2800,6.2800,2.2800), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(64,4,-8,-4,RelativeCords), relativeUv(56,4,-8,-4,RelativeCords),
        relativeUv(44,4,8,12,RelativeCords), relativeUv(56,4,-4,12,RelativeCords),
        relativeUv(56,4,8,12,RelativeCords), relativeUv(56,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RIGHT_LEG 1144   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,4,-4,-4,RelativeCords), relativeUv(24,0,-4,4,RelativeCords),
        relativeUv(12,4,4,12,RelativeCords), relativeUv(20,4,-4,12,RelativeCords),
        relativeUv(20,4,4,12,RelativeCords), relativeUv(12,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.2900,6.2900,2.2900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(0,20,4,12,RelativeCords), relativeUv(8,20,-4,12,RelativeCords),
        relativeUv(8,20,4,12,RelativeCords), relativeUv(16,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_LEFT_LEG 1145   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.2900,6.2900,2.2900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,-4,12,RelativeCords), relativeUv(16,20,-4,12,RelativeCords),
        relativeUv(12,20,-4,12,RelativeCords), relativeUv(8,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(16,4,4,-4,RelativeCords), relativeUv(20,0,4,4,RelativeCords),
        relativeUv(16,4,-4,12,RelativeCords), relativeUv(12,4,-4,12,RelativeCords),
        relativeUv(24,4,-4,12,RelativeCords), relativeUv(20,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== TOURNE_FIN_ARMOR_RED  (internal-color 150,0,1) =====
#define CEM_TOURNE_FIN_ARMOR_RED_CHESTPLATE 1146   // -> bone STASIS_CHESTPLATE, 3 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.6000,6.6000,2.6000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,16,-8,-4,RelativeCords), relativeUv(8,4,-8,-4,RelativeCords),
        relativeUv(8,4,8,12,RelativeCords), relativeUv(44,4,4,12,RelativeCords),
        relativeUv(0,4,8,12,RelativeCords), relativeUv(44,4,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.4000,6.4000,2.4000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,16,-8,-4,RelativeCords), relativeUv(16,4,-8,-4,RelativeCords),
        relativeUv(16,0,8,12,RelativeCords), relativeUv(32,0,4,12,RelativeCords),
        relativeUv(24,0,8,12,RelativeCords), relativeUv(32,0,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.3000,6.3000,2.3000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,20,-8,-4,RelativeCords), relativeUv(28,20,-8,-4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(32,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RED_RIGHT_ARM 1147   // -> bone STASIS_RIGHT_ARM, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3100,6.3100,2.3100), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,16,4,4,RelativeCords), relativeUv(44,20,4,-4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords),
        relativeUv(52,20,4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,4,4,RelativeCords), relativeUv(56,4,4,-4,RelativeCords),
        relativeUv(52,4,4,12,RelativeCords), relativeUv(52,4,-4,12,RelativeCords),
        relativeUv(56,4,4,12,RelativeCords), relativeUv(64,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RED_LEFT_ARM 1148   // -> bone STASIS_LEFT_ARM, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(60,0,4,4,RelativeCords), relativeUv(56,4,4,-4,RelativeCords),
        relativeUv(52,4,4,12,RelativeCords), relativeUv(52,4,-4,12,RelativeCords),
        relativeUv(56,4,4,12,RelativeCords), relativeUv(64,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.3100,6.3100,2.3100), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(48,16,4,4,RelativeCords), relativeUv(44,20,4,-4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords),
        relativeUv(52,20,4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RED_INNER_ARMOR 1149   // -> bone STASIS_INNER_ARMOR, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.2800,6.2800,2.2800), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(64,4,-8,-4,RelativeCords), relativeUv(56,4,-8,-4,RelativeCords),
        relativeUv(44,4,8,12,RelativeCords), relativeUv(56,4,-4,12,RelativeCords),
        relativeUv(56,4,8,12,RelativeCords), relativeUv(56,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RED_RIGHT_LEG 1150   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,4,-4,-4,RelativeCords), relativeUv(24,0,-4,4,RelativeCords),
        relativeUv(12,4,4,12,RelativeCords), relativeUv(20,4,-4,12,RelativeCords),
        relativeUv(20,4,4,12,RelativeCords), relativeUv(12,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.2900,6.2900,2.2900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords),
        relativeUv(0,20,4,12,RelativeCords), relativeUv(8,20,-4,12,RelativeCords),
        relativeUv(8,20,4,12,RelativeCords), relativeUv(16,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TOURNE_FIN_ARMOR_RED_LEFT_LEG 1151   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_TOURNE_FIN_ARMOR_RED_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.2900,6.2900,2.2900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,-4,12,RelativeCords), relativeUv(16,20,-4,12,RelativeCords),
        relativeUv(12,20,-4,12,RelativeCords), relativeUv(8,20,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.3900,6.3900,2.3900), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(16,4,4,-4,RelativeCords), relativeUv(20,0,4,4,RelativeCords),
        relativeUv(16,4,-4,12,RelativeCords), relativeUv(12,4,-4,12,RelativeCords),
        relativeUv(24,4,-4,12,RelativeCords), relativeUv(20,4,-4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== TUGKAN_SCULK  (internal-color 176,0,0) =====
#define CEM_TUGKAN_SCULK_CHESTPLATE 1152   // -> bone STASIS_CHESTPLATE, 8 box(es)
case CEM_TUGKAN_SCULK_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-7.0000), vec3(4.3000,5.3000,2.3000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,22,8,-4,RelativeCords), relativeUv(44,18,8,4,RelativeCords),
        relativeUv(44,22,8,10,RelativeCords), relativeUv(52,22,4,10,RelativeCords),
        relativeUv(64,22,-8,10,RelativeCords), relativeUv(40,22,4,10,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.0000,4.8000,-10.0000), vec3(1.0000,2.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,28,2,-3,RelativeCords), relativeUv(3,25,2,3,RelativeCords),
        relativeUv(3,28,2,4,RelativeCords), relativeUv(5,28,3,4,RelativeCords),
        relativeUv(10,28,-2,4,RelativeCords), relativeUv(0,28,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,2.3000,-7.8000), vec3(0.5000,6.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(15,3,1,-3,RelativeCords), relativeUv(14,0,1,3,RelativeCords),
        relativeUv(14,3,1,12,RelativeCords), relativeUv(15,3,3,12,RelativeCords),
        relativeUv(19,3,-1,12,RelativeCords), relativeUv(11,3,3,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,4.8000,-10.0000), vec3(1.0000,2.0000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(5,28,2,-3,RelativeCords), relativeUv(3,25,2,3,RelativeCords),
        relativeUv(3,28,2,4,RelativeCords), relativeUv(5,28,3,4,RelativeCords),
        relativeUv(10,28,-2,4,RelativeCords), relativeUv(0,28,3,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.0000,3.1158,-3.7763), vec3(2.0000,3.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(6,19,4,-2,RelativeCords), relativeUv(2,17,4,2,RelativeCords),
        relativeUv(2,19,4,6,RelativeCords), relativeUv(6,19,2,6,RelativeCords),
        relativeUv(12,19,-4,6,RelativeCords), relativeUv(0,19,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,3.1158,-3.7763), vec3(2.0000,3.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(6,19,4,-2,RelativeCords), relativeUv(2,17,4,2,RelativeCords),
        relativeUv(2,19,4,6,RelativeCords), relativeUv(6,19,2,6,RelativeCords),
        relativeUv(12,19,-4,6,RelativeCords), relativeUv(0,19,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.0000,2.3000,-10.0000), vec3(2.0000,3.0000,1.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,21,4,-2,RelativeCords), relativeUv(14,19,4,2,RelativeCords),
        relativeUv(14,21,4,6,RelativeCords), relativeUv(18,21,2,6,RelativeCords),
        relativeUv(24,21,-4,6,RelativeCords), relativeUv(12,21,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.0000,2.3000,-10.0000), vec3(2.0000,3.0000,1.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,21,4,-2,RelativeCords), relativeUv(14,19,4,2,RelativeCords),
        relativeUv(14,21,4,6,RelativeCords), relativeUv(18,21,2,6,RelativeCords),
        relativeUv(24,21,-4,6,RelativeCords), relativeUv(12,21,2,6,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_SCULK_RIGHT_ARM 1153   // -> bone STASIS_RIGHT_ARM, 4 box(es)
case CEM_TUGKAN_SCULK_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-9.5000), vec3(2.2750,4.7750,2.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,19,-4,4,RelativeCords), relativeUv(32,19,-4,4,RelativeCords),
        relativeUv(28,23,4,9,RelativeCords), relativeUv(24,23,4,9,RelativeCords),
        relativeUv(40,23,-4,9,RelativeCords), relativeUv(32,23,4,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6173,0.0000,-6.4239), vec3(1.0000,2.0000,2.5000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(35,10,-2,5,RelativeCords), relativeUv(33,10,-2,5,RelativeCords),
        relativeUv(31,15,2,4,RelativeCords), relativeUv(26,15,5,4,RelativeCords),
        relativeUv(40,15,-2,4,RelativeCords), relativeUv(33,15,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,2.0793,-9.1152), vec3(1.0000,2.0000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268), vec3(0,0,0),
        relativeUv(44,8,-2,2,RelativeCords), relativeUv(42,8,-2,2,RelativeCords),
        relativeUv(40,10,2,4,RelativeCords), relativeUv(38,10,2,4,RelativeCords),
        relativeUv(46,10,-2,4,RelativeCords), relativeUv(42,10,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2294,-0.0000,-13.6533), vec3(3.0000,2.0000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(58,8,-6,6,RelativeCords), relativeUv(52,8,-6,6,RelativeCords),
        relativeUv(46,14,6,4,RelativeCords), relativeUv(40,14,6,4,RelativeCords),
        relativeUv(64,14,-6,4,RelativeCords), relativeUv(52,14,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_TUGKAN_SCULK_LEFT_ARM 1154   // -> bone STASIS_LEFT_ARM, 4 box(es)
case CEM_TUGKAN_SCULK_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-9.5000), vec3(2.2750,4.7750,2.2750), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(36,19,-4,4,RelativeCords), relativeUv(32,19,-4,4,RelativeCords),
        relativeUv(28,23,4,9,RelativeCords), relativeUv(24,23,4,9,RelativeCords),
        relativeUv(40,23,-4,9,RelativeCords), relativeUv(32,23,4,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.2294,-0.0000,-13.6533), vec3(3.0000,2.0000,3.0000), mat3(0.00000,-0.38268,0.92388,0.00000,-0.92388,-0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(58,8,-6,6,RelativeCords), relativeUv(52,8,-6,6,RelativeCords),
        relativeUv(46,14,6,4,RelativeCords), relativeUv(40,14,6,4,RelativeCords),
        relativeUv(64,14,-6,4,RelativeCords), relativeUv(52,14,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6173,0.0000,-6.4239), vec3(1.0000,2.0000,2.5000), mat3(0.00000,0.38268,0.92388,0.00000,-0.92388,0.38268,1.00000,0.00000,-0.00000), vec3(0,0,0),
        relativeUv(35,10,-2,5,RelativeCords), relativeUv(33,10,-2,5,RelativeCords),
        relativeUv(31,15,2,4,RelativeCords), relativeUv(26,15,5,4,RelativeCords),
        relativeUv(40,15,-2,4,RelativeCords), relativeUv(33,15,5,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,-2.0793,-9.1152), vec3(1.0000,2.0000,1.0000), mat3(0.00000,0.00000,1.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268,-0.00000), vec3(0,0,0),
        relativeUv(44,8,-2,2,RelativeCords), relativeUv(42,8,-2,2,RelativeCords),
        relativeUv(40,10,2,4,RelativeCords), relativeUv(38,10,2,4,RelativeCords),
        relativeUv(46,10,-2,4,RelativeCords), relativeUv(42,10,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== FROST_WARDEN_ARMOR  (internal-color 0,0,186) =====
#define CEM_FROST_WARDEN_ARMOR_CHESTPLATE 1155   // -> bone STASIS_CHESTPLATE, 2 box(es)
case CEM_FROST_WARDEN_ARMOR_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-0.5000,-8.5000), vec3(4.0000,4.5000,3.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(37,7,8,-7,RelativeCords), relativeUv(29,0,8,7,RelativeCords),
        relativeUv(29,7,8,9,RelativeCords), relativeUv(37,7,7,9,RelativeCords),
        relativeUv(52,7,-8,9,RelativeCords), relativeUv(22,7,7,9,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_LEFT_FEET 1156   // -> bone STASIS_LEFT_BOOT, 1 box(es)
case CEM_FROST_WARDEN_ARMOR_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_RIGHT_FEET 1157   // -> bone STASIS_RIGHT_BOOT, 1 box(es)
case CEM_FROST_WARDEN_ARMOR_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_LEFT_ARM 1158   // -> bone STASIS_LEFT_ARM, 3 box(es)
case CEM_FROST_WARDEN_ARMOR_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7500,0.0000,-13.5000), vec3(1.0000,2.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,0,-2,2,RelativeCords), relativeUv(60,0,-2,2,RelativeCords),
        relativeUv(58,2,2,5,RelativeCords), relativeUv(56,2,2,5,RelativeCords),
        relativeUv(64,2,-2,5,RelativeCords), relativeUv(60,2,2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2500,0.0000,-11.5000), vec3(2.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(16,3,-5,6,RelativeCords), relativeUv(11,3,-5,6,RelativeCords),
        relativeUv(6,9,5,7,RelativeCords), relativeUv(0,9,6,7,RelativeCords),
        relativeUv(22,9,-5,7,RelativeCords), relativeUv(11,9,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_RIGHT_ARM 1159   // -> bone STASIS_RIGHT_ARM, 3 box(es)
case CEM_FROST_WARDEN_ARMOR_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.2500,-0.0000,-11.5000), vec3(2.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(16,3,-5,6,RelativeCords), relativeUv(11,3,-5,6,RelativeCords),
        relativeUv(6,9,5,7,RelativeCords), relativeUv(0,9,6,7,RelativeCords),
        relativeUv(22,9,-5,7,RelativeCords), relativeUv(11,9,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.7500,-0.0000,-13.5000), vec3(1.0000,2.5000,1.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(62,0,-2,2,RelativeCords), relativeUv(60,0,-2,2,RelativeCords),
        relativeUv(58,2,2,5,RelativeCords), relativeUv(56,2,2,5,RelativeCords),
        relativeUv(64,2,-2,5,RelativeCords), relativeUv(60,2,2,5,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_INNER_ARMOR 1160   // -> bone STASIS_INNER_ARMOR, 1 box(es)
case CEM_FROST_WARDEN_ARMOR_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_LEFT_LEG 1161   // -> bone STASIS_LEFT_LEG, 3 box(es)
case CEM_FROST_WARDEN_ARMOR_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1000,0.0000,-7.0000), vec3(2.0000,4.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,13,4,0,RelativeCords), relativeUv(60,13,4,0,RelativeCords),
        relativeUv(56,13,4,8,RelativeCords), relativeUv(56,13,0,8,RelativeCords),
        relativeUv(64,13,-4,8,RelativeCords), relativeUv(60,13,0,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6000,0.0000,-7.5000), vec3(1.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,0,3,6,RelativeCords), relativeUv(53,0,3,6,RelativeCords),
        relativeUv(50,6,3,7,RelativeCords), relativeUv(44,6,6,7,RelativeCords),
        relativeUv(62,6,-3,7,RelativeCords), relativeUv(53,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_FROST_WARDEN_ARMOR_RIGHT_LEG 1162   // -> bone STASIS_RIGHT_LEG, 3 box(es)
case CEM_FROST_WARDEN_ARMOR_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-5.1000,-0.0000,-7.0000), vec3(2.0000,4.0000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(56,13,4,0,RelativeCords), relativeUv(60,13,4,0,RelativeCords),
        relativeUv(56,13,4,8,RelativeCords), relativeUv(56,13,0,8,RelativeCords),
        relativeUv(64,13,-4,8,RelativeCords), relativeUv(60,13,0,8,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6000,0.0000,-7.5000), vec3(1.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(50,0,3,6,RelativeCords), relativeUv(53,0,3,6,RelativeCords),
        relativeUv(50,6,3,7,RelativeCords), relativeUv(44,6,6,7,RelativeCords),
        relativeUv(62,6,-3,7,RelativeCords), relativeUv(53,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


// ===== ZEKERN_WOLF_PET  (internal-color 74,0,0) =====
#define CEM_ZEKERN_WOLF_PET_CHESTPLATE 1163   // -> bone STASIS_CHESTPLATE, 12 box(es)
case CEM_ZEKERN_WOLF_PET_CHESTPLATE: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(28,20,8,-4,RelativeCords), relativeUv(20,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.5000,-1.0000,-9.5000), vec3(1.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(55,6,3,-6,RelativeCords), relativeUv(52,0,3,6,RelativeCords),
        relativeUv(52,6,3,7,RelativeCords), relativeUv(55,6,6,7,RelativeCords),
        relativeUv(64,6,-3,7,RelativeCords), relativeUv(46,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.5000,-1.0000,-9.5000), vec3(1.5000,3.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(55,6,3,-6,RelativeCords), relativeUv(52,0,3,6,RelativeCords),
        relativeUv(52,6,3,7,RelativeCords), relativeUv(55,6,6,7,RelativeCords),
        relativeUv(64,6,-3,7,RelativeCords), relativeUv(46,6,6,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,2.5462,-11.5635), vec3(5.0000,1.5000,1.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(13,3,10,-3,RelativeCords), relativeUv(3,0,10,3,RelativeCords),
        relativeUv(3,3,10,3,RelativeCords), relativeUv(13,3,3,3,RelativeCords),
        relativeUv(26,3,-10,3,RelativeCords), relativeUv(0,3,3,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,5.3462,-13.7611), vec3(6.0000,1.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268), vec3(0,0,0),
        relativeUv(52,13,12,-0,RelativeCords), relativeUv(40,13,12,0,RelativeCords),
        relativeUv(40,13,12,3,RelativeCords), relativeUv(52,13,0,3,RelativeCords),
        relativeUv(64,13,-12,3,RelativeCords), relativeUv(40,13,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.1000,-4.5000,-10.5000), vec3(1.5000,3.5000,0.0000), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(43,0,3,-0,RelativeCords), relativeUv(40,0,3,0,RelativeCords),
        relativeUv(40,0,3,7,RelativeCords), relativeUv(43,0,0,7,RelativeCords),
        relativeUv(46,0,-3,7,RelativeCords), relativeUv(40,0,0,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.1000,-4.5000,-10.5000), vec3(1.5000,3.5000,0.0000), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(43,0,3,-0,RelativeCords), relativeUv(40,0,3,0,RelativeCords),
        relativeUv(40,0,3,7,RelativeCords), relativeUv(43,0,0,7,RelativeCords),
        relativeUv(46,0,-3,7,RelativeCords), relativeUv(40,0,0,7,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.4761,-1.3536,-14.7464), vec3(1.5000,0.0000,3.0000), mat3(0.70711,0.27060,-0.65328,-0.70711,0.27060,-0.65328,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(61,6,3,-6,RelativeCords), relativeUv(58,0,3,6,RelativeCords),
        relativeUv(58,6,3,0,RelativeCords), relativeUv(61,6,6,0,RelativeCords),
        relativeUv(70,6,-3,0,RelativeCords), relativeUv(52,6,6,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.4761,-1.3536,-14.7464), vec3(1.5000,0.0000,3.0000), mat3(0.70711,-0.27060,0.65328,0.70711,0.27060,-0.65328,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(61,6,3,-6,RelativeCords), relativeUv(58,0,3,6,RelativeCords),
        relativeUv(58,6,3,0,RelativeCords), relativeUv(61,6,6,0,RelativeCords),
        relativeUv(70,6,-3,0,RelativeCords), relativeUv(52,6,6,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-3.2371,0.8240,-13.0785), vec3(2.5000,0.0000,2.0000), mat3(0.70711,-0.27060,0.65328,0.65328,0.60355,-0.45711,-0.27060,0.75000,0.60355), vec3(0,0,0),
        relativeUv(35,4,5,-4,RelativeCords), relativeUv(30,0,5,4,RelativeCords),
        relativeUv(30,4,5,0,RelativeCords), relativeUv(35,4,4,0,RelativeCords),
        relativeUv(44,4,-5,0,RelativeCords), relativeUv(26,4,4,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.4000,-1.0000,-14.6000), vec3(1.5000,0.0000,3.0000), mat3(0.70711,0.27060,-0.65328,-0.70711,0.27060,-0.65328,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(61,6,3,-6,RelativeCords), relativeUv(58,0,3,6,RelativeCords),
        relativeUv(58,6,3,0,RelativeCords), relativeUv(61,6,6,0,RelativeCords),
        relativeUv(70,6,-3,0,RelativeCords), relativeUv(52,6,6,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(3.2371,0.8240,-13.0785), vec3(2.5000,0.0000,2.0000), mat3(0.70711,0.27060,-0.65328,-0.65328,0.60355,-0.45711,0.27060,0.75000,0.60355), vec3(0,0,0),
        relativeUv(35,4,5,-4,RelativeCords), relativeUv(30,0,5,4,RelativeCords),
        relativeUv(30,4,5,0,RelativeCords), relativeUv(35,4,4,0,RelativeCords),
        relativeUv(44,4,-5,0,RelativeCords), relativeUv(26,4,4,0,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_LEFT_FEET 1164   // -> bone STASIS_LEFT_BOOT, 8 box(es)
case CEM_ZEKERN_WOLF_PET_LEFT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.9500,6.9500,2.9500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-5.4000), vec3(3.1000,0.6000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,9,6,6,RelativeCords), relativeUv(17,9,6,6,RelativeCords),
        relativeUv(11,15,6,1,RelativeCords), relativeUv(5,15,6,1,RelativeCords),
        relativeUv(29,15,-6,1,RelativeCords), relativeUv(17,15,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(3.1000,0.6000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,9,6,6,RelativeCords), relativeUv(17,9,6,6,RelativeCords),
        relativeUv(11,15,6,1,RelativeCords), relativeUv(5,15,6,1,RelativeCords),
        relativeUv(29,15,-6,1,RelativeCords), relativeUv(17,15,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,3.2000,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4209,-3.4291,-1.1250), vec3(0.0000,2.0000,1.0000), mat3(0.70711,0.70711,-0.00000,0.00000,0.00000,1.00000,0.70711,-0.70711,0.00000), vec3(0,0,0),
        relativeUv(2,4,0,2,RelativeCords), relativeUv(2,4,0,2,RelativeCords),
        relativeUv(2,6,0,4,RelativeCords), relativeUv(0,6,2,4,RelativeCords),
        relativeUv(4,6,-0,4,RelativeCords), relativeUv(2,6,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.4084,2.9621,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(0.92388,0.38268,-0.00000,0.00000,0.00000,1.00000,0.38268,-0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6084,2.9621,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(0.92388,-0.38268,0.00000,0.00000,0.00000,1.00000,-0.38268,-0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,3.2000,-5.4500), vec3(1.0000,1.0000,0.5000), mat3(0.70711,-0.00000,-0.70711,0.70711,0.00000,0.70711,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,6,2,1,RelativeCords), relativeUv(20,6,2,1,RelativeCords),
        relativeUv(18,7,2,2,RelativeCords), relativeUv(17,7,1,2,RelativeCords),
        relativeUv(23,7,-2,2,RelativeCords), relativeUv(20,7,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_RIGHT_FEET 1165   // -> bone STASIS_RIGHT_BOOT, 8 box(es)
case CEM_ZEKERN_WOLF_PET_RIGHT_FEET: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.9500,6.9500,2.9500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2000,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-5.4000), vec3(3.1000,0.6000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,9,6,6,RelativeCords), relativeUv(17,9,6,6,RelativeCords),
        relativeUv(11,15,6,1,RelativeCords), relativeUv(5,15,6,1,RelativeCords),
        relativeUv(29,15,-6,1,RelativeCords), relativeUv(17,15,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-2.5000), vec3(3.1000,0.6000,3.1000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(11,9,6,6,RelativeCords), relativeUv(17,9,6,6,RelativeCords),
        relativeUv(11,15,6,1,RelativeCords), relativeUv(5,15,6,1,RelativeCords),
        relativeUv(29,15,-6,1,RelativeCords), relativeUv(17,15,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.6084,-2.9621,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(0.92388,-0.38268,-0.00000,0.00000,0.00000,-1.00000,0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(2.4084,-2.9621,-0.9500), vec3(0.5000,1.5000,0.5000), mat3(0.92388,0.38268,0.00000,0.00000,0.00000,-1.00000,-0.38268,0.92388,0.00000), vec3(0,0,0),
        relativeUv(24,6,1,1,RelativeCords), relativeUv(25,6,1,1,RelativeCords),
        relativeUv(24,7,1,3,RelativeCords), relativeUv(23,7,1,3,RelativeCords),
        relativeUv(27,7,-1,3,RelativeCords), relativeUv(25,7,1,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.2000,-5.4500), vec3(1.0000,1.0000,0.5000), mat3(0.70711,0.00000,-0.70711,-0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(18,6,2,1,RelativeCords), relativeUv(20,6,2,1,RelativeCords),
        relativeUv(18,7,2,2,RelativeCords), relativeUv(17,7,1,2,RelativeCords),
        relativeUv(23,7,-2,2,RelativeCords), relativeUv(20,7,1,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.4209,3.4291,-1.1250), vec3(0.0000,2.0000,1.0000), mat3(0.70711,0.70711,0.00000,0.00000,0.00000,-1.00000,-0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(2,4,0,2,RelativeCords), relativeUv(2,4,0,2,RelativeCords),
        relativeUv(2,6,0,4,RelativeCords), relativeUv(0,6,2,4,RelativeCords),
        relativeUv(4,6,-0,4,RelativeCords), relativeUv(2,6,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_LEFT_ARM 1166   // -> bone STASIS_LEFT_ARM, 3 box(es)
case CEM_ZEKERN_WOLF_PET_LEFT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.4500,3.4500,-5.0000), vec3(0.0000,2.0000,1.0000), mat3(-0.70711,-0.00000,0.70711,0.00000,-1.00000,-0.00000,0.70711,0.00000,0.70711), vec3(0,0,0),
        relativeUv(34,8,-0,2,RelativeCords), relativeUv(34,10,-0,-2,RelativeCords),
        relativeUv(34,10,0,4,RelativeCords), relativeUv(34,10,2,4,RelativeCords),
        relativeUv(36,10,0,4,RelativeCords), relativeUv(34,10,-2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.4500,-3.4500,-5.0000), vec3(0.0000,2.0000,1.0000), mat3(0.70711,0.00000,0.70711,0.00000,-1.00000,-0.00000,0.70711,0.00000,-0.70711), vec3(0,0,0),
        relativeUv(34,10,-0,-2,RelativeCords), relativeUv(34,8,-0,2,RelativeCords),
        relativeUv(36,10,0,4,RelativeCords), relativeUv(36,10,-2,4,RelativeCords),
        relativeUv(34,10,0,4,RelativeCords), relativeUv(32,10,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_RIGHT_ARM 1167   // -> bone STASIS_RIGHT_ARM, 3 box(es)
case CEM_ZEKERN_WOLF_PET_RIGHT_ARM: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.0000,0.0000,-8.0000), vec3(2.7500,6.7500,2.7500), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(52,16,-4,4,RelativeCords), relativeUv(48,16,-4,4,RelativeCords),
        relativeUv(44,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords),
        relativeUv(56,20,-4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.4500,-3.4500,-5.0000), vec3(0.0000,2.0000,1.0000), mat3(0.70711,0.70711,0.00000,0.00000,0.00000,-1.00000,-0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(34,8,-0,2,RelativeCords), relativeUv(34,10,-0,-2,RelativeCords),
        relativeUv(34,10,0,4,RelativeCords), relativeUv(34,10,-2,4,RelativeCords),
        relativeUv(36,10,0,4,RelativeCords), relativeUv(34,10,2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.4500,3.4500,-5.0000), vec3(0.0000,2.0000,1.0000), mat3(0.70711,-0.70711,-0.00000,0.00000,0.00000,-1.00000,0.70711,0.70711,0.00000), vec3(0,0,0),
        relativeUv(34,10,-0,-2,RelativeCords), relativeUv(34,8,-0,2,RelativeCords),
        relativeUv(36,10,0,4,RelativeCords), relativeUv(32,10,2,4,RelativeCords),
        relativeUv(34,10,0,4,RelativeCords), relativeUv(36,10,-2,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_INNER_ARMOR 1168   // -> bone STASIS_INNER_ARMOR, 8 box(es)
case CEM_ZEKERN_WOLF_PET_INNER_ARMOR: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(4.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords),
        relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords),
        relativeUv(40,20,-8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-5.0000), vec3(5.0000,0.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,10,6,RelativeCords), relativeUv(16,0,10,6,RelativeCords),
        relativeUv(6,6,10,1,RelativeCords), relativeUv(0,6,6,1,RelativeCords),
        relativeUv(32,6,-10,1,RelativeCords), relativeUv(16,6,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-1.0000), vec3(5.0000,0.5000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(6,0,10,6,RelativeCords), relativeUv(16,0,10,6,RelativeCords),
        relativeUv(6,6,10,1,RelativeCords), relativeUv(0,6,6,1,RelativeCords),
        relativeUv(32,6,-10,1,RelativeCords), relativeUv(16,6,6,1,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.2000,-2.6000,-3.2000), vec3(1.5000,1.5000,1.0000), mat3(0.70711,-0.00000,0.70711,0.70711,0.00000,-0.70711,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(53,27,3,2,RelativeCords), relativeUv(56,27,3,2,RelativeCords),
        relativeUv(53,29,3,3,RelativeCords), relativeUv(51,29,2,3,RelativeCords),
        relativeUv(61,29,-3,3,RelativeCords), relativeUv(56,29,2,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-4.4709,0.0000,-6.7774), vec3(0.0000,1.0000,3.0000), mat3(0.92388,0.00000,-0.38268,-0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(32,-6,0,6,RelativeCords), relativeUv(32,-6,0,6,RelativeCords),
        relativeUv(32,0,0,2,RelativeCords), relativeUv(26,0,6,2,RelativeCords),
        relativeUv(38,0,-0,2,RelativeCords), relativeUv(32,0,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(4.4709,0.0000,-6.7774), vec3(0.0000,1.0000,3.0000), mat3(0.92388,-0.00000,0.38268,0.38268,0.00000,-0.92388,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(32,-6,0,6,RelativeCords), relativeUv(32,-6,0,6,RelativeCords),
        relativeUv(32,0,0,2,RelativeCords), relativeUv(26,0,6,2,RelativeCords),
        relativeUv(38,0,-0,2,RelativeCords), relativeUv(32,0,6,2,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0.0000,-3.3536,-7.0536), vec3(5.0000,1.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.38268,-0.92388,0.00000,0.92388,0.38268), vec3(0,0,0),
        relativeUv(44,0,10,0,RelativeCords), relativeUv(54,0,10,0,RelativeCords),
        relativeUv(44,0,10,3,RelativeCords), relativeUv(44,0,0,3,RelativeCords),
        relativeUv(64,0,-10,3,RelativeCords), relativeUv(54,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,3.3536,-7.0536), vec3(5.0000,1.5000,0.0000), mat3(1.00000,0.00000,0.00000,0.00000,-0.38268,-0.92388,0.00000,0.92388,-0.38268), vec3(0,0,0),
        relativeUv(44,0,10,0,RelativeCords), relativeUv(54,0,10,0,RelativeCords),
        relativeUv(44,0,10,3,RelativeCords), relativeUv(44,0,0,3,RelativeCords),
        relativeUv(64,0,-10,3,RelativeCords), relativeUv(54,0,0,3,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_LEFT_LEG 1169   // -> bone STASIS_LEFT_LEG, 2 box(es)
case CEM_ZEKERN_WOLF_PET_LEFT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-9.0000), vec3(1.5000,2.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,1.00000,0.00000,-1.00000,0.00000), vec3(0,0,0),
        relativeUv(33,6,3,6,RelativeCords), relativeUv(36,6,3,6,RelativeCords),
        relativeUv(33,12,3,4,RelativeCords), relativeUv(27,12,6,4,RelativeCords),
        relativeUv(45,12,-3,4,RelativeCords), relativeUv(36,12,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}

#define CEM_ZEKERN_WOLF_PET_RIGHT_LEG 1170   // -> bone STASIS_RIGHT_LEG, 2 box(es)
case CEM_ZEKERN_WOLF_PET_RIGHT_LEG: {
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1.5000,0.0000,-9.0000), vec3(1.5000,2.0000,3.0000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(33,6,3,6,RelativeCords), relativeUv(36,6,3,6,RelativeCords),
        relativeUv(33,12,3,4,RelativeCords), relativeUv(27,12,6,4,RelativeCords),
        relativeUv(45,12,-3,4,RelativeCords), relativeUv(36,12,6,4,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.0000,0.0000,-6.0000), vec3(2.5000,6.5000,2.5000), mat3(1.00000,0.00000,0.00000,0.00000,0.00000,-1.00000,0.00000,1.00000,0.00000), vec3(0,0,0),
        relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords),
        relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords),
        relativeUv(16,20,-4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords),
        2, 2,
        2, 2,
        2, 2);
    break;
}


