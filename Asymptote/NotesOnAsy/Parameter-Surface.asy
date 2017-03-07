import graph3;
size(0,200);
currentprojection=orthographic(3,2,4);
currentlight=(5,3,0);
real f(pair z) {return z.y^2-z.x^2;}
draw(surface(f,(-3,-2),(3,2),nx=32,Spline),lightblue+opacity(0.3),meshpen=blue);

