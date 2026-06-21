
#ifdef FSH    
    case ZEKERN_SENTINEL_CHESTPLATE: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(7.5,0,-18), vec3(0.5,3,3)*1.5,   // Pos, Size
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(14,12,-2,-12,RelativeCords), relativeUv(16,0,-2,12,RelativeCords), // up down
       relativeUv(12,12,2,12,RelativeCords), relativeUv(14,12,12,12,RelativeCords), // north west
       relativeUv(26,12,2,12,RelativeCords), relativeUv(0,12,12,12,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2)
       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-7.5,0,-18), vec3(0.5,3,3)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(12,12,2,-12,RelativeCords), relativeUv(14,0,2,12,RelativeCords), // up down
       relativeUv(14,12,-2,12,RelativeCords), relativeUv(12,12,-12,12,RelativeCords), // north west
       relativeUv(28,12,-2,12,RelativeCords), relativeUv(26,12,-12,12,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-2.5,-15.5), vec3(2,2,2)*1.5,   // Pos, Size
       PIX*PIZ25*NIX25, vec3(0, 0, 0),
       relativeUv(112,8,-8,-8,RelativeCords), relativeUv(120,0,-8,8,RelativeCords), // up down
       relativeUv(104,8,8,8,RelativeCords), relativeUv(120,8,-8,8,RelativeCords), // north west
       relativeUv(128,8,-8,8,RelativeCords), relativeUv(96,8,8,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_SENTINEL_LEFT_ARM: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2,0,-16.5), vec3(1.5,2.5,3)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(82,22,-6,-12,RelativeCords), relativeUv(88,10,-6,12,RelativeCords), // up down
       relativeUv(82,22,-6,10,RelativeCords), relativeUv(94,22,-12,10,RelativeCords), // north west
       relativeUv(100,22,-6,10,RelativeCords), relativeUv(76,22,-12,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(40,12,12,-12,RelativeCords), relativeUv(52,0,12,12,RelativeCords), // up down
       relativeUv(52,12,-12,2,RelativeCords), relativeUv(40,12,-12,2,RelativeCords), // north west
       relativeUv(76,12,-12,2,RelativeCords), relativeUv(64,12,-12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5,0,-8), vec3(0.5,2,1)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(32,4,2,-4,RelativeCords), relativeUv(34,0,2,4,RelativeCords), // up down
       relativeUv(32,4,2,8,RelativeCords), relativeUv(28,4,4,8,RelativeCords), // north west
       relativeUv(38,4,2,8,RelativeCords), relativeUv(34,4,4,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_SENTINEL_RIGHT_ARM: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2,0,-16.5), vec3(1.5,2.5,3)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(82,22,-6,-12,RelativeCords), relativeUv(88,10,-6,12,RelativeCords), // up down
       relativeUv(82,22,-6,10,RelativeCords), relativeUv(94,22,-12,10,RelativeCords), // north west
       relativeUv(100,22,-6,10,RelativeCords), relativeUv(76,22,-12,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(40,12,12,-12,RelativeCords), relativeUv(52,0,12,12,RelativeCords), // up down
       relativeUv(52,12,-12,2,RelativeCords), relativeUv(40,12,-12,2,RelativeCords), // north west
       relativeUv(76,12,-12,2,RelativeCords), relativeUv(64,12,-12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5,0,-8), vec3(0.5,2,1)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(32,4,2,-4,RelativeCords), relativeUv(34,0,2,4,RelativeCords), // up down
       relativeUv(32,4,2,8,RelativeCords), relativeUv(28,4,4,8,RelativeCords), // north west
       relativeUv(38,4,2,8,RelativeCords), relativeUv(34,4,4,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_SENTINEL_INNER_ARMOR: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-4,-0.5), vec3(1.5,3.5,0.5)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(8,2,-6,-2,RelativeCords), relativeUv(14,0,-6,2,RelativeCords), // up down
       relativeUv(2,2,6,14,RelativeCords), relativeUv(8,2,2,14,RelativeCords), // north west
       relativeUv(10,2,6,14,RelativeCords), relativeUv(0,2,2,14,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-4,4.6), vec3(1.5,1.5,0.5)*1.5,   // Pos, Size
       PIX*NIY25, vec3(0, 0, 0),
       relativeUv(120,2,-6,-2,RelativeCords), relativeUv(126,0,-6,2,RelativeCords), // up down
       relativeUv(114,2,6,6,RelativeCords), relativeUv(120,2,2,6,RelativeCords), // north west
       relativeUv(122,2,6,6,RelativeCords), relativeUv(112,2,2,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_SENTINEL_LEFT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4.75,0,-14), vec3(1,2,2)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(56,8,-4,-8,RelativeCords), relativeUv(60,0,-4,8,RelativeCords), // up down
       relativeUv(68,8,-4,8,RelativeCords), relativeUv(64,8,-8,8,RelativeCords), // north west
       relativeUv(52,8,4,8,RelativeCords), relativeUv(52,8,-8,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_SENTINEL_RIGHT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4.75,0,-14), vec3(1,2,2)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(56,8,-4,-8,RelativeCords), relativeUv(60,0,-4,8,RelativeCords), // up down
       relativeUv(52,8,4,8,RelativeCords), relativeUv(56,8,8,8,RelativeCords), // north west
       relativeUv(68,8,-4,8,RelativeCords), relativeUv(44,8,8,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

#endif
#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    
    
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ZEKERN_SENTINEL_CHESTPLATE);
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ZEKERN_SENTINEL_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ZEKERN_SENTINEL_LEFT_ARM);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ZEKERN_SENTINEL_INNER_ARMOR);
    } 
     if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ZEKERN_SENTINEL_LEFT_LEG);
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ZEKERN_SENTINEL_RIGHT_LEG);
    }
}
#endif


