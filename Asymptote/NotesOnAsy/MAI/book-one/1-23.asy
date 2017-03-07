size(200);
import graph;
import math;
real f(real x){return asin(x);}

draw(graph(f,-1,1),linewidth(1));

real g(real x){return sin(x);}

guide g1=graph(g,pi/2,pi/2+0.8);
guide g2=graph(g,-pi/2-0.8,-pi/2);
draw(reflect((0,0),(1,1))*(g1^^g2),dashed+1);

draw((1,pi/2+0.8)--(1,-pi/2-0.8),dashed);
draw((-1,pi/2+0.8)--(-1,-pi/2-0.8),dashed);
ytick("$\frac{\pi}{2}$",(0,pi/2),E);
ytick("$-\frac{\pi}{2}$",(0,-pi/2),E);
label("$O$",(0,0),SE);
label("$1$",1,SW);
label("$-1$",-1,SE);
xlimits(-1.4,1.4);
ylimits(-pi/2-1,pi/2+1);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
