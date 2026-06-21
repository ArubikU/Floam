#ifdef VSH


if(getChannel(RelativeCords,ivec2(63,31), 0) == <internal-id.r>
&& getChannel(RelativeCords,ivec2(63,31), 1) == <internal-id.g>
&& getChannel(RelativeCords,ivec2(63,31), 2) == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ARMOR4_CHESTPLATE);
        removeAll=1;
    }
   if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ARMOR4_RIGHT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ARMOR4_LEFT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ARMOR4_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ARMOR4_RIGHT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_LEG) {
        removeAll=1;
        cems = addCem(cems,ARMOR4_RIGHT_LEG);
    }
     if(cube==STASIS_LEFT_LEG) {
        removeAll=1;
         cems = addCem(cems,ARMOR4_LEFT_LEG);
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ARMOR4_INNER_ARMOR);
        removeAll=1;
    }
}
#endif



#ifdef FSH

    case ARMOR4_CHESTPLATE: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4,6,2)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-1.75,-8.2), vec3(5,2.5,0.5)*0.64 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(43,10,10,1,RelativeCords), relativeUv(53,10,10,1,RelativeCords), //up down
       relativeUv(43,11,10,5,RelativeCords), relativeUv(53,11,1,5,RelativeCords), //north west
       relativeUv(54,11,10,5,RelativeCords), relativeUv(42,11,1,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-1.4,-7), vec3(2,2,1.5)*0.63 ,   //Pos, Size,
       PIX*PIX12*NIY25*NIZ12*NIX25, vec3(0, 0, 0),
       relativeUv(37,11,-4,-1,RelativeCords), relativeUv(41,10,-4,1,RelativeCords), //up down
       relativeUv(33,11,4,4,RelativeCords), relativeUv(37,11,1,4,RelativeCords), //north west
       relativeUv(38,11,4,4,RelativeCords), relativeUv(32,11,1,4,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR4_LEFT_FEET: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0.1,0,-6), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(8,20,-4,12,RelativeCords), relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(16,20,-4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
        break;
    }

    
    case ARMOR4_RIGHT_FEET: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.1,0,-6), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(12,20,4,12,RelativeCords), relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(4,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR4_LEFT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,16,-4,4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(48,20,-4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords), //north west
       relativeUv(56,20,-4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);

       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-4), vec3(1,1.5,2)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(58,0,-2,4,RelativeCords), relativeUv(60,0,-2,4,RelativeCords), //up down
       relativeUv(58,4,-2,3,RelativeCords), relativeUv(62,4,-4,3,RelativeCords), //north west
       relativeUv(64,4,-2,3,RelativeCords), relativeUv(56,4,-4,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.5,0,-5.1), vec3(1.5,2,1.5)*0.62 ,   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(26,1,-3,3,RelativeCords), relativeUv(29,1,-3,3,RelativeCords), //up down
       relativeUv(26,4,-3,4,RelativeCords), relativeUv(29,4,-3,4,RelativeCords), //north west
       relativeUv(32,4,-3,4,RelativeCords), relativeUv(23,4,-3,4,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
        break;
    }

    
    case ARMOR4_RIGHT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(44,16,4,4,RelativeCords), relativeUv(48,16,4,4,RelativeCords), //up down
       relativeUv(44,20,4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords), //north west
       relativeUv(52,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-4), vec3(1,1.5,2)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(58,0,-2,4,RelativeCords), relativeUv(60,0,-2,4,RelativeCords), //up down
       relativeUv(58,4,-2,3,RelativeCords), relativeUv(62,4,-4,3,RelativeCords), //north west
       relativeUv(64,4,-2,3,RelativeCords), relativeUv(56,4,-4,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.5,0,-5.1), vec3(1.5,2,1.5)*0.62 ,   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(26,1,-3,3,RelativeCords), relativeUv(29,1,-3,3,RelativeCords), //up down
       relativeUv(23,4,3,4,RelativeCords), relativeUv(29,4,-3,4,RelativeCords), //north west
       relativeUv(32,4,-3,4,RelativeCords), relativeUv(23,4,-3,4,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-9.8), vec3(1,1.5,1)*0.79 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(2,0,2,2,RelativeCords), relativeUv(4,0,2,2,RelativeCords), //up down
       relativeUv(2,2,2,3,RelativeCords), relativeUv(4,2,2,3,RelativeCords), //north west
       relativeUv(6,2,2,3,RelativeCords), relativeUv(0,2,2,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(2.5,2.5,2.5)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(37,0,5,5,RelativeCords), relativeUv(42,0,5,5,RelativeCords), //up down
       relativeUv(37,5,5,5,RelativeCords), relativeUv(42,5,5,5,RelativeCords), //north west
       relativeUv(47,5,5,5,RelativeCords), relativeUv(32,5,5,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

    
    case ARMOR4_INNER_ARMOR: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4,6,2)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR4_LEFT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0.1,0,-6), vec3(2,6,2)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(8,20,-4,12,RelativeCords), relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(16,20,-4,12,RelativeCords), relativeUv(4,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-8), vec3(1,3,3)*0.81 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(56,0,-2,6,RelativeCords), relativeUv(58,0,-2,6,RelativeCords), //up down
       relativeUv(54,6,2,6,RelativeCords), relativeUv(62,6,-6,6,RelativeCords), //north west
       relativeUv(64,6,-2,6,RelativeCords), relativeUv(54,6,-6,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
        break;
    }

    
    case ARMOR4_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.1,0,-6), vec3(2,6,2)*0.81 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(4,20,4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords), //north west
       relativeUv(12,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.25,0,-8), vec3(1,3,3)*0.81 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(56,0,-2,6,RelativeCords), relativeUv(56,0,2,6,RelativeCords), //up down
       relativeUv(54,6,2,6,RelativeCords), relativeUv(56,6,6,6,RelativeCords), //north west
       relativeUv(64,6,-2,6,RelativeCords), relativeUv(48,6,6,6,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    

#endif
