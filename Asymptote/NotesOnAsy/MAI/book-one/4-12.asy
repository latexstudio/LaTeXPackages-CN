size(200);
import geometry;
import graph;
path p=(22,21)..controls(38.3163542925,24.0973602627)and(53.9146985708,30.2010601977)..(68,39)
..controls(84.4507467202,49.2766086209)and(98.540385483,63.0604425958)..(108,80)
  ..controls(114.382511649,91.4293158838)and(118.459579818,104.000276073)..(120,117);
draw(p,linewidth(1));
real l=length(p);
point M=point(p,0.4l);
dot(M);
pair T=dir(p,0.4l);
point P=point(p,0.8l);
point K=intersectionpoint(line(M,M+T),line(P,(P.x,0)));
point J=intersectionpoint(line(M,K),line((0,0),(1,0)));
draw(J--K+20T);
markangle("$\alpha$",(M.x,0),J,M,radius=15);
draw(Label("$y$",position=Relative(0.5)),M--(M.x,0),dashed);
label("$x$",M.x,S);
label("$x+\Delta x$",P.x,S);
draw(P--(P.x,0),dashed);

draw(M--(P.x,M.y),dashed);
label("$N$",(P.x,M.y),E);
label("$P$",P,NW);
label("$M$",M,N);
label("$K$",K,E);
label("$O$",(0,0),SW);
xlimits(0,P.x+20);
axes("$x$","$y$",Arrow());

