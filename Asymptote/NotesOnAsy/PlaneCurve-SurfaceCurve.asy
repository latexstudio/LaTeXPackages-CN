import graph3 ;
import contour;
size(200);
currentprojection=orthographic(2,3,6,up=Z) ;
real g(pair z){return z.x^2-z.y^2;}
draw(surface(g,(-3,-3),(3,3),Spline),green+opacity(0.5));
real f(pair z){
  real x=z.x;
  real y=z.y;
  return x^2+y^2;
}
guide[][] gui=contour(f,(-2,-2),(2,2),new real[] {1,3});
draw(lift(g,gui),red+linewidth(2));
axes3("$x$","$y$","$z$",opacity(0.2),Arrow3);
