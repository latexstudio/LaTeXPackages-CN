size(200);
import graph;
real f(real x){return abs(x);}
draw(graph(f,-1,1));
label("$y=|x|$",(0.5,0.5),E);
label("$O$",(0,0),SW);
limits((-1.2,-0.5),(1.2,1.2));
axes("$x$","$y$",Arrow());
