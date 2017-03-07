size(8cm,0);
import three;
currentprojection=obliqueX;
triple v1=(4,0,0),
v2=(0,6,0),
p0=(-2,-3,0);
path3 pl=plane(v1,v2,p0);
draw(surface(pl),yellow);
draw(Label("$\vec{v_1}$"),p0--p0+v1,Arrow3);
draw(Label("$\vec{v_2}$"),p0--p0+v2,N,Arrow3);
dot("$p_0$",p0,NW);
