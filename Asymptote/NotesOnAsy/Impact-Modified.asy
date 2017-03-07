// Contributed by Philippe Ivaldi , modified by cvgmt :-)
import graph3 ;
import contour;
import solids;
size (6cm,0);
currentprojection=orthographic(0.1,0.1,1) ;
real rc=1, hc=2, c=rc/hc;
draw(shift(hc*Z)*scale(rc,rc,-hc)*unitcone,lightcyan);
triple Os=(0.5,0.5,1);
real r=0.5;
draw(shift(Os)*surface(sphere(r),60),surfacepen=invisible,meshpen=yellow);
real g(pair z){return (sqrt(z.x^2+z.y^2))/c;}
//draw(surface(g,(-1,-1),(1,1),Spline),springgreen+opacity(0.2));
real f(pair z){
  real x=z.x;
  real y=z.y;
  return  (x-Os.x)^2+(y-Os.y)^2+(g(z)-Os.z)^2-r^2;
}
draw(lift(g,contour(f,(-1,-1),(1,1),new real[]{0})),linewidth(2bp)+red);
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",p=pink);
