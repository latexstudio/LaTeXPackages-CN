import graph3;
import palette;
size(0,200);
currentprojection=perspective(10,10,10);
limits((-10,-10,-20),(10,10,20));
triple f(pair t){
  real a=4;
  real b=3;
  real c=5;
  real r=t.x;
  real theta=t.y;
  real x=a*r*cos(theta);
  real y=b*r*sin(theta);
  //real z=sqrt(c^2*(x^2/a^2+y^2/b^2+1));
  real z=sqrt(r^2+1)*c;
  return (x,y,z);
}
surface s=surface(f,(0,0),(5,2pi),40,40,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(surface(s,zscale3(-1)*s));
axes3("$x$","$y$","$z$",Arrow3());
