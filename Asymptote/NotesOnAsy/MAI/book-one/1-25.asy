size(200);
import graph;
import math;
real f(real x){return atan(x);}
draw(graph(f,-5,5),linewidth(1));
drawline((0,pi/2),(1,pi/2),dashed);
drawline((0,-pi/2),(1,-pi/2),dashed);
label("$\frac{\pi}{2}$",(0,pi/2),SW);
label("$-\frac{\pi}{2}$",(0,-pi/2),SW);
label("$O$",(0,0),SE);
xaxis("$x$",Arrow());
ylimits(-pi/2-1,pi/2+1);
yaxis(Label("$y$",align=E),Arrow());
