size(200);
import graph;
real a=1;
real b=7;

real f(real x){return (1/6)*(x-a)*(x-b);}
draw(graph(f,a-2,a));
draw(graph(f,a,b),dashed);
draw(graph(f,b,b+2));

xlimits(a-3,b+3);
ylimits(-2,f((a+b)/2)+6);
label("$\sqrt{c}$",(0,f(0)),E);
label("$O$",(0,0),SW);
label("$\alpha$",a,S);
label("$\beta$",b,S);
axes("$x$","$y$",Arrow());
