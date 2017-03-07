import palette;
import graph3;
currentprojection=orthographic(1,1,1);
size(200);
real a=4;
real S(pair t){
  return sqrt(a^2-t.x^2-t.y^2+realEpsilon);
}
triple V(pair t){
  real x=a/2+(a/2)*t.x*cos(t.y);
  real y=(a/2)*t.x*sin(t.y);
  real z=S((x,y));
  return (x,y,z);
}
triple v(real t){
  return V((1,t));
}
path3 p=graph(v,0,2pi);
path3 q=zscale3(-1)*p;
draw(p,purple+2pt);
draw(q,yellow+2pt);
surface sf=extrude(p,q);
sf.colors(palette(sf.map(zpart),Gradient(yellow,purple)+opacity(0.6)));
draw(sf);
surface s=surface(V,(0,0),(1,2pi),40,Spline);
draw(s,purple);
draw(zscale3(-1)*s,yellow);
limits((-a-1)*(X+Y+Z),(a+2)*(X+Y+Z));
axes3("$x$","$y$","$z$",Arrow3());
