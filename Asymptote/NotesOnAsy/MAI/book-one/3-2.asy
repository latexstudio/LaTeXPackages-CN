size(200);
import graph;
real f(real x){return 1/x;}
draw(graph(f,-3,-0.4));
draw(graph(f,0.4,3));
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
