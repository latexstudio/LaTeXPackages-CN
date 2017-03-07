// Contributed by ltongfu@bbs.ctex.org , modified by cvgmt@bbs.ctex.org  :-)
import graph3;
size(200,keepAspect=false);
currentprojection=orthographic(1,1,2);
currentlight=(10,10,10);
real x(real t) {return cos(t);}
real y(real t) {return sin(t);}
real z(real t) {return t+3.1;}
path3 p=graph(x,y,z,-4,20,operator ..);
real x(real t) {return 4cos(t);}
real y(real t) {return 4*sin(t);}
real z(real t) {return t+3.1;}
path3 q=graph(x,y,z,-4,20,operator ..);
draw(p^^q,red);
draw(extrude(p,q),palegray);
draw(path3(unitcircle)^^shift(25*Z)*path3(unitcircle),red);
draw(extrude(unitcircle,25*Z),green);
limits((0,0,0), (2,2,26));
axes3("$x$","$y$","$z$",Arrow3());


