#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,KINII_FEERAL_CHESTPLATE);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,KINII_FEERAL_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,KINII_FEERAL_LEFT_ARM);
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,KINII_FEERAL_LEFT_FEET);
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,KINII_FEERAL_RIGHT_FEET);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,KINII_FEERAL_INNER_ARMOR);
    }
}
#endif



#ifdef FSH

    case KINII_FEERAL_CHESTPLATE: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-4.5), vec3(4,6,2)*0.81,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.15,-2,-5), vec3(1.75,6.025,0)*0.71 ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(20,0,3,0,RelativeCords), relativeUv(23,0,3,0,RelativeCords), //up down
       relativeUv(23,0,-3,12,RelativeCords), relativeUv(23,0,0,12,RelativeCords), //north west
       relativeUv(27,0,-3,12,RelativeCords), relativeUv(20,0,0,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.submodels[2].boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.15,-2,-5), vec3(1.75,6.025,0)*0.71 ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(26,0,3,0,RelativeCords), relativeUv(29,0,3,0,RelativeCords), //up down
       relativeUv(29,0,-3,12,RelativeCords), relativeUv(29,0,0,12,RelativeCords), //north west
       relativeUv(33,0,-3,12,RelativeCords), relativeUv(26,0,0,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.submodels[3].boxes[0]
        break;
    }

    
    case KINII_FEERAL_LEFT_FEET: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0, -0.25), vec3(2.25,0.5,2.25),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(8,30,-4,1,RelativeCords), relativeUv(8,30,4,1,RelativeCords), //north west
       relativeUv(16,30,-4,1,RelativeCords), relativeUv(0,30,4,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[2].part=left_shoe.submodels[0].boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2,-3), vec3(1,1,1),   //Pos, Size,
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(44,2,-2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords), //up down
       relativeUv(42,4,2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords), //north west
       relativeUv(46,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=left_shoe.submodels[0].boxes[0]
        break;
    }

    
    case KINII_FEERAL_RIGHT_FEET: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-0.25), vec3(2.25,0.5,2.25),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(12,30,4,1,RelativeCords), relativeUv(12,30,-4,1,RelativeCords), //north west
       relativeUv(4,30,4,1,RelativeCords), relativeUv(4,30, -4,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[3].part=right_shoe.boxes[1]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,2,-3), vec3(1,1,1),   //Pos, Size,
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(42,2,2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords), //up down
       relativeUv(42,4,2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords), //north west
       relativeUv(46,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=left_shoe.submodels[0].boxes[0]
        break;
    }

    case KINII_FEERAL_LEFT_ARM: {


       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5.5), vec3(2.25,6.25,2.25),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,0,4,4,RelativeCords), relativeUv(12,0,-4,4,RelativeCords), //up down
       relativeUv(4,4,4,12,RelativeCords), relativeUv(8,4,4,12,RelativeCords), //north west
       relativeUv(16,4,-4,12,RelativeCords), relativeUv(0,4,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.boxes[1]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.75,0,-9), vec3(2.625,1.5,3.125),   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(53,6,-5,-6,RelativeCords), relativeUv(53,0,5,6,RelativeCords), //up down
       relativeUv(64,6,-5,3,RelativeCords), relativeUv(58,6,-6,3,RelativeCords), //north west
       relativeUv(48,6,5,3,RelativeCords), relativeUv(48,6,-6,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.submodels[0].boxes[0]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,0,-10.75), vec3(0.625,1.5,2.75),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(58,14,-1,-5,RelativeCords), relativeUv(59,9,-1,5,RelativeCords), //up down
       relativeUv(63,14,1,3,RelativeCords), relativeUv(52,14,5,3,RelativeCords), //north west
       relativeUv(57,14,1,3,RelativeCords), relativeUv(58,14,5,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.boxes[2]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3.75,0,-9.5), vec3(1,1,1),   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(44,2,-2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords), //up down
       relativeUv(46,4,2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords), //north west
       relativeUv(42,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.submodels[0].submodels[0].boxes[0]
        break;
    }
    
    case KINII_FEERAL_RIGHT_ARM: {


       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5.5), vec3(2.25,6.25,2.25),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,0,4,4,RelativeCords), relativeUv(12,0,-4,4,RelativeCords), //up down
       relativeUv(4,4,4,12,RelativeCords), relativeUv(8,4,4,12,RelativeCords), //north west
       relativeUv(16,4,-4,12,RelativeCords), relativeUv(0,4,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.boxes[1]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.75,0,-9), vec3(2.625,1.5,3.125),   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(53,6,-5,-6,RelativeCords), relativeUv(58,0,-5,6,RelativeCords), //up down
       relativeUv(48,6,5,3,RelativeCords), relativeUv(52,6,6,3,RelativeCords), //north west
       relativeUv(64,6,-5,3,RelativeCords), relativeUv(42,6,6,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.submodels[0].boxes[0]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,0,-10.75), vec3(0.625,1.5,2.75),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(57,9,1,5,RelativeCords), relativeUv(58,9,1,5,RelativeCords), //up down
       relativeUv(57,14,1,3,RelativeCords), relativeUv(58,14,5,3,RelativeCords), //north west
       relativeUv(63,14,1,3,RelativeCords), relativeUv(52,14,5,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.boxes[2]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3.75,0,-9.5), vec3(1,1,1),   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(44,2,-2,2,RelativeCords), relativeUv(44,2,2,2,RelativeCords), //up down
       relativeUv(42,4,2,2,RelativeCords), relativeUv(44,4,2,2,RelativeCords), //north west
       relativeUv(46,4,2,2,RelativeCords), relativeUv(40,4,2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.submodels[0].submodels[0].boxes[0]
        break;
    }

    
    case KINII_FEERAL_INNER_ARMOR: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6), vec3(4.25,6,2.25)*0.81,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(36,16,8,-4,RelativeCords), relativeUv(28,20,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[6].part=waist.boxes[0]
        break;
    }

    

    

#endif