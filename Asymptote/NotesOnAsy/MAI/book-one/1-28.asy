size(200);
import graph;
real f(real x){return 1+2*sin(pi*x);}
draw(graph(f,0,2),linewidth(1));
draw((0.5,3)--(0,3),dashed);
draw((1.5,-1)--(0,-1),dashed);
draw((2,0)--(2,f(2)),dashed);
label("$2$",2,SE);
label("$1$",(0,1),W);
label("$3$",(0,3),W);
label("$-1$",(0,-1),W);
label("$O$",(0,0),SW);
xlimits(-0.5,2.5);
ylimits(-1.2,3.4);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
