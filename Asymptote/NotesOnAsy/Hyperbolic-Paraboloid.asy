import graph3;
import contour3;
import palette;
real f(real x, real y, real z){
  return x^2-y^2-z;
}
size(10cm);
currentprojection=orthographic(2.5,5,5);
surface sf=surface(contour3(f,(-5,-5,-5),(5,5,5),15));
sf.colors(palette(sf.map(zpart),Rainbow()));
draw(sf,nolight);
axes3("$x$", "$y$", "$z$", Arrow3());
