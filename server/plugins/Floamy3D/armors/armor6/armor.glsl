#ifdef VSH


if(getChannel(RelativeCords,ivec2(63,31), 0) == <internal-id.r>
&& getChannel(RelativeCords,ivec2(63,31), 1) == <internal-id.g>
&& getChannel(RelativeCords,ivec2(63,31), 2) == <internal-id.b>) {
    if(cube==STASIS_CHESTPLATE) {
        cems = addCem(cems,ARMOR6_CHESTPLATE);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_ARM) {
        cems = addCem(cems,ARMOR6_RIGHT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_ARM) {
        cems = addCem(cems,ARMOR6_LEFT_ARM);
        removeAll=1;
    }
     if(cube==STASIS_INNER_ARMOR) {
        cems = addCem(cems,ARMOR6_INNER_ARMOR);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_BOOT) {
        cems = addCem(cems,ARMOR6_LEFT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_BOOT) {
        cems = addCem(cems,ARMOR6_RIGHT_FEET);
        removeAll=1;
    }
     if(cube==STASIS_LEFT_LEG) {
        cems = addCem(cems,ARMOR6_LEFT_LEG);
        removeAll=1;
    }
     if(cube==STASIS_RIGHT_LEG) {
        cems = addCem(cems,ARMOR6_RIGHT_LEG);
        removeAll=1;
    }
    
}

#endif



#ifdef FSH

    case ARMOR6_RIGHT_ARM:{
       break;
    }
    case ARMOR6_LEFT_ARM:{
       break;
    }
    case ARMOR6_RIGHT_LEG:{
       break;
    }
    case ARMOR6_LEFT_LEG:{
       break;
    }
    case ARMOR6_CHESTPLATE:{
       break;
    }
    case ARMOR6_INNER_ARMOR: {
       break;

    }
    case ARMOR6_LEFT_FEET: {
       break;
    }
    case ARMOR6_RIGHT_FEET: {
       
       break;
    }

#endif
