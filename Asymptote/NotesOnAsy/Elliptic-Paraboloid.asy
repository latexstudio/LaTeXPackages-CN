import graph3;
import palette;
size(0,200);
currentprojection=perspective(10,10,10);
triple f(pair t) {
  real a=4;
  real b=3;
  real c=5;
  real u=t.x;
  real v=t.y;
  return (a*v*cos(u),b*v*sin(u),c*v^2);
}
surface s=surface(f,(0,0),(2pi,1),40,40,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);
axes3("$x$","$y$","$z$",Arrow3());
