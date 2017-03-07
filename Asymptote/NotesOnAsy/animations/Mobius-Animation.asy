settings.tex="xelatex";
settings.prc=false;

import graph3;
import animate;
real R=8;
real r=1;
triple Mobius(pair w){
  real t=w.x;
  real l=w.y;
  return R*expi(pi/2,t)+l*expi(t/2,t);
}

animation Ani;

for(real c: new real[]{0,0.3pi,0.5pi,0.8pi,pi}){
  picture fig;
  size(fig,20cm);
  draw(fig,Circle(O,R,Z));
  surface s=surface(Mobius,(0,-r),(c,r),30,Spline);
  draw(fig,s,green+opacity(0.6));
  triple A=R*expi(pi/2,c);
  triple B=A+r*expi(c/2,c);
  triple C=A+r*expi(0,c);
  draw(fig,A-(B-A)--B,red+0.8pt);
  draw(fig,O--(R+r)*expi(pi/2,c));
  if(c!=0){
    draw(fig,surface(A--B--arc(A,B,C)--A--cycle),cyan,nolight);
    draw(fig,surface(A--B--arc(A,B,C,CW)--A--cycle),yellow,nolight);
  }
  axes3(fig);
  Ani.add(fig);
}

label(Ani.pdf(delay=400,"controls,loop"));

