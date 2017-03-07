size(0,100);
import graph;
real a=pi/2;
pair A=(a,a);
pair B=-A;
path p=A--B;
draw(p^^shift(2a)*p^^shift(-2a)*p,linewidth(1));

path q=(-a,a)--(-a,0);
draw(q^^shift(2a)*q^^shift(4a)*q,dashed);

path r=(-3a,-a)--(-3a,0);
draw(r^^shift(2a)*r^^shift(4a)*r,dashed);

dot(A,UnFill);
dot(shift(-2a)*A,UnFill);
dot(shift(2a)*A,UnFill);
dot(B,UnFill);
dot(shift(-2a)*B,UnFill);
dot(shift(2a)*B,UnFill);
label("$O$",(0,0),SE);
label("$\frac{\pi}{2}$",a,NE);
label("$-\frac{\pi}{2}$",-a,NE);
label("$y=f(g(x))$",(1.5a,-a),NE);
xlimits(-3.5a,3.5a);
ylimits(-1.5a,1.5a);

axes("$x$","$y$",Arrow());
