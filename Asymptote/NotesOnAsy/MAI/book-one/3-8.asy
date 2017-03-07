size(200);
import graph;
real f(real x){return sqrt(x);}
draw(graph(f,0,3),linewidth(1));
real e=0.8;
draw((0,e)--(e^2,e)--(e^2,0),dashed);
label("$\varepsilon^2$",e^2,S);
label("$\varepsilon$",(0,e),W);
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
