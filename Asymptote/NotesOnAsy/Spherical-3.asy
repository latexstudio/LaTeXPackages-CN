size(200);
import graph3;
surface sphericaltriangle(triple center, triple A, triple B, triple C,
                          int nu=8, int nv=nu) {
  path3 tri1=arc(center,A,B); 
  path3 tri2=arc(center,A,C); 
  path3 tri3=arc(center,B,C); 
  triple tri(pair p) {
    path3 cr=arc(O,relpoint(tri2,p.x),relpoint(tri3,p.x)); 
    return relpoint(cr,p.y); 
  }; 
  return surface(tri,(0,0),(1-sqrtEpsilon,1),nu,nv,Spline); 
}
triple A=unit((1,0,0));
triple B=unit((1,1,0));
triple C=unit((-0.2,0.5,0.5));
triple D=unit((0,0,1));
triple M=unit((A+B+C+D)/4);
draw(sphericaltriangle(O,A,B,M),red);
draw(sphericaltriangle(O,B,C,M),green);
draw(sphericaltriangle(O,C,D,M),blue);
draw(sphericaltriangle(O,D,A,M),yellow);

