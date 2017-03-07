size(0,100);
import graph;
import geometry;
real f(real x){return cos(x);}
draw(graph(f,-pi/2,2pi+pi/2),linewidth(1));
xtick("$\frac{\pi}{2}$",pi/2,N);
xtick("$2\pi$",2pi,N);
xtick("$\frac{3\pi}{2}$",3pi/2,N);
xtick("$\pi$",pi,N);
xtick("$-\frac{\pi}{2}$",-pi/2,N);
label("$O$",(0,0),SE);
label("$1$",(0,1),NW);
label("$-1$",(0,-1),SW);
draw(line((0,1),(1,1)),dashed);
draw(line((0,-1),(1,-1)),dashed);
xlimits(0,2pi+2);
ylimits(-1.5,1.5);

xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
