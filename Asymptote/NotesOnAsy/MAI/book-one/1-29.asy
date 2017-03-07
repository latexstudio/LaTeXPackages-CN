size(0,100);
import graph;
real f(real x){return sin(x+pi/4);}
draw(graph(f,-pi/4,2pi-pi/4),linewidth(1));
label("$2\pi-\frac{\pi}{4}$",2pi-pi/4,N);
label("$-\frac{\pi}{4}$",-pi/4,S);
label("$O$",(0,0),SW);
xlimits(-1,2pi);
ylimits(-1.2,1.2);

xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
