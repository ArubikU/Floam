// MODEL_BODY -> BODY
if (getChannel(ivec2(2,0),0) == 100.0 && getChannel(ivec2(2,0),2) == 100.0) {
    cem_color = getCemData(ivec2(2,0));
    if (cube == BODY) {
        cems = addCem(cems, CEM_MODEL_BODY);
        EDIT_BODY();
    }
}
