size(0,200);
import graph;
import markers;
real a=1;
real x(real t){return a*(t-sin(t));}
real y(real t){return a*(1-cos(t));}
draw(graph(x,y,0,2pi));
draw(circle((0,1),1),dashed);

real t=0.4pi;
draw(circle((t,1),1),linewidth(1));
pair M=(t,0);
pair A=(t,1);
pair C=(x(t),y(t));
pair B=(t,y(t));
draw(A--C--B);
draw(A--M);
label("$M$",(t,0),S);
label("$A$",(t,1),N);
dot("$C$",(x(t),y(t)),2S);
label("$B$",(t,y(t)),E);
dot("$a$",(0,a),W);
label("$O$",(0,0),SW);

markangle("$t$",1,radius=8,C,A,M);
limits((-1.2,-0.5),(7,2.5));
axes("$x$","$y$",Arrow());
