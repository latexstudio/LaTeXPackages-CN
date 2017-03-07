import math;
import graph3;
size(200);
currentprojection=orthographic(2.5,6.1,1.4);
path3[] P={
  X--Y--Z--cycle,
  Y--(-X)--Z--cycle,
  (-X)--(-Y)--Z--cycle,
  (-Y)--X--Z--cycle
};
for(int i=0;i<P.length;++i){
  draw(surface(P[i]),palegray+opacity(0.4));
  draw(surface(zscale3(-1)*P[i]),palegray+opacity(0.4));
  draw((P[i]));
  draw(zscale3(-1)*P[i]);
}
triple A=interp(-Y,Z,0.3);
triple B=interp(X,Z,0.5);
triple K=-Z+0.2X;
triple n=cross(A-K,B-K);
real tC=intersect(X,Y,n,K);
triple C=point(X--Y,tC);
real tD=intersect(X,-Z,n,K);
triple D=point(X--(-Z),tD);
real tE=intersect(-Y,-Z,n,K);
triple E=point((-Y)--(-Z),tE);
real tF=intersect((-Y),(-X),n,K);
triple F=point((-Y)--(-X),tF);
path3 p=A--B--C--D--E--F--cycle; draw(p,red+1pt);
draw(surface(p--cycle),green);
limits((-1.2,-1.2,-1.2),(1.2,1.2,1.2));
axes3("$x$","$y$","$z$",Arrow3());
