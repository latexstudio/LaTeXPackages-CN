size(200,IgnoreAspect);
import graph;
import patterns;
guide p=graph(new real(real x){return exp(x);},-0.4,1.2);
draw(Label("$y=e^{x}$",Relative(0.4),7N),p,linewidth(1));

guide q=graph(new real(real x){return exp(-x);},-0.3,1.2);
draw(Label("$y=e^{-x}$",Relative(0.5),3S),q,linewidth(1));

draw((1,0)--(1,exp(1)));

add("hatch",hatch(H=1.5mm,dir=(1,5)));
fill(buildcycle(p,q,(1,0)--(1,exp(1)+1)),pattern("hatch"));
label("$O$",(0,0),SW);
label("$1$",1,S);
xlimits(-0.8,2);
ylimits(-1,exp(1)+1);
axes("$x$","$y$",Arrow());
