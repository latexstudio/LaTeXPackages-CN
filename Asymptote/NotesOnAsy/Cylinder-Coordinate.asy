import contour;
import palette;
import graph3;

currentprojection=orthographic(25,10,10);

defaultpen(fontsize(20pt));

size(12cm);
real a=3;
real b=4;
limits((-1,-1,-5),(5,5,5));
real f(pair z) {return (z.x+z.y)/(2+cos(z.x)*sin(z.y));}

triple H=8Z;
real h=8;

guide[][] g=contour(f,(-10,-10),(10,10),new real[]{h},100);

path[] p=g[0];

for(path s:p){
  draw(extrude(s,H),palered);
  draw(path3(s),red+1pt);
}
//draw(path3(p),red+1pt);
draw(lift(f,g),red+2pt);

surface s=surface(f,(0,0),(10,10),20,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);

axes3("$x$","$y$","$z$",Arrow3());
