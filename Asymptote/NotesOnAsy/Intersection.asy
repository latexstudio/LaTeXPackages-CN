size(7.5cm,0);
import three;
currentprojection=obliqueX;
currentlight=light((8,10,2),(8,0,8));
triple v1=(4,0,0),
v2=(0,6,0),
p0=(-2,-3,0);
path3 pl1=plane(v1,v2,p0);
path3 pl2=rotate(45,Y)*pl1;
draw(surface(pl1),yellow);
draw(surface(pl2),blue+opacity(.5));
draw(-v2/2--v2/2,2bp+red);
