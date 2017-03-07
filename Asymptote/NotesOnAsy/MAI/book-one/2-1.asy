size(200);
import graph;
import patterns;
real f(real x){return x^2;}

int n=5;
add("hatch",hatch(H=2mm,dir=NE));

for(int i=0;i<n;++i){
  real c=i/n;
  path p=(c,0)--(c+1/n,0)--(c+1/n,f(c))--(c,f(c))--cycle;
  filldraw(p,pattern("hatch"));
  draw((c+1/n,0)--(c+1/n,f(c+1/n)),linewidth(1));
  path q=(c,f(c))--(c+1/n,f(c))--(c+1/n,f(c+1/n))--graph(f,c+1/n,c)--cycle;
  filldraw(q,0.6*white);
  filldraw(shift(-(c+1/n))*q,0.6*white);
}
draw(graph(f,0,1),linewidth(1.5));
label("$O$",(0,0),SE);
label("$\frac{i}{n}$",(2/n,0),S);
label("$\frac{i+1}{n}$",(3/n,0),S);
label("$1$",(1,0),S);
label("$\frac{1}{n}$",(-1/2n,0),S);
draw((0,f(1))--(1,f(1)),dashed);
draw((-1/n,0)--(-1/n,f(1))--(0,f(1)));
draw(Label("$(\frac{i}{n})^2$",BeginPoint),(1.5/n,f(3/n))--(2/n,f(2/n)),Arrow());
limits((-0.4,-0.4),(1.2,1.2));
axes("$x$","$y$",Arrow());
