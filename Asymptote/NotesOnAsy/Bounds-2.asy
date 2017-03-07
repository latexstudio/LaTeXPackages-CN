import graph3;
size(7.5cm,0);
size3(7.5cm,7.5cm,12cm,IgnoreAspect);
real f(pair z) {
  return 2z.x^2+z.x+z.y^2;
}
currentprojection=orthographic(5,-20,100);
limits((-10,0,0),(0,10,300));
xaxis3(Label("$x$"),Bounds(Min,Min),red);
xaxis3(Label("$x$"),Bounds(Max,Min),green);
xaxis3(Label("$x$"),Bounds(Min,Max),blue);
xaxis3(Label("$x$"),Bounds(Max,Max),yellow);
yaxis3(Label("$y$"),Bounds());
zaxis3(Label("$z$"),Bounds());
draw(surface(f,(-10,0),(0,10),nx=10,Spline),
     lightgray+white,meshpen=black+thick(),nolight);
