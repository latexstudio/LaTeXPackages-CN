size(200);
import graph;
real f(real x){return x^(1/0.4);}
guide f=graph(f,0,1.4);
real g(real x){return x^0.4;}
guide g=graph(g,0,2);
real h(real x){return 1/x;}
guide h=graph(h,0.5,2);

draw(Label("$\alpha >1$",position=Relative(0.95),align=W),f,linewidth(1));
draw(Label("$0<\alpha<1$",position=EndPoint,align=2S),g,linewidth(1));
draw(Label("$\alpha<0$",position=Relative(0.9),align=1.5S),h,linewidth(1));
draw(Label("$y=x$",position=Relative(0.9),align=E),(0,0)--(2,2),linewidth(1));
draw((1,0)--(1,1)--(0,1),dashed);

label("$1$",1,S);
label("$1$",(0,1),W);
label("$O$",(0,0),SW);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
