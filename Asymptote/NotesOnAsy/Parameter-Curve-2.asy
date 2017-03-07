import graph;
size(200,0);
real f1(real x){return x;}
real f2(real x){return x^2;}
real f3(real x){return x^3;}
guide f1=graph(f1,0,1.5,operator..);
guide f2=graph(f2,0,1.5,operator..);
guide f3=graph(f3,0,1.5,operator..);
draw(f1,green);
draw(f2,red);
draw(f3,blue);
label(Label("$y=x$",position=EndPoint,align=E),f1);
label(Label("$y=x^2$",EndPoint,E),f2);
label(Label("$y=x^3$",EndPoint,E),f3);
xaxis("$x$",Arrow);
yaxis("$y$",Arrow);
