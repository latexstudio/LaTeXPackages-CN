hsv interp(explicit hsv p1, explicit hsv p2, real t)
{
    real h1 = p1.h>0 ? p1.h%360 : p1.h%360+360;
    real h2 = p2.h>0 ? p2.h%360 : p2.h%360+360;
    if (h1 < h2 && h2 - h1 > 180)
        h2 = h2-360;
    else if (h1 > h2 && h1 - h2 > 180)
        h1 = h1-360;
    return hsv(interp(h1,h2,t), interp(p1.s,p2.s,t), interp(p1.v,p2.v,t));
}

unitsize(2cm);

for(real x = 0; x <= 1; x += 0.01)
    draw((x,0) -- (x+0.015,0), interp(hsv(red),hsv(green),x)+squarecap+4bp);
for(real x = 0; x <= 1; x += 0.01)
    draw((x,1) -- (x+0.015,1), interp(hsv(blue),hsv(red),x)+squarecap+4bp);
for(real x = 0; x <= 1; x += 0.01)
    draw((x,2) -- (x+0.015,2), interp(hsv(brown),hsv(lightgreen),x)+squarecap+4bp);

