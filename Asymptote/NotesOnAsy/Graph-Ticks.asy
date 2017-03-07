import graph3;
import contour;
size(7.5cm,0);
size3(7.5cm,IgnoreAspect);
real f(pair z) {
  return 2z.x^2-z.x+z.y^2;
}
currentprojection=orthographic(-10,-10,200);
limits((0,0,0),(10,10,300));
xaxis3(Label("$x$",position=MidPoint,align=SE),OutTicks(Step=2));
yaxis3(Label("$y$",position=MidPoint,align=SW),OutTicks(Step=2));
zaxis3(Label("$z=2x^2-x+y^2$",position=EndPoint,align=3N+E),
       Bounds(Min,Max),InTicks(Step=100,Label(align=Y)));
draw(surface(f,(0,0),(10,10),nx=5,Spline),lightgray,meshpen=black+thick(),nolight);

