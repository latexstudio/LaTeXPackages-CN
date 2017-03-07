size(200);
import geometry;
import graph;
real p=4;
real f(real t){return p/(1-cos(t)); }
draw(polargraph(f,pi-2.5,pi+2.5));
real t=pi/4;
pair P=f(t)*expi(t);
dot("$P$",P,SE);
pair O=(0,0);
draw(Label("$r$"),O--P,Arrow());
markangle(Label("$\theta$"),(1,0),O,P,radius=15);
drawline((-p,0),(-p,1));
label("$L$",(-p,14),E);
pair N=P+(8,0);
draw(P--N,Arrow());
draw((-p,P.y)--P,dashed);
label("$N$",N,S);
draw("$p$",(-p,-2p)--(0,-2p),Arrows);

real h=sqrtEpsilon;
real x(real t){return f(t)*expi(t).x;}
real y(real t){return f(t)*expi(t).y;}

real k=(y(t+h)-y(t))/(x(t+h)-x(t));

pair T=P+7(1,k);
point M=intersectionpoint(line(T,P),line((0,0),(1,0)));
draw(M--T);
markangle(Label("$\alpha$"),O,M,T,radius=14);
label("$M$",M,S);
label("$T$",T,E);
label("$O$",(0,0),SW,p=fontsize(8pt));
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
