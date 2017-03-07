import contour;
import contour3;
import three;
size(200);
currentprojection=perspective(camera=(8.7,-12.4,7.8));
real f(real x,real y,real z){
  return x^2-y^2-2z;
}
int n=10;
real a=-5;
real b=5;
for(int i=0;i<=n;++i){
  real c=interp(a,b,i/n);
  real fx(real y,real z){
    return f(c,y,z);
  }
  guide[][] px=contour(fx,(a,a),(b,b),new real[]{0},20);
  for(int j=0;j<px[0].length;++j){
    draw(shift(c*X)*YZ()*path3(px[0][j]),((i>0 && i<n)?  red : blue+1pt));
  }
}
for(int i=0;i<=n;++i){
  real c=interp(a,b,i/n);
  real fy(real x,real z){
    return f(x,c,z);
  }
  guide[][] py=contour(fy,(a,a),(b,b),new real[]{0},20);
  for(int j=0;j<py[0].length;++j){
    draw(shift(c*Y)*XZ()*path3(py[0][j]),((i>0 && i<n) ?  green : blue+1pt));
  }
}
for(int i=0;i<=n;++i){
  real c=interp(a,b,i/n);
  real fz(real x,real y){
    return f(x,y,c);
  }
  guide[][] pz=contour(fz,(a,a),(b,b),new real[]{0},20);
  for(int j=0;j<pz[0].length;++j){
    draw(shift(c*Z)*XY()*path3(pz[0][j]),((i>0 && i<n) ? olive : blue+1pt));
  }
}
surface sf=surface(contour3(f,(-5,-5,-5),(5,5,5),15));
draw(sf,palegray+opacity(0.9),nolight);

