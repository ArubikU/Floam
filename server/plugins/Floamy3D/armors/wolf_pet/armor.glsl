
#ifdef FSH

    case ZEKERN_WOLF_PET_CHESTPLATE: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-6.5,-1,-14), vec3(1.5,3.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(110,12,-6,-12,RelativeCords), relativeUv(116,0,-6,12,RelativeCords), // up down
       relativeUv(104,12,6,14,RelativeCords), relativeUv(110,12,12,14,RelativeCords), // north west
       relativeUv(122,12,6,14,RelativeCords), relativeUv(92,12,12,14,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(6.5,-1,-14), vec3(1.5,3.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(104,12,6,-12,RelativeCords), relativeUv(110,0,6,12,RelativeCords), // up down
       relativeUv(110,12,-6,14,RelativeCords), relativeUv(104,12,-12,14,RelativeCords), // north west
       relativeUv(128,12,-6,14,RelativeCords), relativeUv(122,12,-12,14,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,5,-17), vec3(5,1.5,1.5)*1.75,   // Pos, Size
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(26,6,-20,-6,RelativeCords), relativeUv(46,0,-20,6,RelativeCords), // up down
       relativeUv(6,6,20,6,RelativeCords), relativeUv(26,6,6,6,RelativeCords), // north west
       relativeUv(32,6,20,6,RelativeCords), relativeUv(0,6,6,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-4,-6.5,-14), vec3(1.5,3.5,0)*1.75,   // Pos, Size
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(86,0,-6,0,RelativeCords), relativeUv(92,0,-6,0,RelativeCords), // up down
       relativeUv(80,0,6,14,RelativeCords), relativeUv(86,0,0,14,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(80,0,0,14,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(4,-6.5,-14), vec3(1.5,3.5,0)*1.75,   // Pos, Size
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(80,0,6,0,RelativeCords), relativeUv(86,0,6,0,RelativeCords), // up down
       relativeUv(86,0,-6,14,RelativeCords), relativeUv(80,0,0,14,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(86,0,0,14,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,7.25,-22.75), vec3(6,1.5,0)*1.75,   // Pos, Size
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(104,26,-24,0,RelativeCords), relativeUv(128,26,-24,0,RelativeCords), // up down
       relativeUv(80,26,24,6,RelativeCords), relativeUv(104,26,0,6,RelativeCords), // north west
       relativeUv(104,26,24,6,RelativeCords), relativeUv(80,26,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-6,0,-20), vec3(1.5,0,3)*1.75,   // Pos, Size
       PIX*NIX12*NIY25, vec3(0, 0, 0),
       relativeUv(116,12,6,-12,RelativeCords), relativeUv(122,0,6,12,RelativeCords), // up down
       relativeUv(122,12,-6,0,RelativeCords), relativeUv(116,12,-12,0,RelativeCords), // north west
       relativeUv(140,12,-6,0,RelativeCords), relativeUv(134,12,-12,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(6,0,-20), vec3(1.5,0,3)*1.75,   // Pos, Size
       PIX*NIX12*PIY25, vec3(0, 0, 0),
       relativeUv(122,12,-6,-12,RelativeCords), relativeUv(128,0,-6,12,RelativeCords), // up down
       relativeUv(116,12,6,0,RelativeCords), relativeUv(122,12,12,0,RelativeCords), // north west
       relativeUv(134,12,6,0,RelativeCords), relativeUv(104,12,12,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(6,3,-20), vec3(2.5,0,2)*1.75,   // Pos, Size
       PIX*NIX25*PIY25, vec3(0, 0, 0),
       relativeUv(70,8,-10,-8,RelativeCords), relativeUv(80,0,-10,8,RelativeCords), // up down
       relativeUv(60,8,10,0,RelativeCords), relativeUv(70,8,8,0,RelativeCords), // north west
       relativeUv(78,8,10,0,RelativeCords), relativeUv(52,8,8,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-6,3,-20), vec3(2.5,0,2)*1.75,   // Pos, Size
       PIX*NIX25*NIY25, vec3(0, 0, 0),
       relativeUv(60,8,10,-8,RelativeCords), relativeUv(70,0,10,8,RelativeCords), // up down
       relativeUv(70,8,-10,0,RelativeCords), relativeUv(60,8,-8,0,RelativeCords), // north west
       relativeUv(88,8,-10,0,RelativeCords), relativeUv(78,8,-8,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_LEFT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(8,40,8,-8,RelativeCords), relativeUv(16,32,8,8,RelativeCords), // up down
       relativeUv(16,40,-8,24,RelativeCords), relativeUv(8,40,-8,24,RelativeCords), // north west
       relativeUv(32,40,-8,24,RelativeCords), relativeUv(24,40,-8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);       



       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5,5,-2.5), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(4,12,0,-4,RelativeCords), relativeUv(4,8,0,4,RelativeCords), // up down
       relativeUv(4,12,0,8,RelativeCords), relativeUv(0,12,4,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-5,-9), vec3(1,1,0.5)*1.75,   // Pos, Size
       PIX*PIY25, vec3(0, 0, 0),
       relativeUv(40,14,-4,-2,RelativeCords), relativeUv(44,12,-4,2,RelativeCords), // up down
       relativeUv(36,14,4,4,RelativeCords), relativeUv(40,14,2,4,RelativeCords), // north west
       relativeUv(42,14,4,4,RelativeCords), relativeUv(34,14,2,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-9), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(22,30,12,-12,RelativeCords), relativeUv(34,18,12,12,RelativeCords), // up down
       relativeUv(34,30,-12,2,RelativeCords), relativeUv(22,30,-12,2,RelativeCords), // north west
       relativeUv(58,30,-12,2,RelativeCords), relativeUv(46,30,-12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(22,30,12,-12,RelativeCords), relativeUv(34,18,12,12,RelativeCords), // up down
       relativeUv(34,30,-12,2,RelativeCords), relativeUv(22,30,-12,2,RelativeCords), // north west
       relativeUv(58,30,-12,2,RelativeCords), relativeUv(46,30,-12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,-4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(50,14,-2,-2,RelativeCords), relativeUv(52,12,-2,2,RelativeCords), // up down
       relativeUv(48,14,2,6,RelativeCords), relativeUv(50,14,2,6,RelativeCords), // north west
       relativeUv(52,14,2,6,RelativeCords), relativeUv(46,14,2,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(3,-4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(48,14,2,-2,RelativeCords), relativeUv(50,12,2,2,RelativeCords), // up down
       relativeUv(50,14,-2,6,RelativeCords), relativeUv(48,14,-2,6,RelativeCords), // north west
       relativeUv(54,14,-2,6,RelativeCords), relativeUv(52,14,-2,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(48,14,2,-2,RelativeCords), relativeUv(50,12,2,2,RelativeCords), // up down
       relativeUv(50,14,-2,6,RelativeCords), relativeUv(48,14,-2,6,RelativeCords), // north west
       relativeUv(54,14,-2,6,RelativeCords), relativeUv(52,14,-2,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_RIGHT_FEET: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,0), vec3(2,0,2)*2,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(16,40,-8,-8,RelativeCords), relativeUv(24,32,-8,8,RelativeCords), // up down
       relativeUv(8,40,8,24,RelativeCords), relativeUv(16,40,8,24,RelativeCords), // north west
       relativeUv(24,40,8,24,RelativeCords), relativeUv(0,40,8,24,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);           



       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-5,-5,-2.5), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(4,12,0,-4,RelativeCords), relativeUv(4,8,0,4,RelativeCords), // up down
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       relativeUv(4,12,0,8,RelativeCords), relativeUv(4,12,-4,8,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,5,-9), vec3(1,1,0.5)*1.75,   // Pos, Size
       PIX*NIY25, vec3(0, 0, 0),
       relativeUv(40,14,-4,-2,RelativeCords), relativeUv(44,12,-4,2,RelativeCords), // up down
       relativeUv(42,14,4,4,RelativeCords), relativeUv(34,14,2,4,RelativeCords), // south east
       relativeUv(36,14,4,4,RelativeCords), relativeUv(40,14,2,4,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-9), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(34,18,-12,12,RelativeCords), relativeUv(46,18,-12,12,RelativeCords), // up down
       relativeUv(58,30,-12,2,RelativeCords), relativeUv(46,30,-12,2,RelativeCords), // south east
       relativeUv(34,30,-12,2,RelativeCords), relativeUv(22,30,-12,2,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-5), vec3(3,0.5,3)*1.5,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(34,18,-12,12,RelativeCords), relativeUv(46,18,-12,12,RelativeCords), // up down
       relativeUv(58,30,-12,2,RelativeCords), relativeUv(46,30,-12,2,RelativeCords), // south east
       relativeUv(34,30,-12,2,RelativeCords), relativeUv(22,30,-12,2,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);


       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX*PIZ12, vec3(0, 0, 0),
       relativeUv(50,14,-2,-2,RelativeCords), relativeUv(52,12,-2,2,RelativeCords), // up down
       relativeUv(52,14,2,6,RelativeCords), relativeUv(46,14,2,6,RelativeCords), // south east
       relativeUv(48,14,2,6,RelativeCords), relativeUv(50,14,2,6,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(3,4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX*NIZ12, vec3(0, 0, 0),
       relativeUv(48,14,2,-2,RelativeCords), relativeUv(50,12,2,2,RelativeCords), // up down
       relativeUv(54,14,-2,6,RelativeCords), relativeUv(52,14,-2,6,RelativeCords), // south east
       relativeUv(50,14,-2,6,RelativeCords), relativeUv(48,14,-2,6,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,4,-2.5), vec3(0.5,1.5,0.5)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(48,14,2,-2,RelativeCords), relativeUv(50,12,2,2,RelativeCords), // up down
       relativeUv(54,14,-2,6,RelativeCords), relativeUv(52,14,-2,6,RelativeCords), // south east
       relativeUv(50,14,-2,6,RelativeCords), relativeUv(48,14,-2,6,RelativeCords), // north west
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_LEFT_ARM: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,5,-6), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(68,20,0,-4,RelativeCords), relativeUv(68,16,0,4,RelativeCords), // up down
       relativeUv(68,20,0,8,RelativeCords), relativeUv(68,20,-4,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,-5,-6), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(68,16,0,4,RelativeCords), relativeUv(68,20,0,-4,RelativeCords), // up down
       relativeUv(72,20,0,8,RelativeCords), relativeUv(64,20,4,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_RIGHT_ARM: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,5,-6), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*NIZ25, vec3(0, 0, 0),
       relativeUv(68,20,0,-4,RelativeCords), relativeUv(68,16,0,4,RelativeCords), // up down
       relativeUv(68,20,0,8,RelativeCords), relativeUv(68,20,4,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3,-5,-6), vec3(0,2,1)*1.75,   // Pos, Size
       PIX*PIZ25, vec3(0, 0, 0),
       relativeUv(68,16,0,4,RelativeCords), relativeUv(68,20,0,-4,RelativeCords), // up down
       relativeUv(72,20,0,8,RelativeCords), relativeUv(72,20,-4,8,RelativeCords), // north west
       relativeUv(0,0,0,0,RelativeCords), relativeUv(0,0,0,0,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_INNER_ARMOR: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-2), vec3(5,0.5,3)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(32,12,-20,-12,RelativeCords), relativeUv(52,0,-20,12,RelativeCords), // up down
       relativeUv(12,12,20,2,RelativeCords), relativeUv(32,12,12,2,RelativeCords), // north west
       relativeUv(44,12,20,2,RelativeCords), relativeUv(0,12,12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-4.5,-5.5), vec3(1.5,1.5,1)*1.75,   // Pos, Size
       PIX*NIY25, vec3(0, 0, 0),
       relativeUv(112,58,-6,-4,RelativeCords), relativeUv(118,54,-6,4,RelativeCords), // up down
       relativeUv(106,58,6,6,RelativeCords), relativeUv(112,58,4,6,RelativeCords), // north west
       relativeUv(116,58,6,6,RelativeCords), relativeUv(102,58,4,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);


       
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,0,-9.25), vec3(5,0.5,3)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(32,12,-20,-12,RelativeCords), relativeUv(52,0,-20,12,RelativeCords), // up down
       relativeUv(12,12,20,2,RelativeCords), relativeUv(32,12,12,2,RelativeCords), // north west
       relativeUv(44,12,20,2,RelativeCords), relativeUv(0,12,12,2,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(9.2,0,-11.25), vec3(0,1,3)*1.75,   // Pos, Size
       PIX*NIY12, vec3(0, 0, 0),
       relativeUv(64,0,0,-12,RelativeCords), relativeUv(64,-12,0,12,RelativeCords), // up down
       relativeUv(64,0,0,4,RelativeCords), relativeUv(64,0,12,4,RelativeCords), // north west
       relativeUv(76,0,0,4,RelativeCords), relativeUv(52,0,12,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);

       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-9.2,0,-11.25), vec3(0,1,3)*1.75,   // Pos, Size
       PIX*PIY12, vec3(0, 0, 0),
       relativeUv(64,0,0,-12,RelativeCords), relativeUv(64,-12,0,12,RelativeCords), // up down
       relativeUv(64,0,0,4,RelativeCords), relativeUv(64,0,-12,4,RelativeCords), // north west
       relativeUv(76,0,0,4,RelativeCords), relativeUv(76,0,-12,4,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,-6.2,-12.25), vec3(5,1.5,0)*1.75,   // Pos, Size
       PIX*NIX12, vec3(0, 0, 0),
       relativeUv(108,0,-20,0,RelativeCords), relativeUv(128,0,-20,0,RelativeCords), // up down
       relativeUv(88,0,20,6,RelativeCords), relativeUv(108,0,0,6,RelativeCords), // north west
       relativeUv(108,0,20,6,RelativeCords), relativeUv(88,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(0,6.2,-12.25), vec3(5,1.5,0)*1.75,   // Pos, Size
       PIX*PIX12, vec3(0, 0, 0),
       relativeUv(108,0,-20,0,RelativeCords), relativeUv(128,0,-20,0,RelativeCords), // up down
       relativeUv(88,0,20,6,RelativeCords), relativeUv(108,0,0,6,RelativeCords), // north west
       relativeUv(108,0,20,6,RelativeCords), relativeUv(88,0,0,6,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_LEFT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.4,0,-16), vec3(1.5,2,3)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(66,24,6,-12,RelativeCords), relativeUv(72,12,6,12,RelativeCords), // up down
       relativeUv(72,24,-6,8,RelativeCords), relativeUv(84,24,-12,8,RelativeCords), // north west
       relativeUv(90,24,-6,8,RelativeCords), relativeUv(66,24,-12,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }
    case ZEKERN_WOLF_PET_RIGHT_LEG: {
       ADD_BOX_EXT_WITH_ROTATION_ROTATE(vec3(-3.4,0,-16), vec3(1.5,2,3)*1.75,   // Pos, Size
       PIX, vec3(0, 0, 0),
       relativeUv(72,24,-6,-12,RelativeCords), relativeUv(78,12,-6,12,RelativeCords), // up down
       relativeUv(66,24,6,8,RelativeCords), relativeUv(72,24,12,8,RelativeCords), // north west
       relativeUv(84,24,6,8,RelativeCords), relativeUv(54,24,12,8,RelativeCords), // south east
       2, 2,
       2, 2,
       2, 2);
        break;
    }

#endif


#ifdef VSH



if(RVC_0 == <internal-id.r>
&& RVC_1 == <internal-id.g>
&& RVC_2 == <internal-id.b>) {
    
    
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ZEKERN_WOLF_PET_CHESTPLATE);
        //removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ZEKERN_WOLF_PET_RIGHT_ARM);
        //removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ZEKERN_WOLF_PET_LEFT_ARM);
        //removeAll=1;
    }
    
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ZEKERN_WOLF_PET_LEFT_FEET);
        //removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ZEKERN_WOLF_PET_RIGHT_FEET);
        //removeAll=1;
    }



     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ZEKERN_WOLF_PET_INNER_ARMOR);
    } 
     if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ZEKERN_WOLF_PET_LEFT_LEG);
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ZEKERN_WOLF_PET_RIGHT_LEG);
    }
}
#endif


