import graph3;
import palette;
size(0,200);
currentprojection=perspective(10,10,10);
limits((-10,-10,-20),(10,10,20));
real a=4;
real b=3;
real c=5;
triple f(pair t) {
  return (a*cosh(t.x)*cos(t.y),b*cosh(t.x)*sin(t.y), c*sinh(t.x));
}
surface sf=surface(f,(-2,0),(2,2pi),30,Spline);
sf.colors(palette(sf.map(abs),Wheel()));
draw(sf);
axes3("$x$","$y$","$z$",Arrow3());
