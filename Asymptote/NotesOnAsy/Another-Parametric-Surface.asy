import graph3;
size(200,0);
real R=2;
real a=1;
triple f(pair t) {
  return ((R+a*cos(t.y))*cos(t.x),(R+a*cos(t.y))*sin(t.x),a*sin(t.y));
}
pen p=rgb(0.2,0.5,0.7);
draw(surface(f,(0,0),(2pi,2pi),30,15,Spline),lightgray,meshpen=p);
//draw(surface(f,(0,0),(2pi,2pi),40,20),nullpen,meshpen=p+thick());
