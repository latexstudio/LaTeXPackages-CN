size(200);
import graph;
import geometry;
real k=1/4;
real f(real x){return k*x^2;}
guide g=graph(f,-4,4);
draw(Label("$y=f(x)$",position=Relative(0.1),align=1.5E),g);
real x=2.8;
point P=(x,f(x));
pair T=(1,2k*x);
point J=intersectionpoint(line(P,P+T),line((0,0),(1,0)));
draw(line(J,P));
point A=P-1.5(1,0);
draw(Label("$F$",position=Relative(0.5)),P--A,Arrow());
point C=P-1.4(0,1);
draw(P--C,Arrow());

point B=P+C-A;
draw(Label("$R$",position=Relative(0.4),align=E),P--B,Arrow());
draw(A--C--B,dashed);
markangle("$\alpha$",P,C,A,radius=10);
markangle("$\alpha$",J+(1,0),J,P,radius=10);
label("$mg$",C,S+0.1E);
label("$$");
label("$O$",(0,0),SW);
ylimits(-1,f(4)+1);
axes("$x$","$y$",Arrow());
