size(200);
import graph;
import patterns;
real f(real x){return x^2;}
draw(graph(f,0,1),linewidth(1));
label("$y=x^2$",(0.6,f(0.6)),15N);
label("$1$",1,S);
int n=8;
add("hatch",hatch(H=1.5mm,dir=NE));
for(int i=0;i<n;++i){
  filldraw((i/n,0)--(i/n+1/n,0)--((i+1)/n,f(i/n))--((i/n,f(i/n)))--cycle,pattern("hatch"));
}
label("$\frac{1}{n}$",1/n,S);
label("$\frac{2}{n}$",2/n,S);
label("$\frac{3}{n}$",3/n,S);
label("$\frac{n-1}{n}$",(n-1)/n,S);
draw((1,0)--(1,f(1)));

xlimits(-.2,1.2);

label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
