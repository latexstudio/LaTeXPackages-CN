import graph3;
import contour;
import palette;
size(8cm,7cm,IgnoreAspect);
currentprojection=orthographic(-10,-5,4);
//limits((0,0,0),(5,10,12));
real f(pair z) {return (z.x+z.y)/(2+cos(z.x)*sin(z.y));}
real[] levels={2,4,6,8};
surface s=surface(f,(0,0),(5,10),100);
s.colors(palette(s.map(new real(triple v) {return find(levels > v.z);}),Rainbow())); 
draw(s); 
draw(lift(f,contour(f,(0,0),(5,10),levels)),2bp+red);
