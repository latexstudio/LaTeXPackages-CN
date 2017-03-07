size(200);
import graph;
real f(real x){return exp(-x^2);}
draw(graph(f,-2,2));
label("$y=e^{-x^2}$",(0.8,f(0.8)),align=NE);
xtick("$1$",1);
xtick("$\frac{1}{\sqrt{2}}$",1/sqrt(2));
xtick(Label("$-\frac{1}{\sqrt{2}}$",align=S+0.3E),-1/sqrt(2));
xtick(Label("$-1$",align=S+0.5W),-1);
label("$1$",(0,1),NE);
xlimits(-2.5,2.5);
ylimits(-1,1.5);
axes("$x$","$y$",Arrow());
