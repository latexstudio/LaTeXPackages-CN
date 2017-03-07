size(200,0);
import solids;
currentprojection=perspective(8,8,6);
real f(real x){return x^2;}
path p=graph(f,0,1.5,20,operator..);
//draw(p);
path3 l=path3(p,YZplane);
revolution R=revolution(l,Z);
//revolution R=revolution(f,0,1.5,20,operator..,Z);
draw(surface(R),yellow,meshpen=blue);
axes3("$x$","$y$","$z$",Arrow3());
