size(200);
import graph;
real f(real x){return acos(x);}
draw(graph(f,-1,1),linewidth(1));
real g(real x){return cos(x);}
guide g=graph(g,pi,pi+1);
draw(reflect((0,0),(1,1))*g,dashed+1);
draw((1,0)--(1,pi+1),dashed);
draw((-1,0)--(-1,pi+1),dashed);
label("$-1$",-1,S);
label("$1$",1,S);
label("$\pi$",(0,pi),E);
label("$\frac{\pi}{2}$",(0,pi/2),NE);
label("$O$",(0,0),SW);
xlimits(-1.6,1.6);
ylimits(-0.5,pi+1.3);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
