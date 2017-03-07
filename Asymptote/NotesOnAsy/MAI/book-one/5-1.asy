size(200);
import graph;

path p=(28,19)..controls(26.5634135538,36.3428444127)and(31.1551576928,53.6501877056)..(41,68)
..controls(58.5820754867,93.6275799151)and(88.9353795695,105.958354292)..(120,109)
  ..controls(130.64122301,110.041919388)and(141.35877699,110.041919388)..(152,109);

draw(p,linewidth(1));
pair A=point(p,0);
pair B=point(p,length(p));
draw(A--B);
real t=dirtime(p,B-A);
pair C=point(p,t);

draw(Label("$T$",Relative(0.95),align=N),C-.4(B-A)--C+.5(B-A));
label("$A$",A,S);
label("$B$",B,E);
label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());
