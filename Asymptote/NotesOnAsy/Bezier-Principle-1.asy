import graph;
size(200);
pair Z0=(0,0),Z1=(4,0),C=(1,3);
real t=1/3;
pair A=interp(Z0,C,t);
pair B=interp(C,Z1,t);
pair Z=interp(A,B,t);
draw(Z0--C--Z1);
draw(A--B);
arrow("$t=\frac{1}{3}$",Z,SE);
pair f(real t){return (1-t)^2*Z0+2t*(1-t)*C+t^2*Z1;}
draw(graph(f,0,1),red);
dot("$A$",A,W);
dot("$B$",B,NE);
dot("$C$",C,N);
dot("$Z_{0}$",Z0,S+S);
dot("$Z_{1}$",Z1,SE);
dot("$Z$",Z,N);
dot(Z,red,UnFill);
