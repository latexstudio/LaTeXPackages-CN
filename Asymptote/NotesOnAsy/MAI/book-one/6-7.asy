size(200,IgnoreAspect);
import graph;
import geometry;
real p=3;
real q=4;
real a=1;

real f(real x){return sqrt(a*(x-p)^2+q);}
guide f=graph(f,-3,10);
draw(f);
real b=-2p*a;
real g(real x){return sqrt(a)*x+b/(2sqrt(a));}
guide g=graph(g,-3,10);
draw(rotate(45)*Label("$y=\sqrt{a}\,x+\frac{b}{2\sqrt{a}}$",position=Relative(0.8)),g);
label("$\frac{b}{2\sqrt{a}}$",(0,b/(2sqrt(a))),E);
real t=-1;
real h(real x){return sqrt(a)*x+t;}
guide h=graph(h,-3,8);
draw(h);
point M=intersectionpoint(f,h);
label("$(x,y)$",M,2N+W);
label("$t$",(0,t),SE);
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
