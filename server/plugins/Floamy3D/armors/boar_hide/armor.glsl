#ifdef FSH
    case ZEKERN_BOAR_HIDE_CHESTPLATE: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(4.75,-5.25,-12.5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*NIX12*PIY12*NIZ25*NIY, vec3(0, 0, 0),
       relativeUv(0,6,6,0,RelativeCords), relativeUv(6,6,6,0,RelativeCords), // up down
       relativeUv(6,6,6,10,RelativeCords), relativeUv(0,6,0,10,RelativeCords), // north west
       relativeUv(6,6,-6,10,RelativeCords), relativeUv(6,6,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4.75,-5.25,-12.5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*NIX12*NIY12*PIZ25*PIY, vec3(0, 0, 0),
       relativeUv(6,6,-6,0,RelativeCords), relativeUv(12,6,-6,0,RelativeCords), // up down
       relativeUv(12,6,-6,10,RelativeCords), relativeUv(6,6,0,10,RelativeCords), // north west
       relativeUv(0,6,6,10,RelativeCords), relativeUv(0,6,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }        
    case ZEKERN_BOAR_HIDE_LEFT_ARM: {     
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2,0,-18), vec3(2.5,1.5,3)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(96,12,10,-12,RelativeCords), relativeUv(106,0,10,12,RelativeCords), // up down
       relativeUv(106,12,-10,6,RelativeCords), relativeUv(96,12,-12,6,RelativeCords), // north west
       relativeUv(128,12,-10,6,RelativeCords), relativeUv(118,12,-12,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1,-4.5,-16), vec3(2.5,1.5,0)*1.5,   // Pos, Size
       PIX*NIZ62, vec3(0, 0, 0),
       relativeUv(76,0,10,0,RelativeCords), relativeUv(86,0,10,0,RelativeCords), // up down
       relativeUv(86,0,-10,6,RelativeCords), relativeUv(76,0,0,6,RelativeCords), // north west
       relativeUv(96,0,-10,6,RelativeCords), relativeUv(86,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1,4.5,-16), vec3(2.5,1.5,0)*1.5,   // Pos, Size
       PIX*PIZ62, vec3(0, 0, 0),
       relativeUv(76,0,10,0,RelativeCords), relativeUv(86,0,10,0,RelativeCords), // up down
       relativeUv(86,0,-10,6,RelativeCords), relativeUv(76,0,0,6,RelativeCords), // north west
       relativeUv(96,0,-10,6,RelativeCords), relativeUv(86,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,2.5,-5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*NIZ12*PIY12, vec3(0, 0, 0),
       relativeUv(26,10,6,0,RelativeCords), relativeUv(32,10,6,0,RelativeCords), // up down
       relativeUv(0,0,0,0,RelativeCords), relativeUv(26,10,0,10,RelativeCords), // north west
       relativeUv(32,10,6,10,RelativeCords), relativeUv(32,10,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,-2.5,-5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*PIZ12*PIY12, vec3(0, 0, 0),
       relativeUv(26,10,6,0,RelativeCords), relativeUv(32,10,6,0,RelativeCords), // up down
       relativeUv(32,10,-6,10,RelativeCords), relativeUv(26,10,0,10,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(32,10,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);  
        break;
    }    
    case ZEKERN_BOAR_HIDE_RIGHT_ARM: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2,0,-18), vec3(2.5,1.5,3)*1.5,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(96,12,10,-12,RelativeCords), relativeUv(106,0,10,12,RelativeCords), // up down
       relativeUv(128,12,-10,6,RelativeCords), relativeUv(96,12,-12,6,RelativeCords), // south east
       relativeUv(106,12,-10,6,RelativeCords), relativeUv(118,12,-12,6,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1,-4.5,-16), vec3(2.5,1.5,0)*1.5,   // Pos, Size
       PIX*NIZ62, vec3(0, 0, 0),
       relativeUv(96,0,-10,0,RelativeCords), relativeUv(86,0,-10,0,RelativeCords), // up down
       relativeUv(86,0,10,6,RelativeCords), relativeUv(96,0,0,6,RelativeCords), // north west
       relativeUv(76,0,10,6,RelativeCords), relativeUv(86,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1,4.5,-16), vec3(2.5,1.5,0)*1.5,   // Pos, Size
       PIX*PIZ62, vec3(0, 0, 0),
       relativeUv(96,0,-10,0,RelativeCords), relativeUv(86,0,-10,0,RelativeCords), // up down
       relativeUv(86,0,10,6,RelativeCords), relativeUv(96,0,0,6,RelativeCords), // north west
       relativeUv(76,0,10,6,RelativeCords), relativeUv(86,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,2.5,-5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*NIZ12*PIY12, vec3(0, 0, 0),
       relativeUv(26,10,6,0,RelativeCords), relativeUv(32,10,6,0,RelativeCords), // up down
       relativeUv(0,0,0,0,RelativeCords), relativeUv(26,10,0,10,RelativeCords), // north west
       relativeUv(32,10,6,10,RelativeCords), relativeUv(32,10,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,-2.5,-5), vec3(1.5,2.5,0)*1.5,   // Pos, Size
       PIX*PIZ12*PIY12, vec3(0, 0, 0),
       relativeUv(26,10,6,0,RelativeCords), relativeUv(32,10,6,0,RelativeCords), // up down
       relativeUv(32,10,-6,10,RelativeCords), relativeUv(26,10,0,10,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(32,10,0,10,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);  
        break;
    }
    case ZEKERN_BOAR_HIDE_LEFT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.5,0,-13.5), vec3(0.5,1,2.5)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(10,16,2,-10,RelativeCords), relativeUv(12,6,2,10,RelativeCords), // up down
       relativeUv(12,16,-2,4,RelativeCords), relativeUv(10,16,-10,4,RelativeCords), // north west
       relativeUv(24,16,-2,4,RelativeCords), relativeUv(22,16,-10,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5.9,2,-18), vec3(1.5,2,0)*1.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(16,0,6,0,RelativeCords), relativeUv(22,0,6,0,RelativeCords), // up down
       relativeUv(16,0,6,8,RelativeCords), relativeUv(22,0,6,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(28,0,-6,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_BOAR_HIDE_RIGHT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.5,0,-13.5), vec3(0.5,1,2.5)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(12,16,-2,-10,RelativeCords), relativeUv(14,6,-2,10,RelativeCords), // up down
       relativeUv(10,16,2,4,RelativeCords), relativeUv(12,16,10,4,RelativeCords), // north west
       relativeUv(22,16,2,4,RelativeCords), relativeUv(0,16,10,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5.9,-2,-18), vec3(1.5,2,0)*1.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(16,0,6,0,RelativeCords), relativeUv(22,0,6,0,RelativeCords), // up down
       relativeUv(16,0,6,8,RelativeCords), relativeUv(22,0,6,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(28,0,-6,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_BOAR_HIDE_INNER_ARMOR: {    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(4,-6,-4), vec3(2.5,1.5,0)*1.75,   // Pos, Size
       PIX*NIX12*NIZ12, vec3(0, 0, 0),
       relativeUv(84,6,-10,0,RelativeCords), relativeUv(94,6,-10,0,RelativeCords), // up down
       relativeUv(84,6,-10,6,RelativeCords), relativeUv(74,6,0,6,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(84,6,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,-6,-4), vec3(2.5,1.5,0)*1.75,   // Pos, Size
       PIX*NIX12*PIZ12, vec3(0, 0, 0),
       relativeUv(74,6,10,0,RelativeCords), relativeUv(84,6,10,0,RelativeCords), // up down
       relativeUv(74,6,10,6,RelativeCords), relativeUv(84,6,0,6,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(74,6,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-5,-3.5), vec3(1.5,1,0.5)*1.75,   // Pos, Size
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(8,2,-6,-2,RelativeCords), relativeUv(14,0,-6,2,RelativeCords), // up down
       relativeUv(2,2,6,4,RelativeCords), relativeUv(8,2,2,4,RelativeCords), // north west
       relativeUv(10,2,6,4,RelativeCords), relativeUv(0,2,2,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_BOAR_HIDE_LEFT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(8,40,8,-8,RelativeCords), relativeUv(16,32,8,8,RelativeCords), // up down
       relativeUv(16,40,-8,24,RelativeCords), relativeUv(8,40,-8,24,RelativeCords), // north west
       relativeUv(32,40,-8,24,RelativeCords), relativeUv(24,40,-8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5.75,5.75,-4), vec3(0,1.5,1.5)*1.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(34,0,0,-6,RelativeCords), relativeUv(34,-6,0,6,RelativeCords), // up down
       relativeUv(40,0,-6,6,RelativeCords), relativeUv(28,0,6,6,RelativeCords), // north west
       relativeUv(0,0,0,6,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }    
    case ZEKERN_BOAR_HIDE_RIGHT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(16,40,-8,-8,RelativeCords), relativeUv(24,32,-8,8,RelativeCords), // up down
       relativeUv(8,40,8,24,RelativeCords), relativeUv(16,40,8,24,RelativeCords), // north west
       relativeUv(24,40,8,24,RelativeCords), relativeUv(0,40,8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5.75,-5.75,-4), vec3(0,1.5,1.5)*1.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(34,0,0,-6,RelativeCords), relativeUv(34,-6,0,6,RelativeCords), // up down
       relativeUv(34,0,0,6,RelativeCords), relativeUv(34,0,6,6,RelativeCords), // north west
       relativeUv(0,0,0,6,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
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
        cems = addCem(cems,ZEKERN_BOAR_HIDE_CHESTPLATE);
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
       cems = addCem(cems,ZEKERN_BOAR_HIDE_LEFT_ARM);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_INNER_ARMOR);
    }
    if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_LEFT_FEET);
    }
    if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_RIGHT_FEET);
    }
    if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_LEFT_LEG);
    }
    if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ZEKERN_BOAR_HIDE_RIGHT_LEG);
    }

}
#endif

