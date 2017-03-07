import solids;
currentprojection=orthographic(1,1,1);
size(200);
real a=4;
draw(scale3(a)*unitsphere,brown);
real h=2.2a;
draw(shift((a/2,0,-h/2))*scale(a/2,a/2,h)*unitcylinder,springgreen);
