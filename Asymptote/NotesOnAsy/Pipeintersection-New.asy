size(200);
import graph3;
currentprojection=orthographic(4,2,0);
real a=2;
real f(real x,real y){
  return sqrt(a^2-x^2);
}
triple g(pair t){
  real r=t.x;
  real theta=t.y;
  return (r*cos(theta),r*sin(theta),f(r*cos(theta),r*sin(theta)));
}
surface S=surface(g,(0,0),(a,2pi),60,Spline);
draw(S,brown);
draw(zscale3(-1)*S,brown);
draw(rotate(90,X)*S,springgreen);
draw(rotate(-90,X)*S,springgreen);
limits((-1.5a,-1.5a,-1.5a),(1.5a,1.5a,1.5a));
xaxis3("$x$",Arrow3());
yaxis3("$y$",Arrow3());
zaxis3("$z$",Arrow3());
