#ifdef VSH


if(getChannel(RelativeCords,ivec2(63,31), 0) == <internal-id.r>
&& getChannel(RelativeCords,ivec2(63,31), 1) == <internal-id.g>
&& getChannel(RelativeCords,ivec2(63,31), 2) == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ARMOR5_CHESTPLATE);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ARMOR5_RIGHT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ARMOR5_LEFT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ARMOR5_INNER_ARMOR);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ARMOR5_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ARMOR5_RIGHT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ARMOR5_LEFT_LEG);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ARMOR5_RIGHT_LEG);
        removeAll=1;
    }
    
}

#endif




#ifdef FSH

    case ARMOR5_CHESTPLATE: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2,-8.2), vec3(5,2.5,1)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(42,0,10,2,RelativeCords), relativeUv(52,0,10,2,RelativeCords), //up down
       relativeUv(42,2,10,5,RelativeCords), relativeUv(52,2,2,5,RelativeCords), //north west
       relativeUv(54,2,10,5,RelativeCords), relativeUv(40,2,2,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-3,-8.1), vec3(2,2.5,0.5)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(30,10,4,1,RelativeCords), relativeUv(34,10,4,1,RelativeCords), //up down
       relativeUv(30,11,4,5,RelativeCords), relativeUv(34,11,1,5,RelativeCords), //north west
       relativeUv(35,11,4,5,RelativeCords), relativeUv(29,11,1,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR5_LEFT_FEET: {

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

    case ARMOR5_RIGHT_FEET: {

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


    
    case ARMOR5_LEFT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,16,-4,4,RelativeCords), relativeUv(52,16,-4,4,RelativeCords), //up down
       relativeUv(48,20,-4,12,RelativeCords), relativeUv(52,20,-4,12,RelativeCords), //north west
       relativeUv(56,20,-4,12,RelativeCords), relativeUv(44,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.15,0,-0.8), vec3(1,1,1)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(46,7,-2,2,RelativeCords), relativeUv(48,7,-2,2,RelativeCords), //up down
       relativeUv(46,9,-2,2,RelativeCords), relativeUv(48,9,-2,2,RelativeCords), //north west
       relativeUv(50,9,-2,2,RelativeCords), relativeUv(44,9,-2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.15,0,-7.5), vec3(1,0.5,1)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(60,8,-2,2,RelativeCords), relativeUv(62,8,-2,2,RelativeCords), //up down
       relativeUv(60,10,-2,1,RelativeCords), relativeUv(62,10,-2,1,RelativeCords), //north west
       relativeUv(64,10,-2,1,RelativeCords), relativeUv(58,10,-2,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u


       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.25,0,-10), vec3(0.5,1,2.5)*0.67 ,   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(31,0,-1,5,RelativeCords), relativeUv(32,0,-1,5,RelativeCords), //up down
       relativeUv(31,5,-1,2,RelativeCords), relativeUv(36,5,-5,2,RelativeCords), //north west
       relativeUv(37,5,-1,2,RelativeCords), relativeUv(30,5,-5,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1,0,-11), vec3(0.5,1,1)*0.62 ,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(53,7,-1,2,RelativeCords), relativeUv(54,7,-1,2,RelativeCords), //up down
       relativeUv(53,9,-1,2,RelativeCords), relativeUv(55,9,-2,2,RelativeCords), //north west
       relativeUv(56,9,-1,2,RelativeCords), relativeUv(52,9,-2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-9.25), vec3(1,2.5,2)*0.62 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(58,11,-2,4,RelativeCords), relativeUv(60,11,-2,4,RelativeCords), //up down
       relativeUv(58,15,-2,5,RelativeCords), relativeUv(62,15,-4,5,RelativeCords), //north west
       relativeUv(64,15,-2,5,RelativeCords), relativeUv(56,15,-4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
        break;
    }

    
    case ARMOR5_RIGHT_ARM: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,16,-4,4,RelativeCords), relativeUv(48,16,4,4,RelativeCords), //up down
       relativeUv(44,20,4,12,RelativeCords), relativeUv(48,20,4,12,RelativeCords), //north west
       relativeUv(52,20,4,12,RelativeCords), relativeUv(40,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.15,0,-7.5), vec3(1,0.5,1)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(58,8,2,2,RelativeCords), relativeUv(60,8,2,2,RelativeCords), //up down
       relativeUv(58,10,2,1,RelativeCords), relativeUv(60,10,2,1,RelativeCords), //north west
       relativeUv(62,10,2,1,RelativeCords), relativeUv(56,10,2,1,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.12,0,-0.8), vec3(1,1,1)*0.62 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(44,7,2,2,RelativeCords), relativeUv(46,7,2,2,RelativeCords), //up down
       relativeUv(44,9,2,2,RelativeCords), relativeUv(46,9,2,2,RelativeCords), //north west
       relativeUv(48,9,2,2,RelativeCords), relativeUv(42,9,2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       

       
       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1.25,0,-10), vec3(0.5,1,2.5)*0.67 ,   //Pos, Size,
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(31,0,-1,5,RelativeCords), relativeUv(32,0,-1,5,RelativeCords), //up down
       relativeUv(31,5,-1,2,RelativeCords), relativeUv(36,5,-5,2,RelativeCords), //north west
       relativeUv(37,5,-1,2,RelativeCords), relativeUv(30,5,-5,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1,0,-11), vec3(0.5,1,1)*0.62 ,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(53,7,-1,2,RelativeCords), relativeUv(54,7,-1,2,RelativeCords), //up down
       relativeUv(53,9,-1,2,RelativeCords), relativeUv(55,9,-2,2,RelativeCords), //north west
       relativeUv(56,9,-1,2,RelativeCords), relativeUv(52,9,-2,2,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-9.25), vec3(1,2.5,2)*0.62 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(58,11,-2,4,RelativeCords), relativeUv(60,11,-2,4,RelativeCords), //up down
       relativeUv(58,15,-2,5,RelativeCords), relativeUv(62,15,-4,5,RelativeCords), //north west
       relativeUv(64,15,-2,5,RelativeCords), relativeUv(56,15,-4,5,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR5_INNER_ARMOR: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(4,6,2)*0.8 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,16,8,4,RelativeCords), relativeUv(28,16,8,4,RelativeCords), //up down
       relativeUv(20,20,8,12,RelativeCords), relativeUv(28,20,4,12,RelativeCords), //north west
       relativeUv(32,20,8,12,RelativeCords), relativeUv(16,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2,-2), vec3(1.5,1.5,0.5)*0.62 ,   //Pos, Size,
       PIX*NIY25, vec3(0, 0, 0),
       relativeUv(57,0,3,1,RelativeCords), relativeUv(60,0,3,1,RelativeCords), //up down
       relativeUv(57,1,3,3,RelativeCords), relativeUv(60,1,1,3,RelativeCords), //north west
       relativeUv(64,1,-3,3,RelativeCords), relativeUv(56,1,1,3,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3,-2,-1.5), vec3(1,2,0.5)*0.62 ,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(3,0,-2,1,RelativeCords), relativeUv(5,0,-2,1,RelativeCords), //up down
       relativeUv(3,1,-2,4,RelativeCords), relativeUv(4,1,-1,4,RelativeCords), //north west
       relativeUv(6,1,-2,4,RelativeCords), relativeUv(1,1,-1,4,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(3,-2,-1.5), vec3(1,2,0.5)*0.62 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(1,0,2,1,RelativeCords), relativeUv(3,0,2,1,RelativeCords), //up down
       relativeUv(1,1,2,4,RelativeCords), relativeUv(3,1,1,4,RelativeCords), //north west
       relativeUv(4,1,2,4,RelativeCords), relativeUv(0,1,1,4,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
        break;
    }

    
    case ARMOR5_LEFT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0.1,0,-6), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(8,16,-4,4,RelativeCords), relativeUv(12,16,-4,4,RelativeCords), //up down
       relativeUv(8,20,-4,12,RelativeCords), relativeUv(12,20,-4,12,RelativeCords), //north west
       relativeUv(16,20,-4,12,RelativeCords), relativeUv(4,20,-4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-8), vec3(0.9,3.9,2.4)*0.79 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(55,0,-1,4,RelativeCords), relativeUv(56,0,-1,4,RelativeCords), //up down
       relativeUv(55,4,-1,7,RelativeCords), relativeUv(59,4,-4,7,RelativeCords), //north west
       relativeUv(60,4,-1,7,RelativeCords), relativeUv(54,4,-4,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored u
        break;
    }

    
    case ARMOR5_RIGHT_LEG: {

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-0.1,0,-6), vec3(2,6,2)*0.79 ,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(4,16,4,4,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(4,20,4,12,RelativeCords), relativeUv(8,20,4,12,RelativeCords), //north west
       relativeUv(12,20,4,12,RelativeCords), relativeUv(0,20,4,12,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       //mirrored 
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.5,0,-8), vec3(0.9,3.9,2.4)*0.79 ,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(54,0,1,4,RelativeCords), relativeUv(55,0,1,4,RelativeCords), //up down
       relativeUv(54,4,1,7,RelativeCords), relativeUv(55,4,4,7,RelativeCords), //north west
       relativeUv(59,4,1,7,RelativeCords), relativeUv(50,4,4,7,RelativeCords), //south east
       2, 2,
       2, 2,
       2, 2);
       ////mirrored 
        break;
    }

    

#endif
