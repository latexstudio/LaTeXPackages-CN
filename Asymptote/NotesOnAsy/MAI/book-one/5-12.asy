size(200);
import graph;
path p=(18,57)..controls(24.6897020993,48.5542116432)and(33.7399669591,42.2886436633)..(44,39)
  ..controls(58.8888580389,34.2276811928)and(75.0140341328,35.9943800805)..(89,43)
  ..controls(99.0578737705,48.038024653)and(107.569317408,55.564220698)..(115,64)
  ..controls(123.475464645,73.6218817514)and(130.545656529,84.3955074784)..(136,96);

draw(p,linewidth(1));

pair A=point(p,0.05*length(p));

pair B=point(p,0.45*length(p));
pair C=point(p,0.9*length(p));

draw(A--B--C);
label("$A$",A,S);
label("$B$",B,S);
label("$C$",C,E);
label("$O$",(0,0),SW);
xlimits(-10,B.x+20);
axes("$x$","$y$",Arrow());

