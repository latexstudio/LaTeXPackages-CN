size(0,200);
import graph;
import math;
real f(real x){return tan(x);}
real c=pi/2-0.2;
guide f=graph(f,-c,c);
draw(f^^shift(pi)*f^^shift(-pi)*f,linewidth(1));
path p=(pi/2,-f(c)-0.5)--(pi/2,f(c)+0.5);
draw(p^^shift(pi)*p^^shift(-pi)*p^^shift(-2pi)*p,dashed);
label("$O$",(0,0),SE);
label("$\frac{\pi}{2}$",pi/2,SE);
label("$-\frac{\pi}{2}$",-pi/2,SW);
ylimits(-tan(c)-1,tan(c)+1);
xlimits(-pi-pi/2-1,pi+pi/2+1);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
