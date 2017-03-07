import graph;
size(200);
real a=1;

real f(real x){return sqrt(x^3/(x-1));}
draw(graph(f,1.05,5),linewidth(1));
draw(graph(f,-3,0),linewidth(1));
draw(rotate(-45)*Label("$y=-x-\frac{a}{2}$",Relative(0.2)),graph(new real(real x){return -x-a/2;},-3,-a/2));
draw(rotate(45)*Label("$y=x+\frac{a}{2}$",Relative(0.6)),graph(new real(real x){return x+a/2;},0,5));
draw((3a/2,0)--(3a/2,f(3a/2)),dashed);
label("$a$",(a,0),S);
label("$\frac{3}{2}a$",3a/2,S+.5E);
label("$y=\sqrt{\frac{x^3}{x-a}}$",(-2,4));
draw((a,0)--(a,5));
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
