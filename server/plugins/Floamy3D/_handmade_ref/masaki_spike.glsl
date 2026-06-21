#ifdef VSH

if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,MASAKI_SPIKE_CHESTPLATE);
        //removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,MASAKI_SPIKE_RIGHT_ARM);
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,MASAKI_SPIKE_LEFT_ARM);
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,MASAKI_SPIKE_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,MASAKI_SPIKE_RIGHT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_LEG) {
        removeAll=1;
        cems = addCem(cems,MASAKI_SPIKE_RIGHT_LEG);
    }
     if(cube==STASIS_LEFT_LEG) {
        removeAll=1;
         cems = addCem(cems,MASAKI_SPIKE_LEFT_LEG);
    }
    
}
#endif




#ifdef FSH

    case MASAKI_SPIKE_CHESTPLATE: {

       //ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4,6,2)*0.8 ,   //Pos, Size,
       //PIX, vec3(0, 0, 0),
       //relativeUv(28,20,-8,-4,RelativeCords), relativeUv(36,16,-8,4,RelativeCords), //down up
       //relativeUv(20,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords) , //north east
       //relativeUv(32,20,8,12,RelativeCords),  relativeUv(28,20,4,12,RelativeCords), //south west
       //2, 2,
       //2, 2,
       //2, 2);


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0.7225,-2.06,-5), vec3(1.25,6,0.5)*0.75 ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(27,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(24,20,3,12,RelativeCords), relativeUv(24,20,1,12,RelativeCords) , //north east
       relativeUv(21,20,3,12,RelativeCords),  relativeUv(31,20,1,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.7225,-2.06,-5), vec3(1.25,6,0.5)*0.75 ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(24,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(27,20,-3,12,RelativeCords), relativeUv(25,20,-1,12,RelativeCords) , //north east
       relativeUv(24,20,-3,12,RelativeCords),  relativeUv(32,20,-1,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);
//


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(3,-2.66,-6.25), vec3(0,6,1.125)*0.6 ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(24,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(27,20,-3,12,RelativeCords), relativeUv(35,0,2,12,RelativeCords) , //north east
       relativeUv(24,20,-3,12,RelativeCords),  relativeUv(35,0,2,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,-2.66,-6.25), vec3(0,6,1.125)*0.6 ,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(24,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(27,20,-3,12,RelativeCords), relativeUv(32,0,2,12,RelativeCords) , //north east
       relativeUv(24,20,-3,12,RelativeCords),  relativeUv(32,0,2,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3,-2.66,-6.25), vec3(0,6,1.125)*0.6 ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(24,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(27,20,-3,12,RelativeCords), relativeUv(35,0,2,12,RelativeCords) , //north east
       relativeUv(24,20,-3,12,RelativeCords),  relativeUv(35,0,2,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1,-2.66,-6.25), vec3(0,6,1.125)*0.6 ,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(24,21,-3,-1,RelativeCords), relativeUv(23,31,-3,1,RelativeCords), //down up
       relativeUv(27,20,-3,12,RelativeCords), relativeUv(32,0,2,12,RelativeCords) , //north east
       relativeUv(24,20,-3,12,RelativeCords),  relativeUv(32,0,2,12,RelativeCords), //south west
       2, 2,
       2, 2,
       2, 2);

       //

        break;
    }

    
    case MASAKI_SPIKE_RIGHT_ARM: {

      //ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
      //PIX, vec3(0, 0, 0),
      //relativeUv(48,20,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
      //relativeUv(44,20,4,12,RelativeCords),  relativeUv(48,20,4,12,RelativeCords), //north west
      //relativeUv(52,20,4,12,RelativeCords),  relativeUv(40,20,4,12,RelativeCords), //south east
      //2, 2,
      //2, 2,
      //2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-9.5), vec3(2.125,1.5,2.125)*0.95,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(48,20,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(44,20,4,3,RelativeCords),  relativeUv(48,20,4,3,RelativeCords), //north west
       relativeUv(52,20,4,3,RelativeCords),  relativeUv(40,20,4,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.5,0,-10.5), vec3(1.5,2.75,2)*0.95,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0), //PIY12
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(44,4,4,6,RelativeCords),  relativeUv(48,4,4,6,RelativeCords), //north west
       relativeUv(44,4,4,6,RelativeCords),  relativeUv(40,4,4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5,0.8,-9.5), vec3(1,4.5,0)*0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(48,4,4,6,RelativeCords), //north west
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(40,4,4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5,-0.8,-9.5), vec3(1,4.5,0)*0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(48,4,4,6,RelativeCords), //north west
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(40,4,4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case MASAKI_SPIKE_LEFT_ARM: {


       //ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
       //PIX, vec3(0, 0, 0),
       //relativeUv(44,20,4,-4,RelativeCords), relativeUv(48,16,4,4,RelativeCords), //up down
       //relativeUv(48,20,-4,12,RelativeCords),  relativeUv(52,20,-4,12,RelativeCords), //north west
       //relativeUv(56,20,-4,12,RelativeCords),  relativeUv(44,20,-4,12,RelativeCords), //south east
       //2, 2,
       //2, 2,
       //2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-9.5), vec3(2.125,1.5,2.125)*0.95,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(44,20,4,-4,RelativeCords), relativeUv(48,16,4,4,RelativeCords), //up down
       relativeUv(48,20,-4,3,RelativeCords),  relativeUv(52,20,-4,3,RelativeCords), //north west
       relativeUv(56,20,-4,3,RelativeCords),  relativeUv(44,20,-4,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-0.5,0,-10.5), vec3(1.5,2.75,2)*0.95,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(48,16,4,4,RelativeCords), //up down
       relativeUv(44,4,4,6,RelativeCords),  relativeUv(52,4,-4,6,RelativeCords), //north west
       relativeUv(44,4,4,6,RelativeCords),  relativeUv(44,4,-4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       

       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5,0.8,-9.5), vec3(1,4.5,0)*0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(48,4,4,6,RelativeCords), //north west
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(40,4,4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-2.5,-0.8,-9.5), vec3(1,4.5,0)*0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,4,-4,-4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(48,4,4,6,RelativeCords), //north west
       relativeUv(39,0,-2,9,RelativeCords),  relativeUv(40,4,4,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    
    
    case MASAKI_SPIKE_RIGHT_FEET: {

       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(12,20,4,12,RelativeCords),  relativeUv(8,20,4,12,RelativeCords), //north west
       relativeUv(4,20,4,12,RelativeCords),  relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-1), vec3(2.25,1,2.25)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(12,30,4,2,RelativeCords),  relativeUv(8,30,4,2,RelativeCords), //north west
       relativeUv(4,30,4,2,RelativeCords),  relativeUv(0,30,4,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

    break;
    }
    case MASAKI_SPIKE_LEFT_FEET: {


       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(8,20,-4,12,RelativeCords),  relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(16,20,-4,12,RelativeCords),  relativeUv(4,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-1), vec3(2.25,1,2.25)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(8,30,-4,2,RelativeCords),  relativeUv(12,30,-4,2,RelativeCords), //north west
       relativeUv(16,30,-4,2,RelativeCords),  relativeUv(4,30,-4,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

    break;
    }

    
    
    case MASAKI_SPIKE_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(16,20,-4,12,RelativeCords),  relativeUv(8,20,4,12,RelativeCords), //north west
       relativeUv(4,20,4,12,RelativeCords),  relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1,0,-7.5), vec3(2,2.25,2.25)*0.85,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(16,20,-4,5,RelativeCords),  relativeUv(8,20,4,5,RelativeCords), //north west
       relativeUv(4,20,4,5,RelativeCords),  relativeUv(0,20,4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       
    break;
    }
    case MASAKI_SPIKE_LEFT_LEG: {


       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(0,0,-5), vec3(2,6,2)*0.85,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,20,4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(4,20,4,12,RelativeCords),  relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(16,20,-4,12,RelativeCords),  relativeUv(4,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE_NO_TRANSPARENCY(vec3(-1,0,-7.5), vec3(2,2.25,2.25)*0.85,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(8,20,-4,-4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(4,20,4,5,RelativeCords),  relativeUv(12,20,-4,5,RelativeCords), //north west
       relativeUv(16,20,-4,5,RelativeCords),  relativeUv(4,20,-4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       

    break;
    }

#endif
