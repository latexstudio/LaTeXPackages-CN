size(200);
import graph;
real f(real x){return 2*sin(pi*x);}
draw(graph(f,0,2),linewidth(1));
draw((0.5,2)--(0,2),dashed);
draw((1.5,-2)--(0,-2),dashed);
label("$2$",2,SE);
label("$2$",(0,2),W);
label("$-2$",(0,-2),W);
xlimits(-0.5,2.5);
ylimits(-2.2,2.2);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
