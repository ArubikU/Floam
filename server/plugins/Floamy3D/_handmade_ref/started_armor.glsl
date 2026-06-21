#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ZEKERN_STARTED_CHESTPLATE);
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ZEKERN_STARTED_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ZEKERN_STARTED_LEFT_ARM);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ZEKERN_STARTED_INNER_ARMOR);
    }
}
#endif



#ifdef FSH

    case ZEKERN_STARTED_CHESTPLATE: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2.4,0,-1.7), vec3(1,0.5,3.5)*0.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(86,28,-4,-14,RelativeCords), relativeUv(90,14,-4,14,RelativeCords), // up down
       relativeUv(82,28,4,2,RelativeCords), relativeUv(86,28,14,2,RelativeCords), // north west
       relativeUv(100,28,4,2,RelativeCords), relativeUv(68,28,14,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(1.3,2,-7.5), vec3(1.5,4.5,0.5)*0.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(120,46,-6,-2,RelativeCords), relativeUv(126,44,-6,2,RelativeCords), // up down
       relativeUv(114,46,6,18,RelativeCords), relativeUv(120,46,2,18,RelativeCords), // north west
       relativeUv(122,46,6,18,RelativeCords), relativeUv(112,46,2,18,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(1.8,0,-11.4), vec3(1,1.5,3)*0.75,   // Pos, Size
       PIX*NIZ125, vec3(0, 0, 0),
       relativeUv(112,12,-4,-12,RelativeCords), relativeUv(116,0,-4,12,RelativeCords), // up down
       relativeUv(108,12,4,6,RelativeCords), relativeUv(112,12,12,6,RelativeCords), // north west
       relativeUv(124,12,4,6,RelativeCords), relativeUv(96,12,12,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1.8,0,-11.4), vec3(1,1.5,3)*0.75,   // Pos, Size
       PIX*PIZ125, vec3(0, 0, 0),
       relativeUv(108,12,4,-12,RelativeCords), relativeUv(112,0,4,12,RelativeCords), // up down
       relativeUv(112,12,-4,6,RelativeCords), relativeUv(108,12,-12,6,RelativeCords), // north west
       relativeUv(128,12,-4,6,RelativeCords), relativeUv(124,12,-12,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(1.3,0,-10.4), vec3(1,1,3)*0.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(80,12,-4,-12,RelativeCords), relativeUv(84,0,-4,12,RelativeCords), // up down
       relativeUv(76,12,4,4,RelativeCords), relativeUv(80,12,12,4,RelativeCords), // north west
       relativeUv(92,12,4,4,RelativeCords), relativeUv(64,12,12,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-1.3,0,-10.4), vec3(1,1,3)*0.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(76,12,4,-12,RelativeCords), relativeUv(80,0,4,12,RelativeCords), // up down
       relativeUv(80,12,-4,4,RelativeCords), relativeUv(76,12,-12,4,RelativeCords), // north west
       relativeUv(96,12,-4,4,RelativeCords), relativeUv(92,12,-12,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-0.6,0,-4.6), vec3(0.5,4.5,3.5)*0.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(20,14,-2,-14,RelativeCords), relativeUv(22,0,-2,14,RelativeCords), // up down
       relativeUv(18,14,2,18,RelativeCords), relativeUv(20,14,14,18,RelativeCords), // north west
       relativeUv(34,14,2,18,RelativeCords), relativeUv(4,14,14,18,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
    
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(1.1,0,-10.4), vec3(0.5,3,3.5)*0.75,   // Pos, Size
       PIX*NIZ125, vec3(0, 0, 0),
       relativeUv(52,16,-2,-14,RelativeCords), relativeUv(54,2,-2,14,RelativeCords), // up down
       relativeUv(50,16,2,12,RelativeCords), relativeUv(52,16,14,12,RelativeCords), // north west
       relativeUv(66,16,2,12,RelativeCords), relativeUv(36,16,14,12,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       break;
    }

    case ZEKERN_STARTED_LEFT_ARM: {

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-2.5,0,-8), vec3(0.5,1,1.5)*0.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(6,6,2,-6,RelativeCords), relativeUv(8,0,2,6,RelativeCords), // up down
       relativeUv(8,6,-2,4,RelativeCords), relativeUv(6,6,-6,4,RelativeCords), // north west
       relativeUv(16,6,-2,4,RelativeCords), relativeUv(14,6,-6,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    
    case ZEKERN_STARTED_RIGHT_ARM: {

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(2.5,0,-8), vec3(0.5,1,1.5)*0.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(8,6,-2,-6,RelativeCords), relativeUv(10,0,-2,6,RelativeCords), // up down
       relativeUv(6,6,2,4,RelativeCords), relativeUv(8,6,6,4,RelativeCords), // north west
       relativeUv(14,6,2,4,RelativeCords), relativeUv(0,6,6,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

    
    case ZEKERN_STARTED_INNER_ARMOR: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(2.3,1.4,0), vec3(1.5,2,1)*0.75,   // Pos, Size
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(118,22,-6,-4,RelativeCords), relativeUv(124,18,-6,4,RelativeCords), // up down
       relativeUv(112,22,6,8,RelativeCords), relativeUv(118,22,4,8,RelativeCords), // north west
       relativeUv(122,22,6,8,RelativeCords), relativeUv(108,22,4,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

    

    

#endif