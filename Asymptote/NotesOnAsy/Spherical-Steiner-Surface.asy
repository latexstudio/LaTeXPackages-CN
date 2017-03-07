size(200);
import graph3;
currentlight=White;
triple f(pair z){
  triple t=expi(z.x,z.y);
  return (t.y*t.z,t.z*t.x,t.x*t.y);
}
draw(surface(f,(0,0),(pi,2pi),50,50,Spline),meshpen=currentpen,palegrey);
