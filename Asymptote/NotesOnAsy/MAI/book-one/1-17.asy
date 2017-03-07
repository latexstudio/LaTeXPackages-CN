size(0,200);
import graph;
real f(real x){return 2^x;}
guide f=graph(f,-3,3);

real g(real x){return (1/2)^x;}
guide g=graph(g,-3,3);
draw(Label("$\alpha>0$",position=Relative(0.9),align=W),f,linewidth(1));
draw(Label("$\alpha<0$",position=Relative(0.1),align=E),g,linewidth(1));
xlimits(-4,4);
label("$O$",(0,0),SW);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
