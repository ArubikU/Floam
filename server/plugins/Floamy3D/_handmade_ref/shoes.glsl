#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,SHOE_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,SHOE_RIGHT_FEET);
        removeAll=1;
    }
}
#endif


#ifdef FSH

    case SHOE_RIGHT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0.9,-1), vec3(3.6,1.4,5.7)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(7,11,-7,-11,RelativeCords), relativeUv(14,0,-7,11,RelativeCords), // up down
       relativeUv(32,14,-7,3,RelativeCords), relativeUv(25,19,-11,3,RelativeCords), // south east
       relativeUv(7,25,-7,3,RelativeCords), relativeUv(25,16,-11,3,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0.65,-2.5), vec3(3.5,1.4,5.2)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(7,21,-7,-10,RelativeCords), relativeUv(14,11,-7,10,RelativeCords), // up down
       relativeUv(32,20,-7,3,RelativeCords), relativeUv(31,7,-10,3,RelativeCords), // south east
       relativeUv(32,17,-7,3,RelativeCords), relativeUv(31,4,-10,3,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-4), vec3(3.4,1.9,3.9)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(21,8,-7,-8,RelativeCords), relativeUv(21,8,-7,8,RelativeCords), // up down
       relativeUv(15,22,-7,4,RelativeCords), relativeUv(29,0,-8,4,RelativeCords), // south east
       relativeUv(28,10,-7,4,RelativeCords), relativeUv(8,21,-8,4,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,2.5,-4), vec3(2.4,2.3,0.9)*0.5,   // Pos, Size
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(9,28,5,-2,RelativeCords), relativeUv(14,27,5,2,RelativeCords), // up down
       relativeUv(25,22,-5,5,RelativeCords), relativeUv(27,23,-2,5,RelativeCords), // north west
       relativeUv(20,22,-5,5,RelativeCords), relativeUv(9,26,-2,5,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

    
    case SHOE_LEFT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-0.9,-1), vec3(3.6,1.4,5.7)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(0,11,7,-11,RelativeCords), relativeUv(7,0,7,11,RelativeCords), // up down
       relativeUv(7,25,-7,3,RelativeCords), relativeUv(25,16,-11,3,RelativeCords), // north west
       relativeUv(32,14,-7,3,RelativeCords), relativeUv(25,19,-11,3,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-0.65,-2.5), vec3(3.5,1.4,5.2)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(0,21,7,-10,RelativeCords), relativeUv(7,11,7,10,RelativeCords), // up down
       relativeUv(32,17,-7,3,RelativeCords), relativeUv(31,4,-10,3,RelativeCords), // north west
       relativeUv(32,20,-7,3,RelativeCords), relativeUv(31,7,-10,3,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-4), vec3(3.4,1.9,3.9)*0.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(14,8,7,-8,RelativeCords), relativeUv(14,8,7,8,RelativeCords), // up down
       relativeUv(28,10,-7,4,RelativeCords), relativeUv(8,21,-8,4,RelativeCords), // north west
       relativeUv(15,22,-7,4,RelativeCords), relativeUv(29,0,-8,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-2.5,-4), vec3(2.4,2.3,0.9)*0.5,   // Pos, Size
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(14,28,-5,-2,RelativeCords), relativeUv(19,27,-5,2,RelativeCords), // up down
       relativeUv(20,22,-5,5,RelativeCords), relativeUv(9,26,-2,5,RelativeCords), // south east
       relativeUv(25,22,-5,5,RelativeCords), relativeUv(27,23,-2,5,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    

#endif