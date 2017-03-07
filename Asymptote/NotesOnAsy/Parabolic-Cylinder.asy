import contour;
import palette;
import graph3;
currentprojection=orthographic(5,10,10);
limits((-4,-12,-6),(14,12,6));
size(0,200);
real p=3;
real f(real x, real y){return y^2-2p*x;}
guide[][] g=contour(f,(-10,-10),(10,10),new real[]{1},50);

for(path p:g[0]){
  surface sf=extrude(p,4Z);
  sf.colors(palette(sf.map(xpart),Rainbow()));
  draw(surface(sf,zscale3(-1)*sf));
  draw(path3(p),red+2pt);
}

axes3("$x$","$y$","$z$",Arrow3());
