import graph3;
import palette;
import contour3;
size(200);
currentprojection=perspective(10,8,8);
real f(real x, real y, real z){
  return cos(x)*sin(y)+cos(y)*sin(z)+cos(z)*sin(x);
}
surface sf=surface(contour3(f,(-2pi,-2pi,-2pi),(2pi,2pi,2pi),12));
sf.colors(palette(sf.map(abs),Gradient(red,yellow)));
draw(sf,nolight);
xaxis3("$x$",Bounds(),blue,InTicks());
yaxis3("$y$",Bounds(),blue,InTicks());
zaxis3("$z$",Bounds(),blue,InTicks());
