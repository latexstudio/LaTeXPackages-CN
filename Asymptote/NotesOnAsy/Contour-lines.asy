import graph3;
import contour;
size(7.5cm,0);
size3(7.5cm,IgnoreAspect);
real f(pair z) {
  return 2z.x^2-z.x+z.y^2;
}
real[] values={50,100,150,200,250};
currentprojection=orthographic(-10,-10,200);
limits((0,0,0),(10,10,300));
Label[] L=sequence(new Label(int i) {
    return scale(0.75)*Label(format("$z=%g$",values[i]),align=E,BeginPoint);
  },values.length);
draw(L,lift(f,contour(f,(0,0),(10,10),values)),1bp+red);
draw(surface(f,(0,0),(10,10),nx=10,Spline),
     lightgray,meshpen=black+thick(),nolight);
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
