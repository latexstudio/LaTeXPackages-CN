import graph3;
import palette;
size(200);
currentprojection=orthographic(4,2,4);
triple f(pair z){return z.y*sin(z.x)*expi(z.x,z.y);}
surface s=surface(f,(0,0),(pi,2*pi),40,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);
//draw(s,mean(palette(s.map(zpart),BWRainbow())),black,nolight);
