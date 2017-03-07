import graph3;
import contour3;
size(200);
real f(real x, real y, real z){
  return x^2+y^2+z^2-4;
}
draw(surface(contour3(f,(-2.1,-2.1,-2.1),(2.1,2.1,2.1),15)),blue);
  
