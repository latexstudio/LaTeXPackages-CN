import graph3;
size(200,0);
currentprojection=perspective(0,0,90);
triple f(pair t) {
  real a=5;
  real b=2;
  real r=t.x;
  real theta=t.y;
  real x=a*r*cos(theta);
  real y=b*r*sin(theta);
  real z=x^2/a^2+y^2/b^2;
  return (x,y,z);
}
pen p=cmyk(1,0,0,0);
draw(surface(f,(0,0),(8,2pi),30,30),green+opacity(0.5),meshpen=p);
