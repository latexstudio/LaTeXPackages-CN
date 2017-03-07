settings.prc=false;
settings.render=4;
import graph3;
import animation;
viewportmargin=(10,10);
currentprojection=orthographic((19,11,18));
currentlight=(0,5,5);
unitsize(1cm);
real R=3;
real a=1;
int n=4;
triple f(pair t) {
  return ((R+a*cos(t.y))*cos(t.x),(R+a*cos(t.y))*sin(t.x),a*sin(t.y));
}
surface s=surface(f,(0,0),(2pi,2pi),8,8,Spline);
typedef triple function(real);
function g(int k){
  return new triple(real s){
    return ((R-a*cos(2*pi*s))*cos(2*pi/(1+k+s)),
            (R-a*cos(2*pi*s))*sin(2*pi/(1+k+s)),
            -a*sin(2*pi*s));
  };
}
animation A;
picture fig;
size3(fig,200);
for(int i=0; i < n; ++i){
  draw(fig,s,yellow);
  A.add(fig);
  for(int j=0;j <= i; ++j){
    draw(fig,graph(g(j),0,1,operator..),blue+linewidth(2));
  }
  A.add(fig);
}
A.movie(delay=400);
