import graph3;
size(200);
currentprojection=orthographic(10,8,10);
real f(pair z) {
  real u=z.x, v=z.y;
  return (u/2+v)/(2+cos(u/2)*sin(v));
}
surface s=surface(f,(2,2),(14,14),Spline);
draw(s,palegrey);
draw(planeproject(XY*unitsquare3)*s,green,nolight);
draw(planeproject(YZ*unitsquare3)*s,yellow,nolight);
draw(planeproject(ZX*unitsquare3)*s,blue,nolight);
axes3("$x$","$y$","$z$",Arrow3());
