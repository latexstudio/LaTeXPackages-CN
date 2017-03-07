import graph3;
size(200);
currentprojection=orthographic(3,2,4);
real f(pair z){return z.x^2-z.y^2;}
draw(surface(f,(-1.2,-1.2),(1.2,1.2),50,Spline,
             new bool(pair z){return z.x^2+z.y^2 <=1;}),red+opacity(0.5),black);
draw(surface(f,(-1.2,-1.2),(1.2,1.2),50,Spline,
             new bool(pair z){return z.x^2+z.y^2 >1;}),blue+opacity(0.5),black);

