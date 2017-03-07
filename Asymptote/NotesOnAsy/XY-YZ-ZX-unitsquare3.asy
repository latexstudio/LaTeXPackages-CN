import graph3;
size3(200);
currentprojection=orthographic(4,6,3);
currentlight=nolight;
limits((0,0,0),(1.2,1.2,1.2));
draw(unitsquare3,linewidth(2pt));
draw(surface(XY*unitsquare3),red+opacity(0.5));
draw(surface(YZ*unitsquare3),green+opacity(0.5));
draw(surface(ZX*unitsquare3),blue+opacity(0.5));
axes3("$x$","$y$","$z$",Arrow3);

