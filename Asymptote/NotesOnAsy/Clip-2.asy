size(200);
draw(unitcircle);
path p=(-1,0)--(1,1)--(1,0)--cycle;
filldraw(p,lightgray);
picture pic;
draw(pic,unitcircle,dashed+red);
clip(pic,p);
add(pic);
