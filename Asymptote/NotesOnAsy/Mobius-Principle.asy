import graph3;
size(200);
real R=6;
real r=1;
triple Mobius(pair w){
  real t=w.x;
  real l=w.y;
  return R*expi(pi/2,t)+l*expi(t/2,t);
}
surface s=surface(Mobius,(0,-r),(2pi,r),30,Spline);
draw(Circle(O,R,Z));
draw(s,lightgreen+opacity(0.6));
for(real c: new real[]{0,0.05pi,0.1pi,0.15pi,0.3pi,0.5pi,0.8pi,pi,1.4pi,1.6pi,1.9pi}){
  triple Center=R*expi(pi/2,c);
  triple U=r*expi(0,c);
  triple V=r*expi(c/2,c);
  triple A=Center+U;
  triple B=Center+V;
  draw(Center--A,red);
  draw(Center--B,red);
  draw(O--(R+r)*expi(pi/2,c));
  if(c!=0){
    draw(arc(Center,A,B),red,Arrow3(1mm));
    draw(surface(Center--A--arc(Center,A,B)--Center--cycle),cyan,nolight);
    draw(surface(Center--A--arc(Center,A,B,CW)--Center--cycle),yellow,nolight);
  }
}
zaxis3(Arrow3());
