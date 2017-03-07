import graph3;
import contour3;
size(200);
currentlight=(0,0,20);
limits((-4,-3,-2),(4,3,2));
real f(real x, real y, real z){
  return x^2/9+y^2/4+z^2-1;
}
surface sf=surface(contour3(f,(-3,-2,-1),(3,2,1),12));
draw(sf,yellow);
axes3("$x$","$y$","$z$",Arrow3());
