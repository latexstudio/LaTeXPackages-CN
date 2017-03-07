size(200);
import graph;
real f(real x){return log(x)/log(2);}
real g(real x){return -log(x)/log(2);}
guide f=graph(f,0.1,6);
guide g=graph(g,0.1,6);
draw(Label("$a>1$",position=Relative(0.95),align=S),f,linewidth(1));
draw(Label("$a<1$",position=Relative(0.95),align=2N),g,linewidth(1));
label("$1$",1,S);

label("$O$",(0,0),SW);

ylimits(-log(0.1)-6,log(0.1)+6);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
