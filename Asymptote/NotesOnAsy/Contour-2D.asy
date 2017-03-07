import graph;
import palette;
import contour;
size(8cm,7cm,IgnoreAspect);
real f(real x,real y) {return (x+y)/(2+cos(x)*sin(y));}
bounds range=image(f,Automatic,(0,0),(5,10),100,Rainbow());
real[] levels={2,4,6,8};
guide[][] pl=contour(f,(0,0),(5,10),levels);
draw(pl,blue+1bp);
