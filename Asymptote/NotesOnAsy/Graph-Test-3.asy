size(200,IgnoreAspect);
import graph;
import patterns;

add("hatch",hatch(H=2mm,dir=NE,gray));
real f(real t ) {return 1/2+atan(t-2)/pi;}
real a=-4;
real b=2;
real c=6;
path p=(a,0)--(0,0)--(0,1)--(b,1)--(b,f(b))..(graph(f,b,a))..(a,f(a))--cycle;
fill(p,pattern("hatch"));

draw(graph(f,a,c,operator ..),linewidth(1bp));
draw((0,1)--(c,1));
draw((b,0)--(b,1),dashed);
draw((b,f(b))--(0,f(b)),dashed);
label("$t=F^{-1}(p)$",(b,0),S);
label("$p=F(t)$",(0,f(b)),W);
label("$0$",(0,0),S);
label("$1$",(0,1),W);

xaxis(Label("$x$",align=2E),Arrow(HookHead,5));
yaxis(Label("$u$",align=2N),0,1.1,Arrow(HookHead,5));
