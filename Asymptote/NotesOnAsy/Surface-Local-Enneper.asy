import graph3;
size(200,0);
currentprojection=perspective(50,-200,50);
triple f(pair t) {
  real r=t.x;
  real theta=t.y;
  pair w=(r*cos(theta),r*sin(theta));
  real x=xpart(w-w*w*w/3);
  real y=xpart((0,1)*(w+w*w*w/3));
  real z=xpart(w*w);
  return (x,y,z);
}
draw(surface(f,(0,0),(1.6,2pi),60,40,Spline),nullpen,meshpen=currentpen);
