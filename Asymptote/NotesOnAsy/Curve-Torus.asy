import graph3;
size(200,0);
currentprojection=orthographic(4,0,2);
real R=3;
real a=1;
triple f(pair z) {
  return ((a*cos(z.y)+R)*cos(z.x),(a*cos(z.y)+R)*sin(z.x),a*sin(z.y));
}
draw(surface(f,(0,0),(2pi,2pi),40,20,Spline),lightgreen);
triple c(real t){
  return ((a*cos(8*t)+R)*cos(t),(a*cos(8*t)+R)*sin(t),a*sin(8*t));
}
draw(graph(c,0,2pi,operator..),linewidth(2)+red);
