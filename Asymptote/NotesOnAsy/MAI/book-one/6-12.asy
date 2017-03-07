size(200);
import graph;
real a=1;
real b=7;

real f(real x){return (-1/6)*(x-a)*(x-b);}
draw(graph(f,a,b));
xlimits(a-1,b+1);
ylimits(-1,f((a+b)/2)+1);
label("$O$",(0,0),SW);
label("$\alpha$",a,S);
label("$\beta$",b,S);
axes("$x$","$y$",Arrow());
