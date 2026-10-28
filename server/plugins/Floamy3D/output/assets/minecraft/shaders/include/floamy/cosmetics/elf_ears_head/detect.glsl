// ELF_EARS_HEAD -> HEAD
if (getChannel(ivec2(8,0),0) == 101.0 && getChannel(ivec2(8,0),2) == 101.0) {
    cem_color = getCemData(ivec2(8,0));
    if (cube == HEAD) {
        cems = addCem(cems, CEM_ELF_EARS_HEAD);
        EDIT_HEAD();
    }
}
