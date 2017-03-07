import graph3;
currentprojection=orthographic(2,2,1);
size(200);
real R=2;
real a=1;
triple f(pair t) {
  return ((R+a*cos(t.y))*cos(t.x),(R+a*cos(t.y))*sin(t.x),a*sin(t.y));
}
surface s=shift(3Z)*surface(f,(radians(90),0),(radians(345),2pi),8,8,Spline);
draw(s,lightgrey);
path3 pl=path3((-5,-5)--(5,-5)--(5,5)--(-5,5)--cycle);
draw(shift((-1e-3)*Z)*surface(pl),palered+opacity(0.5));
draw(planeproject(pl,currentlight.position[0])*s);
axes3("$x$","$y$","$z$");
