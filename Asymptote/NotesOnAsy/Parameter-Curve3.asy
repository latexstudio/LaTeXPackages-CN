import graph3;
size(0,200);
real x(real t) {return cos(2pi*t);}
real y(real t) {return sin(2pi*t);}
real z(real t) {return t;}
path3 p=graph(x,y,z,0,2.7,operator ..);
draw(p,Arrow3);
