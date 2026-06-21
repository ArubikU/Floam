#ifdef VSH


if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,SCULK_TERROR_CHESTPLATE);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,SCULK_TERROR_RIGHT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,SCULK_TERROR_LEFT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,SCULK_TERROR_INNER_ARMOR);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,SCULK_TERROR_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,SCULK_TERROR_RIGHT_FEET);
        removeAll=1;
    }
    
}

#endif



#ifdef FSH

    case SCULK_TERROR_RIGHT_ARM:{
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6), vec3(2,4.5,2) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,20,-4,-4,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(44,20,4,9,RelativeCords),  relativeUv(48,20,4,9,RelativeCords), //north west
       relativeUv(56,20,-4,9,RelativeCords),  relativeUv(40,20,4,9,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(3,2,3)*0.75,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(52,12,-6,-6,RelativeCords), relativeUv(58,12,-6,-6,RelativeCords), //up down
       relativeUv(46,12,6,4,RelativeCords),  relativeUv(52,12,6,4,RelativeCords), //north west
       relativeUv(58,12,6,4,RelativeCords),  relativeUv(40,12,6,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.8,0,-4), vec3(1,2,2.5)*0.75,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(39,6,-2,-5,RelativeCords), relativeUv(41,6,-2,-5,RelativeCords), //up down
       relativeUv(37,6,2,4,RelativeCords),  relativeUv(41,6,5,4,RelativeCords), //north west
       relativeUv(39,6,2,4,RelativeCords),  relativeUv(32,6,5,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,2,-6), vec3(1,2,1)*0.75,   //Pos, Size,
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(60,2,-2,-2,RelativeCords), relativeUv(62,2,-2,-2,RelativeCords), //up down
       relativeUv(60,2,-2,4,RelativeCords),  relativeUv(56,2,2,4,RelativeCords), //north west
       relativeUv(62,2,2,4,RelativeCords),  relativeUv(62,2,-2,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       break;
    }
    case SCULK_TERROR_LEFT_ARM:{
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-6), vec3(2,4.5,2) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(48,20,-4,-4,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
      relativeUv(56,20,-4,9,RelativeCords),relativeUv(40,20,4,9,RelativeCords), relativeUv(44,20,4,9,RelativeCords),  relativeUv(48,20,4,9,RelativeCords) //north west
       , //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-8), vec3(3,2,3)*0.75,   //Pos, Size,
       PIX*PIY12*PIZ2, vec3(0, 0, 0),
       relativeUv(46,12,6,-6,RelativeCords), relativeUv(58,6,-6,6,RelativeCords), //up down
       relativeUv(52,12,-6,4,RelativeCords),  relativeUv(40,12,6,4,RelativeCords), //north west
       relativeUv(64,12,-6,4,RelativeCords),  relativeUv(52,12,6,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1.8,0,-4), vec3(1,2,2.5)*0.75,   //Pos, Size,
       PIX*NIY12*PIZ2, vec3(0, 0, 0),
       relativeUv(37,6,2,-5,RelativeCords), relativeUv(39,6,2,-5,RelativeCords), //up down
       relativeUv(39,6,-2,4,RelativeCords),  relativeUv(32,6,5,4,RelativeCords), //north west
       relativeUv(41,6,-2,4,RelativeCords),  relativeUv(41,6,5,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-2,-6), vec3(1,2,1)*0.75,   //Pos, Size,
       PIX*PIX12*PIZ2, vec3(0, 0, 0),
       relativeUv(58,2,2,-2,RelativeCords), relativeUv(60,2,2,-2,RelativeCords), //up down
       relativeUv(60,2,-2,4,RelativeCords),  relativeUv(56,2,2,4,RelativeCords), //north west
       relativeUv(62,2,2,4,RelativeCords),  relativeUv(62,2,-2,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       break;
    }
    case SCULK_TERROR_CHESTPLATE:{
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-5.5), vec3(4,5,2) *0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(20,20,8,-4,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(20,20,8,10,RelativeCords),  relativeUv(16,20,4,10,RelativeCords), //north west
       relativeUv(40,20,-8,10,RelativeCords),  relativeUv(28,20,4,10,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,1.5,-6.25), vec3(0.5,6,1.5) *0.8,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(27,1,1,3,RelativeCords), relativeUv(28,1,1,3,RelativeCords), //up down
       relativeUv(27,4,1,12,RelativeCords),  relativeUv(24,4,3,12,RelativeCords), //north west
       relativeUv(29,4,1,12,RelativeCords),  relativeUv(31,4,-3,12,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.75,1.5,-8.25), vec3(2,3,1) *0.8,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(14,8,4,2,RelativeCords), relativeUv(18,8,4,2,RelativeCords), //up down
       relativeUv(14,10,4,6,RelativeCords),  relativeUv(12,10,2,6,RelativeCords), //north west
       relativeUv(20,10,4,6,RelativeCords),  relativeUv(18,10,2,6,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       
       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2.75,1.5,-8.25), vec3(2,3,1) *0.8,   //Pos, Size,
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(18,8,-4,2,RelativeCords), relativeUv(22,8,-4,2,RelativeCords), //up down
       relativeUv(18,10,-4,6,RelativeCords),  relativeUv(18,10,2,6,RelativeCords), //north west
       relativeUv(24,10,-4,6,RelativeCords),  relativeUv(12,10,2,6,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);


       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.5,-2,-3), vec3(2.5,0,2) *0.75,   //Pos, Size,
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(12,5,5,-4,RelativeCords), relativeUv(12,5,5,-4,RelativeCords), //up down
       relativeUv(20,20,8,10,RelativeCords),  relativeUv(16,20,4,10,RelativeCords), //north west
       relativeUv(40,20,-8,10,RelativeCords),  relativeUv(28,20,4,10,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2.5,-2,-5), vec3(2.5,0,2) *0.75,   //Pos, Size,
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(12,5,5,-4,RelativeCords), relativeUv(12,5,5,-4,RelativeCords), //up down
       relativeUv(20,20,8,10,RelativeCords),  relativeUv(16,20,4,10,RelativeCords), //north west
       relativeUv(40,20,-8,10,RelativeCords),  relativeUv(28,20,4,10,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2.5,-2,-3), vec3(2.5,0,2) *0.75,   //Pos, Size,
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(17,5,-5,-4,RelativeCords), relativeUv(17,5,-5,-4,RelativeCords), //up down
       relativeUv(20,20,8,10,RelativeCords),  relativeUv(16,20,4,10,RelativeCords), //north west
       relativeUv(40,20,-8,10,RelativeCords),  relativeUv(28,20,4,10,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2.5,-2,-5), vec3(2.5,0,2) *0.75,   //Pos, Size,
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(17,5,-5,-4,RelativeCords), relativeUv(17,5,-5,-4,RelativeCords), //up down
       relativeUv(20,20,8,10,RelativeCords),  relativeUv(16,20,4,10,RelativeCords), //north west
       relativeUv(40,20,-8,10,RelativeCords),  relativeUv(28,20,4,10,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);



       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2,3.5,-8), vec3(1,2,1.5) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(3,12,2,-3,RelativeCords), relativeUv(5,12,2,-3,RelativeCords), //up down
       relativeUv(0,0,0,0,RelativeCords),  relativeUv(0,12,3,4,RelativeCords), //north west
       relativeUv(8,12,2,4,RelativeCords),  relativeUv(8,12,-3,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2,3.5,-8), vec3(1,2,1.5) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,12,-2,-3,RelativeCords), relativeUv(7,12,-2,-3,RelativeCords), //up down
       relativeUv(0,0,0,0,RelativeCords),  relativeUv(8,12,-3,4,RelativeCords), //north west
       relativeUv(10,12,-2,4,RelativeCords),  relativeUv(0,12,3,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-2,4.5,-6.5), vec3(2,3,1) *0.75,   //Pos, Size,
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(2,1,4,2,RelativeCords), relativeUv(6,1,4,2,RelativeCords), //up down
       relativeUv(6,3,-4,6,RelativeCords),  relativeUv(0,3,2,6,RelativeCords), //north west
       relativeUv(8,3,4,6,RelativeCords),  relativeUv(8,3,-2,6,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(2,4.5,-6.5), vec3(2,3,1) *0.75,   //Pos, Size,
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(6,1,-4,2,RelativeCords), relativeUv(10,1,-4,2,RelativeCords), //up down
       relativeUv(2,3,4,6,RelativeCords),  relativeUv(8,3,-2,6,RelativeCords), //north west
       relativeUv(12,3,-4,6,RelativeCords),  relativeUv(0,3,2,6,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       break;
    }
    case SCULK_TERROR_INNER_ARMOR: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-1.2), vec3(4.5,1.5,2.5)*0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(5,5,9,-5,RelativeCords), //up down
       relativeUv(5,5,9,3,RelativeCords),  relativeUv(23,5,5,3,RelativeCords), //north west
       relativeUv(23,5,-9,3,RelativeCords),  relativeUv(0,5,5,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(3.5,0,-2.4), vec3(1.5,1.5,2)*0.8,   //Pos, Size,
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(57,0,-3,4,RelativeCords), relativeUv(57,0,3,4,RelativeCords), //up down
       relativeUv(54,4,3,3,RelativeCords),  relativeUv(57,4,4,3,RelativeCords), //north west
       relativeUv(50,4,4,3,RelativeCords),  relativeUv(61,4,3,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-3.5,0,-2.4), vec3(1.5,1.5,2)*0.8,   //Pos, Size,
       PIX*PIY12*PIX2, vec3(0, 0, 0),
       relativeUv(57,0,-3,4,RelativeCords), relativeUv(57,0,3,4,RelativeCords), //up down
       relativeUv(54,4,3,3,RelativeCords),  relativeUv(57,4,4,3,RelativeCords), //north west
       relativeUv(50,4,4,3,RelativeCords),  relativeUv(61,4,3,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);


       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,2.5,-1.4), vec3(1,2,1)*0.8,   //Pos, Size,
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(41,4,2,-2,RelativeCords), relativeUv(43,2,2,2,RelativeCords), //up down
       relativeUv(41,4,2,4,RelativeCords),  relativeUv(45,4,-2,4,RelativeCords), //north west
       relativeUv(45,4,2,4,RelativeCords),  relativeUv(39,4,2,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,3.5,0.6), vec3(0,1.5,1)*0.8,   //Pos, Size,
       PIX*NIX25, vec3(0, 0, 0),
       relativeUv(41,4,2,-2,RelativeCords), relativeUv(43,2,2,2,RelativeCords), //up down
       relativeUv(41,4,2,4,RelativeCords),  relativeUv(43,11,-2,3,RelativeCords), //north west
       relativeUv(45,4,2,4,RelativeCords),  relativeUv(39,11,2,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       break;

    }
    case SCULK_TERROR_LEFT_FEET: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,-3,-2), vec3(0,2.5,1.5)*0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(40,11,-3,5,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(34,11,3,5,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);



       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1,-2.5,-1.5), vec3(0,1.5,1) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(35,2,2,3,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(33,2,2,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,-2.5,-1.5), vec3(0,1.5,1) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(35,2,2,3,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(33,2,2,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-2), vec3(2,2,2)*0.9,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(0,0,0,0,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(8,28,-4,4,RelativeCords),  relativeUv(8,28,4,4,RelativeCords), //north west
       relativeUv(12,28,4,4,RelativeCords),  relativeUv(0,28,4,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       break;
    }
    case SCULK_TERROR_RIGHT_FEET: {
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,3,-2), vec3(0,2.5,1.5) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(37,11,3,5,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(37,11,-3,5,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);



       ADD_BOX_WITH_ROTATION_ROTATE(vec3(-1,2.5,-1.5), vec3(0,1.5,1) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(35,2,-2,3,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(35,2,2,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);
       ADD_BOX_WITH_ROTATION_ROTATE(vec3(1,2.5,-1.5), vec3(0,1.5,1) *0.75,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(5,5,9,-5,RelativeCords), relativeUv(0,0,0,0,RelativeCords), //up down
       relativeUv(34,11,3,5,RelativeCords),  relativeUv(35,2,-2,3,RelativeCords), //north west
       relativeUv(37,11,3,5,RelativeCords),  relativeUv(35,2,2,3,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       ADD_BOX_WITH_ROTATION_ROTATE(vec3(0,0,-2), vec3(2,2,2)*0.9,   //Pos, Size,
       PIX, vec3(0, 0, 0),
       relativeUv(0,0,0,0,RelativeCords), relativeUv(8,16,4,4,RelativeCords), //up down
       relativeUv(12,28,4,4,RelativeCords),  relativeUv(12,28,-4,4,RelativeCords), //north west
       relativeUv(8,28,-4,4,RelativeCords),  relativeUv(4,28,-4,4,RelativeCords), //south east
       2, 0,
       2, 2,
       2, 2);

       
       break;
    }

#endif
