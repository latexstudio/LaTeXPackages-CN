//size(200);
import geometry;
import patterns;
picture pic;
size(pic,200);
add("hatch",hatch(5));
draw(pic,unitsquare,linewidth(1));
real c=0.2;
filldraw(pic,(0,0)--(c,0)--(c,c)--(0,c)--cycle,fillpen=pattern("hatch"),drawpen=linewidth(1));
filldraw(pic,(1-c,0)--(1,0)--(1,c)--(1-c,c)--cycle,fillpen=pattern("hatch"),drawpen=linewidth(1));
filldraw(pic,(1-c,1-c)--(1,1-c)--(1,1)--(1-c,1)--cycle,fillpen=pattern("hatch"),drawpen=linewidth(1));

filldraw(pic,(0,1-c)--(c,1-c)--(c,1)--(0,1)--cycle,fillpen=pattern("hatch"),drawpen=linewidth(1));

draw(pic,(c,c)--(1-c,c)--(1-c,1-c)--(c,1-c)--cycle,dashed+1);
distance(pic,Label("$a$",UnFill(5)),(1,0),(1,1),arrow=Arrows(),rotated=false,offset=8,p=linewidth(0.8));
distance(pic,Label("$x$",align=S),(0,0),(c,0),arrow=Arrows(),offset=8,p=linewidth(0.8));
add(pic.fit(),(0,0),N);

picture fig;
size(fig,200);
pair A=(0,0);
pair B=(1-c,0);
pair C=(1-c,c);
pair D=(0,c);
transform T=shift(0.5*(1-c)*(1,1));
pair A1=T*A;
pair B1=T*B;
pair C1=T*C;
pair D1=T*D;

pair P=intersectionpoint(line(A,A1),line(C,D));
pair Q=intersectionpoint(line(C,C1),line(A1,B1));
draw(fig,A--B--C--D--cycle^^D--D1^^C--C1^^B--B1^^C1--D1,linewidth(1));
draw(fig,A1--D1^^A1--Q^^P--A1);
draw(fig,P--A^^Q--B1,dashed);
draw(fig,Label("$x$",align=E),B1--C1,linewidth(1));
draw(fig,Label("$a-2x$",align=S),A--B,linewidth(1));
add(fig.fit(),(0,0),S);
