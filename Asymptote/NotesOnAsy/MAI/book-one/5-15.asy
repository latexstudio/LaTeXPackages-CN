size(200);
import graph;
import geometry;
path p=(18,57)..controls(24.6897020993,48.5542116432)and(33.7399669591,42.2886436633)..(44,39)
  ..controls(58.8888580389,34.2276811928)and(75.0140341328,35.9943800805)..(89,43)
  ..controls(99.0578737705,48.038024653)and(107.569317408,55.564220698)..(115,64)
  ..controls(123.475464645,73.6218817514)and(130.545656529,84.3955074784)..(136,96);

draw(p,linewidth(1));

pair A=point(p,0);
pair B=point(p,length(p));
pair M=point(p,0.45*length(p));
pair T=dir(p,0.45*length(p));
pair K=intersectionpoint(line(M,M+T),line(A,(A.x,0)));
pair L=intersectionpoint(line(M,M+T),line(B,(B.x,0)));
draw(K--L,dashed);

draw(A--(A.x,0),dashed);
draw(B--(B.x,0),dashed);
draw(M--(M.x,0),dashed);
label("$x_{0}$",M.x,S);

label("$a$",A.x,S);
label("$b$",B.x,S);
label("$O$",(0,0),SW);
xlimits(-10,B.x+20);
axes("$x$","$y$",Arrow());

