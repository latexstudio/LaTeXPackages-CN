import graph3;
currentprojection=orthographic(1,-2,1);
currentlight=(1,-1,0.5);
size(200,0);
real sinc(pair z) {
  real r=2pi*abs(z);
  return r != 0 ? sin(r)/r : 1;
}
surface sf=surface(sinc,(-2,-2),(2,2),Spline);
pen[] p= {cyan,magenta,yellow,green};
for(int i=0;i<sf.s.length;++i){
  draw(surface(sf.s[i].external(),sf.s[i].internal(),p),nolight);
}
