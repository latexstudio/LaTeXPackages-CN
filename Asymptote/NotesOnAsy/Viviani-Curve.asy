import solids;
import contour;
size(200);
draw(unitsphere,yellow+opacity(1));
revolution r=cylinder(0.5Y,0.5,2,Z);
draw(surface(shift(-Z)*r),cyan);
real f(real x,real y){return x^2+(y-0.5)^2-0.5^2;}
guide[][] gui=contour(f,(-1,-1),(1,1),new real[]{0});
real g1(real x,real y){return   x^2+y^2<1 ? sqrt(1-x^2-y^2) : 0;}
draw(lift(g1,gui),red+1pt);
real g2(real x,real y){return x^2+y^2<1 ? -sqrt(1-x^2-y^2) : 0 ;}
draw(lift(g2,gui),purple+1pt);
