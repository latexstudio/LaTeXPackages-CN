size(200);
import graph;
real f(real x){return x^2;}
real b=1.4;
real a=f(b);

draw(graph(f,0,a),linewidth(1));
label("$O$",(0,0),SW);

label("$1$",1,S);
label("$1$",(0,1),W);

pair P=(b,a);
draw((0,P.y)--P--(P.x,0),dashed);
draw((0,1)--(1,1)--(1,0),dashed);
draw((a,f(a))--(a,0),dashed);
label("$a$",a,S);
label("$b$",b,S);
xlimits(-0.5,2.4);
axes("$x$","$y$",Arrow());
dot((1,1),UnFill);
