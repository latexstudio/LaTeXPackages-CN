import contour;
import contour3;
import three;
defaultrender=render(compression=Zero,merge=true);
size(200);
currentprojection=perspective(camera=(8.7,-12.4,7.8));
int n=10;
real a=-5;
real b=5;
typedef real function(real,real);
function Tx(real f(real,real,real),real c){
  return new real(real y,real z){return f(c,y,z);};
}
function Ty(real f(real,real,real),real c){
  return new real(real x,real z){return f(x,c,z);};
}
function Tz(real f(real,real,real),real c){
  return new real(real x,real y){return f(x,y,c);};
}
real f(real x,real y,real z){
  return x^2-y^2-2z;
}
for(int i=0;i<=n;++i){
  real c=interp(a,b,i/n);
  guide[][] px=contour(Tx(f,c),(a,a),(b,b),new real[]{0},20);
  guide[][] py=contour(Ty(f,c),(a,a),(b,b),new real[]{0},20);
  guide[][] pz=contour(Tz(f,c),(a,a),(b,b),new real[]{0},20);
  for(guide p : px[0])
    draw(shift(c*X)*YZ()*path3(p),((i>0 && i<n) ?  red : blue+1pt));
  for(guide p : py[0])
    draw(shift(c*Y)*XZ()*path3(p),((i>0 && i<n) ?  heavygreen : blue+1pt));
  for(guide p : pz[0])
    draw(shift(c*Z)*XY()*path3(p),((i>0 && i<n) ? olive : blue+1pt));
}
surface sf=surface(contour3(f,(a,a,a),(b,b,b),15));
draw(sf,palegray+opacity(0.9),nolight);

