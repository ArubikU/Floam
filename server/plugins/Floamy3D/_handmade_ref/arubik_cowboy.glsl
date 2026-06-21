#ifdef VSH


if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ARUBIK_COWBOY_CHESTPLATE);
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ARUBIK_COWBOY_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ARUBIK_COWBOY_LEFT_ARM);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ARUBIK_COWBOY_INNER_ARMOR);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ARUBIK_COWBOY_LEFT_FEET);
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ARUBIK_COWBOY_RIGHT_FEET);
    }
     if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ARUBIK_COWBOY_LEFT_LEG);
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ARUBIK_COWBOY_RIGHT_LEG);
    }
    
}

#endif

#ifdef FSH

    case ARUBIK_COWBOY_CHESTPLATE: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2.2,-4.5), vec3(5,7,0)*0.69 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(36,0,10,0,RelativeCords), relativeUv(28,0,10,0,RelativeCords), //up down
       relativeUv(20,0,8,13,RelativeCords), relativeUv(28,0,0,14,RelativeCords), //north west
       relativeUv(12,0,10,14,RelativeCords), relativeUv(20,0,0,14,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.boxes[1]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3,-2.5,-5), vec3(1,6,0)*0.71 ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(31,20,2,0,RelativeCords), relativeUv(29,20,2,0,RelativeCords), //up down
       relativeUv(27,20,2,12,RelativeCords), relativeUv(29,20,0,12,RelativeCords), //north west
       relativeUv(44,0,2,12,RelativeCords), relativeUv(27,20,0,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.submodels[0].boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(3,-2.5,-5), vec3(1,6,0)*0.71 ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(23,20,2,0,RelativeCords), relativeUv(21,20,2,0,RelativeCords), //up down
       relativeUv(19,20,2,12,RelativeCords), relativeUv(21,20,0,12,RelativeCords), //north west
       relativeUv(44,0,2,12,RelativeCords), relativeUv(19,20,0,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=body.submodels[1].boxes[0]
        break;
    }

    
    
    case ARUBIK_COWBOY_LEFT_FEET: {
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
        break;
    }

    
    case ARUBIK_COWBOY_RIGHT_FEET: {

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
        break;
    }

    
    case ARUBIK_COWBOY_LEFT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,16,-4,4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(48,20,-4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords), //north west
       relativeUv(56,20,-4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-4.5), vec3(2.25,6.25,2.25) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(32,4,4,-4,RelativeCords), relativeUv(36,0,4,4,RelativeCords), //up down
       relativeUv(36,4,-4,12,RelativeCords), relativeUv(32,4,-4,12,RelativeCords), //north west
       relativeUv(40,4,4,12,RelativeCords), relativeUv(40,4,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=left_arm.boxes[1]
        break;
    }

    
    case ARUBIK_COWBOY_RIGHT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(44,16,4,4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(44,20,4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords), //north west
       relativeUv(52,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[5].part=right_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-4.5), vec3(2.25,6.25,2.25) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(32,4,4,-4,RelativeCords), relativeUv(36,0,4,4,RelativeCords), //up down
       relativeUv(36,4,-4,12,RelativeCords), relativeUv(32,4,-4,12,RelativeCords), //north west
       relativeUv(40,4,4,12,RelativeCords), relativeUv(40,4,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[4].part=right_arm.boxes[1]
        break;
    }

    
    case ARUBIK_COWBOY_INNER_ARMOR: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4.25,6,2.25) ,   //Pos, Size,
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

    
    case ARUBIK_COWBOY_LEFT_LEG: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3,-4.25,-5), vec3(0,6.2625,2.375) ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(50,4,5,4,RelativeCords), relativeUv(55,0,5,4,RelativeCords), //up down
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords), //north west
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[0].boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,-4.25,-5), vec3(0,6.2625,2.375) ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(42.75,-4,0,4.75,RelativeCords), relativeUv(42.75,-4,0,4.75,RelativeCords), //up down
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords), //north west
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(42,0,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[0].boxes[1]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2.5,6.375,2.375),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(50,4,5,-4,RelativeCords), relativeUv(55,0,5,4,RelativeCords), //up down
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(50,4,-4,12,RelativeCords), //north west
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(59,4,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[1].boxes[0]
        break;
    }

    
    case ARUBIK_COWBOY_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3,4.25,-5), vec3(0,6.2625,2.375) ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(50,4,5,4,RelativeCords), relativeUv(55,0,5,4,RelativeCords), //up down
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(38,0,4,12,RelativeCords), //north west
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(38,0,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[0].boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,4.25,-5), vec3(0,6.2625,2.375) ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(42.75,-4,0,4.75,RelativeCords), relativeUv(42.75,-4,0,4.75,RelativeCords), //up down
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(38,0,4,12,RelativeCords), //north west
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(38,0,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[0].boxes[1]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2.5,6.375,2.375),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(50,4,5,-4,RelativeCords), relativeUv(55,0,5,4,RelativeCords), //up down
       relativeUv(55,4,-5,12,RelativeCords), relativeUv(46,4,4,12,RelativeCords), //north west
       relativeUv(64,4,-5,12,RelativeCords), relativeUv(55,4,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[7].part=left_leg.submodels[1].boxes[0]
        break;
    }

    

#endif