import graph3;
import contour;
size(200,IgnoreAspect);
currentprojection=perspective(-2,-2,2);
triple f(pair t){
  real x=t.x;
  real y=x^2;
  real z=t.y;  
  return (x,y,z);
}
real g(pair t){
  real x=t.x;
  real y=t.y;
  return x^3;
}
draw(surface(f,(-2,-3),(2,3),Spline),red);
draw(surface(g,(-2,-3),(2,3),Spline),blue);
real h(pair t){
  real x=t.x;
  real y=t.y;
  return y-x^2;
}
draw(lift(g,contour(h,(-2,-2),(2,2),new real[]{0})),linewidth(4bp)+yellow);
