size(200);
import graph;
xtick("$b$",1);
xtick("$a$",-1);
draw((0.2,0.8)--(0.8,0),Arrow());
draw(Label("$x_{n}$",BeginPoint,align=.5S,UnFill(2)),(0.2,0.8)--(-0.8,0),Arrow());

label("$\frac{a+b}{2}$",0,S);
label("$($",-2);
label("$)$",0-0.02);
label("$($",0+0.02);
label("$)$",2);
xlimits(-2.5,2.5);
xaxis("$x$",Arrow());
