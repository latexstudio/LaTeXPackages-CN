size(200);
import graph;
real a=-2;
real b=4;

real f(real x){return (1/6)*(x-a)*(x-b);}

draw(graph(f,a-2,a));

draw(graph(f,a,b),dashed);
draw(graph(f,b,b+2));
xlimits(a-2,b+2);
ylimits(-2,f((a+b)/2)+6);
label("$O$",(0,0),SW);
label("$\alpha$",a,S);
label("$\beta$",b,S);
axes("$x$","$y$",Arrow());
