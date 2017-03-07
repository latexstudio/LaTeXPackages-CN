import graph;
size(200);
real f(real x){return x^2;}
path p=graph(f,-2,2,operator..);
draw(p,red);
xaxis("$x$",Arrow);
yaxis("$y$",Arrow);
