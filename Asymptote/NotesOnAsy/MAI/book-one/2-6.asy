size(200);
import graph;
path p=(0,21)..controls(2,21)and(2,21)..(2,21)
..controls(9.64194239684,20.7401804638)and(17.2210387776,22.4627023685)..(24,26)
..controls(33.1337150979,30.7660205927)and(40.2441515673,38.4647736581)..(46,47)
..controls(51.021628423,54.4464669625)and(55.0371943434,62.5215606526)..(58,71)
  ..controls(62.2646573781,83.2038510478)and(64.2970821017,96.0758742975)..(64,109);

draw(Label("$f(x)$",Relative(0.7),align=2W),p,linewidth(1));
pair P=point(p,length(p));
pair Q=(P.x+4,0);
label("$x_{0}$",Q.x,align=S);
pair R=(P.x+4,P.y);
draw(Q--R+(0,4),dashed);
draw(Label("$f(x)$",Relative(0.7),align=2E),reflect(Q,R)*p,linewidth(1));

label("$O$",(0,0),SW);
xlimits(-1,2P.x+20);
axes("$x$","$y$",Arrow());
