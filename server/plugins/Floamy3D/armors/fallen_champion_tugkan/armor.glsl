#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,FALLEN_CHAMPION_CHESTPLATE);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,FALLEN_CHAMPION_RIGHT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,FALLEN_CHAMPION_LEFT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,FALLEN_CHAMPION_LEFT_FEET);
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,FALLEN_CHAMPION_RIGHT_FEET);
    }
     if(cube==STASIS_RIGHT_LEG) {
        removeAll=1;
        cems = addCem(cems,FALLEN_CHAMPION_RIGHT_LEG);
    }
     if(cube==STASIS_LEFT_LEG) {
        removeAll=1;
         cems = addCem(cems,FALLEN_CHAMPION_LEFT_LEG);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,FALLEN_CHAMPION_INNER_ARMOR);
        removeAll=1;
    }
}
#endif



#ifdef FSH

    case FALLEN_CHAMPION_CHESTPLATE: {


        
    
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-7), vec3(5,3,2.5)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(39,0,10,5,RelativeCords), relativeUv(39,8,-4,4,RelativeCords), //up down
       relativeUv(54,6,10,6,RelativeCords), relativeUv(54,6,-5,6,RelativeCords), //north west
       relativeUv(54,0,10,6,RelativeCords), relativeUv(49,0,5,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.boxes[2]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-2.85), vec3(4,2.5,2.5)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(1,1,8,-5,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //up down
       relativeUv(40,10,8,5,RelativeCords), relativeUv(35,10,5,5,RelativeCords), //north west
       relativeUv(23,10,8,5,RelativeCords), relativeUv(59,17,5,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.boxes[0]




       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2.5,-7.25), vec3(1.5,1.5,1)*0.81 ,   //Pos, Size,
       PIX*NIY25, vec3(0, 0, 0),
       relativeUv(4,3,3,2,RelativeCords), relativeUv(7,3,3,2,RelativeCords), //up down
       relativeUv(4,5,3,3,RelativeCords), relativeUv(0,5,2,3,RelativeCords), //north west
       relativeUv(7,5,3,3,RelativeCords), relativeUv(2,5,2,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[2].boxes[0]




        
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2.5,-2.5,-7.25), vec3(3,2.5,0.5)*0.71 ,   //Pos, Size,
       PIX*PIX62*PIY12*PIZ62, vec3(0, 0, 0),
       relativeUv(17,1,6,-1,RelativeCords), relativeUv(17,1,6,1,RelativeCords), //up down
       relativeUv(17,7,6,5,RelativeCords), relativeUv(16,7,1,5,RelativeCords), //north west
       relativeUv(17,2,6,5,RelativeCords), relativeUv(15,7,1,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[3].boxes[0]

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.5,-2.5,-7.25), vec3(3,2.5,0.5)*0.71 ,   //Pos, Size,
       PIX*PIX62*NIY12*NIZ62, vec3(0, 0, 0),
       relativeUv(23,1,-6,-1,RelativeCords), relativeUv(23,1,-6,1,RelativeCords), //up down
       relativeUv(23,7,-6,5,RelativeCords), relativeUv(15,7,1,5,RelativeCords), //north west
       relativeUv(23,2,-6,5,RelativeCords), relativeUv(16,7,1,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[4].boxes[0]






       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-4,0.5,-10), vec3(2,0.5,4)*0.81 ,   //Pos, Size,
       PIX*NIX12*PIY12, vec3(0, 0, 0),
       relativeUv(15,0,-4,8,RelativeCords), relativeUv(4,8,-4,8,RelativeCords), //up down
       relativeUv(4,3,-4,1,RelativeCords), relativeUv(31,9,-8,1,RelativeCords), //north west
       relativeUv(0,4,4,1,RelativeCords), relativeUv(31,8,-8,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[0]


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(4,0.5,-10), vec3(2,0.5,4)*0.81 ,   //Pos, Size,
       PIX*NIX12*NIY12, vec3(0, 0, 0),
       relativeUv(11,0,4,8,RelativeCords), relativeUv(0,16,4,-8,RelativeCords), //up down
       relativeUv(0,3,4,1,RelativeCords), relativeUv(31,8,-8,1,RelativeCords), //north west
       relativeUv(4,4,-4,1,RelativeCords), relativeUv(31,9,-8,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[0].boxes[0]


       //Shadow all before
       APPLY_SHADOW();
       dynamicEmissive=1;
       //Emisive all after

       ADD_BOX_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-4.5,3,-11.125), vec3(0.5,1,1)*0.81 ,   //Pos, Size,
       PIX*NIX12*PIY12, vec3(0, 0, 0),
       VECNULL4, VECNULL4, //up down
       relativeUv(5,1,-1,1,RelativeCords), relativeUv(5,1,-1,1,RelativeCords), 
       VECNULL4, relativeUv(4,2,1,-2,RelativeCords), 
       2, 2,
       2, 3,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[1]
       ADD_BOX_WITH_ROTATION_ROTATE_EMISSIVE(vec3(4.5,3,-11.125), vec3(0.5,1,1)*0.81 ,   //Pos, Size,
       PIX*NIX12*NIY12, vec3(0, 0, 0),
       VECNULL4, VECNULL4, //up down
       relativeUv(5,1,-1,1,RelativeCords), relativeUv(4,2,1,-2,RelativeCords), //north west
       VECNULL4, relativeUv(5,1,-1,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 3);
       //mirrored?: 
       //model[0].part=body.submodels[0].boxes[1]

       
       
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-3,0.25,-10.5), vec3(1,1,4.5)*0.81 ,   //Pos, Size,
       PIX*NIX12*PIY12, vec3(0, 0, 0),
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,1,1,1,RelativeCords), 
       VECNULL4,relativeUv(4,1,1,1,RelativeCords), 
       relativeUv(4,1,1,1,RelativeCords), VECNULL4,
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[3]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(3,0.25,-10.5), vec3(1,1,4.5)*0.81 ,   //Pos, Size,
       PIX*NIX12*NIY12, vec3(0, 0, 0),
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,1,1,1,RelativeCords), 
       VECNULL4, VECNULL4, 
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,1,1,1,RelativeCords), 
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[2]

       
       
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-5,-0.25,-9.5), vec3(1,1,4.5)*0.81 ,   //Pos, Size,
       PIX*NIX12*PIY12, vec3(0, 0, 0),
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,2.25,1,-1.25,RelativeCords), 
       VECNULL4, VECNULL4, 
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,2.25,1,-1.25,RelativeCords), 
       2, 2,
       2, 1,
       2, 1);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[3]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(5,-0.25,-9.5), vec3(1,1,4.5)*0.81 ,   //Pos, Size,
       PIX*NIX12*NIY12, vec3(0, 0, 0),
       relativeUv(4,1,1,1,RelativeCords),relativeUv(4,2.25,1,-1.25,RelativeCords), 
       VECNULL4,relativeUv(4,1,1,1.25,RelativeCords), 
       relativeUv(4,1,1,1,RelativeCords), VECNULL4,
       2, 2,
       2, 1,
       2, 1);
       //mirrored?: 
       //model[0].part=body.submodels[1].boxes[2]


       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,1.5,-7), vec3(5.5,3.5,1.5)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,1,1,1,RelativeCords), relativeUv(4,1,1,1,RelativeCords), //up down
       relativeUv(4,1,1,1,RelativeCords), relativeUv(4,1,1,1,RelativeCords), //north west
       relativeUv(4,1,1,1,RelativeCords), relativeUv(4,1,1,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.boxes[2]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-3), vec3(4.5,3,3)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(3,1,1,1,RelativeCords), VECNULL4, //up down
       relativeUv(3,1,1,1,RelativeCords), relativeUv(3,1,1,1,RelativeCords), //north west
       relativeUv(3,1,1,1,RelativeCords), relativeUv(3,1,1,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[0].part=body.boxes[0]

        break;
    }

    
    case FALLEN_CHAMPION_LEFT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.25,0,-6), vec3(2,4,2)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(35,8,-4,4,RelativeCords), relativeUv(39,8,-4,4,RelativeCords), //up down
       relativeUv(31,0,4,8,RelativeCords), relativeUv(27,0,4,8,RelativeCords), //north west
       relativeUv(27,0,-4,8,RelativeCords), relativeUv(35,0,4,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=left_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-8), vec3(1,2.5,2)*0.9 ,   //Pos, Size,
       PIX*Rotate3(PI*-0.3333,Y), vec3(0, 0, 0),
       relativeUv(10,13,-2,-4,RelativeCords),relativeUv(12,9,-2,4,RelativeCords),  //up down
       relativeUv(15,0,2,5,RelativeCords), relativeUv(60,12,4,5,RelativeCords), //north west
       relativeUv(7,9,-2,5,RelativeCords), relativeUv(56,12,4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[1].part=left_arm.submodels[0].boxes[0]

        vec4 e3 = relativeUv(3,1,1,1,RelativeCords);
        
        vec4 e4 = relativeUv(4,1,1,1,RelativeCords);
       
       //Shadow all before
       APPLY_SHADOW();
       dynamicEmissive=1;
       //Emisive all after
       
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-0.25,0,-5), vec3(2.5,3,2.5)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       VECNULL4,relativeUv(3,3,1,-2,RelativeCords),
       e3,e3,
       e3,e3,
       1, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.boxes[0]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-2.25,0,-8), vec3(1.5,3,2.5)*0.9 ,   //Pos, Size,
       PIX*Rotate3(PI*-0.3333,Y), vec3(0, 0, 0),
       VECNULL4,e4,
       e4,e4,
       e4,e4,
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.submodels[0].boxes[0]
        break;
    }

    
    case FALLEN_CHAMPION_RIGHT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.25,0,-6), vec3(2,4,2)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(35,8,-4,4,RelativeCords), relativeUv(39,12,-4,-4,RelativeCords), //up down
       relativeUv(27,0,-4,8,RelativeCords), relativeUv(31,0,-4,8,RelativeCords), //north west
       relativeUv(31,0,4,8,RelativeCords), relativeUv(39,0,-4,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.boxes[0]
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-8), vec3(1,2.5,2)*0.9 ,   //Pos, Size,
       PIX*Rotate3(PI*-0.3333,Y), vec3(0, 0, 0),
       relativeUv(10,9,-2,4,RelativeCords), relativeUv(12,9,-2,4,RelativeCords), //up down
       relativeUv(7,9,-2,5,RelativeCords), relativeUv(64,12,-4,5,RelativeCords), //north west
       relativeUv(15,0,2,5,RelativeCords), relativeUv(60,12,-4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.submodels[0].boxes[0]

       
        vec4 e3 = relativeUv(3,1,1,1,RelativeCords);
        
        vec4 e4 = relativeUv(4,1,1,1,RelativeCords);

        
       //Shadow all before
       APPLY_SHADOW();
       dynamicEmissive=1;
       //Emisive all after
       
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-0.25,0,-5), vec3(2.5,3,2.5)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       VECNULL4,relativeUv(3,3,1,-2,RelativeCords),
       e3,e3,
       e3,e3,
       1, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.boxes[0]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(-2.25,0,-8), vec3(1.5,3,2.5)*0.9 ,   //Pos, Size,
       PIX*Rotate3(PI*-0.3333,Y), vec3(0, 0, 0),
       VECNULL4,e4,
       e4,e4,
       e4,e4,
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[2].part=right_arm.submodels[0].boxes[0]
        break;
    }



    case FALLEN_CHAMPION_LEFT_FEET: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(12,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(8,30,-4,1,RelativeCords), relativeUv(8,30,4,1,RelativeCords), //north west
       relativeUv(16,30,-4,1,RelativeCords), relativeUv(0,30,4,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: u
       //model[2].part=left_shoe.submodels[0].boxes[0]


       APPLY_SHADOW();
       dynamicEmissive=1;

       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-2), vec3(2.4,2.4,2.4) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //up down
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //north west
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[3].part=left_shoe.boxes[1]
        break;
    }

    
    case FALLEN_CHAMPION_RIGHT_FEET: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2),   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(12,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(12,30,4,1,RelativeCords), relativeUv(12,30,-4,1,RelativeCords), //north west
       relativeUv(4,30,4,1,RelativeCords), relativeUv(4,30, -4,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       APPLY_SHADOW();
       dynamicEmissive=1;
       //mirrored?: 
       //model[3].part=right_shoe.boxes[1]
       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-2), vec3(2.4,2.4,2.4) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //up down
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //north west
       relativeUv(1,1,1,1,RelativeCords), relativeUv(1,1,1,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[4].part=right_shoe.boxes[1]
        break;
    }



    
    case FALLEN_CHAMPION_INNER_ARMOR: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-2.9), vec3(4,0.85,2.5) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,8,8,-5,RelativeCords), relativeUv(56,8,8,5,RelativeCords), //up down
       relativeUv(56,13,8,1.7,RelativeCords), relativeUv(43,8,5,1.7,RelativeCords), //north west
       relativeUv(48,13,8,1.7,RelativeCords), relativeUv(43,10,5,1.7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[6].part=waist.boxes[0]

       
       APPLY_SHADOW();
       dynamicEmissive=1;

        vec4 e3 = relativeUv(3,1,1,1,RelativeCords);

       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-2.9), vec3(4.4,1.25,2.9) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       VECNULL4, VECNULL4, //up down
       e3, e3, //north west
       e3, e3, //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[6].part=waist.boxes[0]
        break;
    }

    
    case FALLEN_CHAMPION_LEFT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(2,4,2) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(44,0,4,4,RelativeCords), //up down
       relativeUv(48,0,4,8,RelativeCords), relativeUv(52,0,4,8,RelativeCords), //north west
       relativeUv(60,0,-4,8,RelativeCords), relativeUv(60,0,4,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[7].part=left_leg.boxes[0]


       APPLY_SHADOW();
       dynamicEmissive=1;

        vec4 e2 = relativeUv(1,1,2,1,RelativeCords);


       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-8), vec3(2.775,4.775,2.775) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       VECNULL4,VECNULL4, //up down
       e2, e2, //north west
       e2, e2, //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[7].part=left_leg.boxes[0]
        break;
    }

    
    case FALLEN_CHAMPION_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(2,4,2) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,0,-4,4,RelativeCords), relativeUv(48,0,4,4,RelativeCords), //up down
       relativeUv(60,0,-4,8,RelativeCords), relativeUv(56,0,-4,8,RelativeCords), //north west
       relativeUv(48,0,4,8,RelativeCords), relativeUv(64,0,-4,8,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[8].part=right_leg.boxes[0]
       APPLY_SHADOW();
       dynamicEmissive=1;

        vec4 e2 = relativeUv(1,1,2,1,RelativeCords);


       ADD_BOX_INV_WITH_ROTATION_ROTATE_EMISSIVE(vec3(0,0,-8), vec3(2.775,4.775,2.775) ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       VECNULL4, VECNULL4, //up down
       e2, e2, //north west
       e2, e2, //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored?: 
       //model[7].part=left_leg.boxes[0]
        break;
    }

    

#endif