size(200);
import graph3;
currentprojection=perspective(5.5,3.1,4.3);
surface Surf(triple center, triple A, triple B, triple C,triple D,
             int nu=3, int nv=nu) {
  path3 p1=arc(center,A,B); 
  path3 p2=arc(center,B,C); 
  path3 p3=arc(center,C,D);
  path3 p4=arc(center,D,A);
  triple surf(pair t) {
    real u=t.x;
    real v=t.y;
    path3 cr=arc(center,relpoint(p1,u),relpoint(reverse(p3),u)); 
    return relpoint(cr,v); 
  }; 
  return surface(surf,(0,0),(1,1),nu,nv,Spline);
} 
real r=1+0.005;
triple A=r*unit((1,0,0));
triple B=r*unit((1,1,0));
triple C=r*unit((-0.2,0.5,0.5));
triple D=r*unit((0,0,1));
draw(Surf(O,A,B,C,D,4,4),yellow);
draw(unitsphere,palegray);
draw(arc(O,A,B)^^arc(O,B,C)^^arc(O,C,D)^^arc(O,D,A),red+thick());
