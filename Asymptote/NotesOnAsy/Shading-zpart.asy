import graph3;
import palette;
size(200,IgnoreAspect);
currentprojection=orthographic(1,0.8,1);
real f(pair z) {
  real u=z.x, v=z.y;
  return (u/2+v)/(2+cos(u/2)*sin(v));
}
surface s=surface(f,(2,2),(14,14),40,20,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);

