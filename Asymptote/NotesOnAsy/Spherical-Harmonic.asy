import graph3;
import palette;
size(200);
currentprojection=orthographic(4,2,4);
real r=2;
triple f(pair z){
  return 1/81/sqrt(2*pi)*r^2*exp(-r/3)*(sin(z.x))^2*sin(2*z.y)*expi(z.x,z.y);
}
surface s=surface(f,(0,0),(pi,2*pi),50,Spline);
s.colors(palette(s.map(abs),BWRainbow()));
//draw(s);
draw(s,mean(palette(s.map(abs),BWRainbow())));
