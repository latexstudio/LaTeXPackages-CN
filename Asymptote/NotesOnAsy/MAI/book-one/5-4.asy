size(200);
import graph;
path p=(33,38)..controls(29.6560104842,52.3892827098)and(31.0592782656,67.47441136)..(37,81)
..controls(45.2446736313,99.7711306797)and(61.2059009133,113.772140701)..(80,122)
..controls(96.9475874258,129.419475877)and(115.530845438,131.944677476)..(134,131)
..controls(147.162683773,130.326742821)and(160.148532738,127.906165782)..(173,125)
  ..controls(187.8350702,121.645272286)and(202.515846988,117.641424071)..(217,113);
draw(p,linewidth(1));
pair A=point(p,0);
pair B=point(p,length(p));
draw(A--B,linewidth(1));

real k=(B.y-A.y)/(B.x-A.x);
real t=dirtime(p,(1,k));
pair C=point(p,t);
draw(C-60(1,k)--C--C+80(1,k));
axes("$x$","$y$",Arrow());
label("$O$",(0,0),SW);
label("$A(g(a),f(a))$",A,S+0.5E);
label("$B(g(b),f(b))$",B,E);

