import contour;
import graph3;
currentprojection=orthographic(5,10,10);
currentlight=(10,10,2);
size(200);
real a=4;
real b=3;
real f(real x, real y){return x^2/a^2-y^2/b^2;}
guide[][] g=contour(f,(-10,-10),(10,10),new real[]{1},50);
for(path p:g[0]){
  draw(extrude(p,4Z),palered);
  draw(extrude(p,-4Z),palered);
  draw(path3(p),red+2pt);
}
axes3("$x$","$y$","$z$",Arrow3());
