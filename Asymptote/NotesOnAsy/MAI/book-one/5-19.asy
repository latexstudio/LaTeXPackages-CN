size(200);
import graph;
import geometry;
path p=(33,-32)..controls(46.3354365359,-23.2425904645)and(59.0338735898,-13.551677976)..(71,-3)
  ..controls(91.2017538158,14.8138182322)and(109.477540095,35.4213515091)..(118,61)
  ..controls(121.330328745,70.9953897429)and(123.018881222,81.4644151012)..(123,92);

pair P=point(p,0.55*length(p));
pair T=dir(p,0.55*length(p));
draw(P-80T--P+50T);
draw(P--(P.x,0));
label("$x_{1}$",P.x,S);
pair x2=intersectionpoint(line(P,P+T),line((0,0),(1,0)));
label("$x_{2}$",x2,S+.5E);
draw(p,linewidth(1));

real t=times(p,(0,0))[0];
pair C=point(p,t);

label("$c$",C,N);
label("$O$",(0,0),SW);
label("$f'>0$",(C.x,70));

label("$f''>0$",(C.x,60));

axes("$x$","$y$",Arrow());
