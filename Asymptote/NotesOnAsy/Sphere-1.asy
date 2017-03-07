import graph3;
size(200);
triple f(pair z){return expi(z.x,z.y);}
surface s=surface(f,(0,0),(pi,2pi),30,Spline);
draw(s,green);
