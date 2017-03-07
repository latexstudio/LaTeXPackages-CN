size(200);
import graph;

path p=(22,57)..controls(22,57)and(22,57)..(22,57)
  ..controls(31.380240965,71.6259868946)and(46.0848535901,82.0268104586)..(63,86)
  ..controls(80.9018676003,90.2049599452)and(99.9552541186,86.8015849546)..(114,75)
  ..controls(126.271768066,64.6882211614)and(133.720065354,48.4543814019)..(149,43)
  ..controls(157.950935036,39.8048414655)and(167.829239343,41.1243257651)..(176,46)
  ..controls(182.238098136,49.7224116127)and(187.138596207,55.3229808372)..(190,57);
pair A=point(p,0);
pair B=point(p,length(p));

draw(p,linewidth(1));
real t=maxtimes(p)[1];
pair C=point(p,t);
draw(C--(C.x,0),dashed);
label("$\xi$",C.x,S);
draw(A--(A.x,0),dashed);
draw(B--(B.x,0),dashed);
draw((0,A.y)--B,dashed);
draw(C-50(1,0)--C+50(1,0));
label("$a$",A.x,S);
label("$b$",B.x,S);
label("$O$",(0,0),SW);
xlimits(-15,B.x+20);

axes("$x$","$y$",Arrow());
