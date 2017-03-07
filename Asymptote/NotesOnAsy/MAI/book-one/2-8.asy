size(200);
import graph;
import markers;
draw(unitcircle,linewidth(1));
real x=0.4pi/2;
pair B=expi(x);
pair B1=expi(-x);
label("$B$",B,2N);
label("$B'$",B1,2S);
pair C=(expi(x).x,0);
label("$C$",C,SW);

pair O=(0,0);
draw(B--C);
draw(C--B1,dashed);
draw(O--B1,dashed);
pair D=(1/cos(x))*expi(x);
draw(O--D);
pair A=(1,0);
label("$A$",A,SE);
draw(A--D);
label("$D$",D,N);
markangle("$x$",1,radius=14,A,O,B);

xlimits(-1.4,1.4);
ylimits(-1.4,1.4);
axes("$x$","$y$",Arrow());
