size(200);
import graph;
import math;
real f(real x){return 1/tan(x);}
draw(reflect((0,0),(1,1))*graph(f,0.2,pi-0.2),linewidth(1));

drawline((0,pi),(1,pi),dashed);
label("$O$",(0,0),SW);
label("$\pi$",(0,pi),SW);
ylimits(-0.5,pi+1);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
