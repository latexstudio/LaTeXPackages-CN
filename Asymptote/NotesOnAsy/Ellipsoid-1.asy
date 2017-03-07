import graph3;
import palette;
size(200,0);
currentprojection=perspective(10,10,10);
limits((-6,-5,-4),(6,5,4));
triple f(pair t){
  real a=5;
  real b=4;
  real c=3;
  real r=t.x;
  real theta=t.y;
  real x=a*r*cos(theta);
  real y=b*r*sin(theta);
  //real z=sqrt(c^2*(1-x^2/a^2+y^2/b^2));
  real z=sqrt(1-r^2)*c;
  return (x,y,z);
}
surface s=surface(f,(0,0),(1,2pi),40,40,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(surface(s,zscale3(-1)*s));
axes3("$x$","$y$","$z$",Arrow3());
