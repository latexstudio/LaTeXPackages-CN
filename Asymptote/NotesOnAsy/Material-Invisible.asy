import solids;
size(6cm,0);
currentprojection=orthographic(1,2,2);
surface s=surface(sphere(1,n=10));
material m=material(diffusepen=grey,ambientpen=yellow,
                    emissivepen=black,specularpen=orange);
material[] p={m,invisible,orange};
p.cyclic=true;
draw(s,p);
