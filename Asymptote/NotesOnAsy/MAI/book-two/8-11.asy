size(200);
import graph;
import patterns;
real a=1;
real f(real t){return a*(1+cos(t));}
path p=polargraph(f,0,2pi);

draw(Label("$r=a(1+\cos\theta)$",Relative(0.1),E),p,linewidth(1));
add("hatch",hatch(H=1.5mm,dir=NE));
fill(p..cycle,pattern("hatch"));
label("$O$",(0,0),SE);
label("$2a$",2a,SE);
xlimits(-1,2a+.5);
ylimits(-1.8,1.8);
axes("$x$","$y$",Arrow());
