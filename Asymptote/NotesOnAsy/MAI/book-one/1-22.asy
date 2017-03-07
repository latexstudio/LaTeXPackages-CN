size(0,200);
import graph;
import math;
real f(real x){return cot(x);}
real c=pi-0.2;
guide f=graph(f,0.2,c);
draw(f^^shift(pi)*f^^shift(-pi)*f,linewidth(1));
path p=(pi,-f(c)+0.5)--(pi,f(c)-0.5);
draw(p^^shift(pi)*p^^shift(-2pi)*p,dashed);
label("$O$",(0,0),SE);
label("$\pi$",pi,SE);
ylimits(-cot(c)-1,cot(c)+1);
xlimits(-pi-1,2pi+1);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=NE),Arrow());
