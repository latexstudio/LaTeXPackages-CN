size(200);
import graph;
real f(real x){return atan(1/x);}
draw(graph(f,-4,-sqrtEpsilon));
draw(graph(f,sqrtEpsilon,4));
ylimits(-2.5,2.5);
axes("$x$","$y$",Arrow());

dot(Label("$\frac{\pi}{2}$",align=W),(0,pi/2),UnFill);
dot(Label("$-\frac{\pi}{2}$",align=E),(0,-pi/2),UnFill);
label("$O$",(0,0),SW);

