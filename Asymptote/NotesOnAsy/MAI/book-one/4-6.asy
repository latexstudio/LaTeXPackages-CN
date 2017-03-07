import graph;
import geometry;
size(200);
path p=(8,14)..controls(11.3527840556,23.7395558927)and(16.8163721037,32.6178864708)..(24,40)
  ..controls(32.3606176671,48.591623854)and(42.7487990631,54.8713376232)..(54,59)
  ..controls(68.0565495056,64.1580935596)and(83.1445041961,65.8726338654)..(98,64);
draw(p,linewidth(1));
real t=0.5*length(p);
point P=point(p,t);
dot(P);
pair T=dir(p,t);
pair K=P+60T;
pair M=intersectionpoint(line(P,K),line((0,0),(1,0)));
draw(M--K);
markangle("$\beta$",(0,0),M,P,radius=15);
pair J=intersectionpoint(line(P,K),line((0,0),(0,1)));
point y0=(0,P.y);
point x0=(P.x,0);
draw(x0--P--y0,dashed);
label("$x_{0}$",x0,S);
label("$y_{0}$",y0,W);
label("$(x_{0},y_{0})$",P,N+0.5W);
markangle("$\alpha$",K,J,y0,radius=12);
label("$x=\varphi(y)$",point(p,length(p)),S);
label("$y=f(x)$",point(p,length(p)),4S);
xlimits(M.x-10,K.x+20);
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());




