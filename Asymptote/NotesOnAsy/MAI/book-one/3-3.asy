import graph;
size(200,200*0.618,IgnoreAspect);

real f(real x) {return (x != 0) ? sin(1/x) : 0;}
real T(real x) {return 2/(x*pi);}

real a=-1.8/pi, b=1.8/pi;

draw(graph(f,a,-T(5),100));
draw(graph(f,-5,-10,100,T));

draw(graph(f,T(5),b,100));
draw(graph(f,10,5,100,T));

label("$y=\sin\frac{1}{x}$",(b,f(b)),4S);
dot("$\frac{1}{\pi}$",1/pi,SE);
dot("$-\frac{1}{\pi}$",-1/pi,SW);
dot("$\frac{1}{2\pi}$",1/2pi,SE);
dot("$\frac{1}{-2\pi}$",-1/2pi,SW);
label("$O$",(0,0),SW,p=fontsize(8pt));
xlimits(-a-0.1,b+0.1);
ylimits(-1.2,1.2);
axes("$x$","$y$",Arrow());

