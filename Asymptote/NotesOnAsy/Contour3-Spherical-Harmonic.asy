import graph3;
import contour3;
import palette;
size(200);
currentprojection=orthographic(6,8,2);
limits((-22,-22,-22),(22,22,22));
real c0=0.1;
real h(real x,real y,real z){
  triple v=(x,y,z);
  real rho=length(v);
  real theta=polar(v,warn=false);
  real phi=azimuth(v,warn=false);
  return rho*(1-rho/6)*exp(-rho/3)*cos(theta)-c0;
}
surface s=surface(contour3(h,(-20,-20,-20),(20,20,20),30));
s.colors(palette(s.map(abs),Gradient(palegreen,heavyblue)));
draw(s);
draw(zscale3(-1)*s);
axes3("$x$","$y$","$z$",Arrow3());
