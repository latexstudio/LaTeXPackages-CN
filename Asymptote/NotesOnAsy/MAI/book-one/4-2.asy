size(200);
import graph;
import geometry;
real p=0.6;
real f(real x){return (1/2p)*x^2;}
draw(graph(f,-2.1,2.1),linewidth(1));
point F=(0,p/2);
real x=1.2;
point P=(x,f(x));
draw(F--P,Arrow());
real k=(1/p)*x;
pair T=(1,k);
point M=intersectionpoint(line(P,P+T),line((0,0),(0,1)));
draw(Label("$T$",EndPoint,align=E),M--P+T);

draw(Label("$N$",EndPoint,align=W),P--P+2(0,1),Arrow());
label("$P$",P,E);
label("$M$",M,E);
label("$F$",F,W);
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
