#ifdef VSH


if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,WARDEN_CHESTPLATE);
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,WARDEN_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,WARDEN_LEFT_ARM);
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,WARDEN_RIGHT_LEG);
    }
     if(cube==STASIS_LEFT_LEG) {
         cems = addCem(cems,WARDEN_LEFT_LEG);
    }
}
#endif



#ifdef FSH

    case WARDEN_CHESTPLATE: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6.5), vec3(4,4.5,3.5)*0.71,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(29,7,8,-7,RelativeCords), relativeUv(37,0,8,7,RelativeCords), //up down
       relativeUv(29,7,8,9,RelativeCords), relativeUv(44,7,-7,9,RelativeCords), //north west
       relativeUv(44,7,8,9,RelativeCords), relativeUv(22,7,7,9,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.boxes[1]
        break;
    }

    
    case WARDEN_LEFT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-9), vec3(1,2.5,1)*0.71 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(60,0,-2,2,RelativeCords), relativeUv(62,0,-2,2,RelativeCords), //up down
       relativeUv(64,2,-2,5,RelativeCords), relativeUv(62,2,-2,5,RelativeCords), //north west
       relativeUv(60,2,-2,5,RelativeCords), relativeUv(58,2,-2,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.5,0,-7), vec3(2.5,3.5,3)*0.71 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(11,3,-5,6,RelativeCords), relativeUv(16,3,-5,6,RelativeCords), //up down
       relativeUv(6,9,5,7,RelativeCords), relativeUv(17,9,-6,7,RelativeCords), //north west
       relativeUv(22,9,-5,7,RelativeCords), relativeUv(6,9,-6,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[1]
        break;
    }

    
    case WARDEN_RIGHT_ARM: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-9), vec3(1,2.5,1)*0.71 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(60,0,-2,2,RelativeCords), relativeUv(62,0,-2,2,RelativeCords), //up down
       relativeUv(60,2,-2,5,RelativeCords), relativeUv(60,2,2,5,RelativeCords), //north west
       relativeUv(64,2,-2,5,RelativeCords), relativeUv(56,2,2,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.5,0,-7), vec3(2.5,3.5,3)*0.71 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(11,3,-5,6,RelativeCords), relativeUv(16,3,-5,6,RelativeCords), //up down
       relativeUv(22,9,-5,7,RelativeCords), relativeUv(17,9,-6,7,RelativeCords), //north west
       relativeUv(6,9,5,7,RelativeCords), relativeUv(6,9,-6,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[1]
        break;
    }

    
    
    case WARDEN_LEFT_LEG: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-4,0,-6.5), vec3(2,4,0)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(60,13,-4,0,RelativeCords), relativeUv(64,13,-4,0,RelativeCords), //up down
       relativeUv(60,13,-4,8,RelativeCords), relativeUv(60,13,0,8,RelativeCords), //north west
       relativeUv(64,13,-4,8,RelativeCords), relativeUv(56,13,0,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.boxes[1]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2,0,-7), vec3(1.5,3.5,3)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(53,0,-3,6,RelativeCords), relativeUv(56,0,-3,6,RelativeCords), //up down
       relativeUv(53,6,-3,7,RelativeCords), relativeUv(59,6,-6,7,RelativeCords), //north west
       relativeUv(62,6,-3,7,RelativeCords), relativeUv(50,6,-6,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.boxes[2]
        break;
    }

    
    case WARDEN_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-4,0,-6.5), vec3(2,4,0)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(56,13,4,0,RelativeCords), relativeUv(60,13,4,0,RelativeCords), //up down
       relativeUv(56,13,4,8,RelativeCords), relativeUv(60,13,0,8,RelativeCords), //north west
       relativeUv(60,13,4,8,RelativeCords), relativeUv(56,13,0,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[8].part=right_leg.boxes[1]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2,0,-7), vec3(1.5,3.5,3)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(50,0,3,6,RelativeCords), relativeUv(53,0,3,6,RelativeCords), //up down
       relativeUv(50,6,3,7,RelativeCords), relativeUv(53,6,6,7,RelativeCords), //north west
       relativeUv(59,6,3,7,RelativeCords), relativeUv(44,6,6,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[8].part=right_leg.boxes[2]
        break;
    }

    

#endif