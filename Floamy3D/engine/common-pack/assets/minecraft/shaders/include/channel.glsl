float getChannel(ivec2 cords, int channel) {
    vec4 color = texelFetch(Sampler0, cords, 0);
    return floor(color[channel] * 255.0);
}

float getChannel(ivec2 rcords, ivec2 icords, int channel)
{       
    ivec2 cords = ivec2(rcords.x*64 + icords.x, rcords.y*32 + icords.y);
    vec4 color = texelFetch(Sampler0, cords, 0);
    if (channel == 0)
        return floor(color.x * 255.0);
    if (channel == 1)
        return floor(color.y * 255.0);
    if (channel == 2)
        return floor(color.z * 255.0);
    if (channel == 3)
        return floor(color.w * 255.0);
    return 0.0;
}