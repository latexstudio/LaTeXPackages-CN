import graph;
import contour;
size(200);
real a=1;
real f(pair t){
  real x=t.x;
  real y=t.y;
  return x^3+y^3-3a*x*y;
}
guide[][] g=contour(f,(-4,-4),(4,4),new real[]{0},100);
draw(g,red);
axes("$x$","$y$");
