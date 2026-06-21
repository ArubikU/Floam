
#ifdef FSH
    case ZEKERN_CHAINMAIL_SP_LEFT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(8,40,8,-8,RelativeCords), relativeUv(16,32,8,8,RelativeCords), // up down
       relativeUv(16,40,-8,24,RelativeCords), relativeUv(8,40,-8,24,RelativeCords), // north west
       relativeUv(32,40,-8,24,RelativeCords), relativeUv(24,40,-8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);    

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0, -9), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(12,12,12,-12,RelativeCords), relativeUv(24,0,12,12,RelativeCords), // up down
       relativeUv(24,12,-12,2,RelativeCords), relativeUv(12,12,-12,2,RelativeCords), // north west
       relativeUv(48,12,-12,2,RelativeCords), relativeUv(36,12,-12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-1.5,-6), vec3(3,1,2)*1.6,   // Pos, Size
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(66,8,12,-8,RelativeCords), relativeUv(78,0,12,8,RelativeCords), // up down
       relativeUv(78,8,-12,4,RelativeCords), relativeUv(66,8,-8,4,RelativeCords), // north west
       relativeUv(98,8,-12,4,RelativeCords), relativeUv(86,8,-8,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.5,0,-6.5), vec3(1,1,1)*1.5,   // Pos, Size
       PIX*NIX25, vec3(0, 0, 0),
       relativeUv(46,4,-4,-4,RelativeCords), relativeUv(50,0,-4,4,RelativeCords), // up down
       relativeUv(42,4,4,4,RelativeCords), relativeUv(46,4,4,4,RelativeCords), // north west
       relativeUv(50,4,4,4,RelativeCords), relativeUv(38,4,4,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_CHAINMAIL_SP_RIGHT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(16,40,-8,-8,RelativeCords), relativeUv(24,32,-8,8,RelativeCords), // up down
       relativeUv(8,40,8,24,RelativeCords), relativeUv(16,40,8,24,RelativeCords), // north west
       relativeUv(24,40,8,24,RelativeCords), relativeUv(0,40,8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0, -9), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(12,0,12,12,RelativeCords), relativeUv(24,0,12,12,RelativeCords), // up down
       relativeUv(36,12,12,2,RelativeCords), relativeUv(0,12,12,2,RelativeCords), // north west
       relativeUv(12,12,12,2,RelativeCords), relativeUv(24,12,12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       



       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,1.5,-6), vec3(3,1,2)*1.6,   // Pos, Size
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(66,0,12,8,RelativeCords), relativeUv(78,0,12,8,RelativeCords), // up down
       relativeUv(86,8,12,4,RelativeCords), relativeUv(58,8,8,4,RelativeCords), // north west
       relativeUv(66,8,12,4,RelativeCords), relativeUv(78,8,8,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.5,0,-6.5), vec3(1,1,1)*1.5,   // Pos, Size
       PIX*NIX25, vec3(0, 0, 0),
       relativeUv(46,4,-4,-4,RelativeCords), relativeUv(50,0,-4,4,RelativeCords), // up down
       relativeUv(50,4,4,4,RelativeCords), relativeUv(48,4,4,4,RelativeCords), // north west
       relativeUv(42,4,4,4,RelativeCords), relativeUv(46,4,4,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

        break;
    }

    case ZEKERN_CHAINMAIL_SP_INNER_ARMOR: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-4), vec3(5,1,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(32,12,-20,-12,RelativeCords), relativeUv(52,0,-20,12,RelativeCords), // up down
       relativeUv(12,12,20,4,RelativeCords), relativeUv(32,12,12,4,RelativeCords), // north west
       relativeUv(44,12,20,4,RelativeCords), relativeUv(0,12,12,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    

#endif

#ifdef VSH


#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ZEKERN_CHAINMAIL_SP_INNER_ARMOR);
    } 
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ZEKERN_CHAINMAIL_SP_LEFT_FEET);
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ZEKERN_CHAINMAIL_SP_RIGHT_FEET);
    }
}
#endif


