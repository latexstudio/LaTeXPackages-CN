import contour;
import graph3;
size(0,200);
currentprojection=orthographic(50,50,50);
limits((-3,-2,0),(3,2,8));
real f(pair t){return 8-t.x^2-t.y^2;}
real g(pair t){return t.x^2+3t.y^2;}
real d(pair t) {
  return t.x^2/4+t.y^2/2-1;
  // return f(t)-g(t);
}
guide[][] conto=contour(d,(-3,-3),(3,3),new real[] {0});
draw(surface(conto[0][0]..cycle),palegray);
draw(path3(conto[0][0]),red+dashed);
draw(lift(g,conto),red+1pt);
for(guide p: conto[0]){
  draw(extrude(p,8Z),palegray+opacity(0.1));
}
triple F(pair t){
  real r=t.x;
  real theta=t.y;
  real x=2*r*cos(theta);
  real y=sqrt(2)*r*sin(theta);
  real z=8-x^2-y^2;
  return (x,y,z);
}
triple G(pair t) {
  real r=t.x;
  real theta=t.y;
  real x=2*r*cos(theta);
  real y=sqrt(2)*r*sin(theta);
  real z=x^2+3y^2;  
  return (x,y,z);
}
draw(surface(F,(0,0),(1,2pi),10,Spline),paleyellow);
draw(surface(G,(0,0),(1,2pi),10,Spline),palegreen);
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
