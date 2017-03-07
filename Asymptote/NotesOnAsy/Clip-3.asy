size(7cm,0);
pair C1=(-3,0),C2=(3,0);
real r=4;
path circleA=circle(C1,r);
path circleB=circle(C2,r);

fill(circleA,0.8white);
fill(circleB,0.8white);

picture pic;
fill(pic,circleA,0.6white);
clip(pic,circleB);
add(pic);

draw(circleA);
label("$A$",C1,UnFill(1mm));
draw(circleB);
label("$B$",C2,UnFill(1mm));
draw(Label("$A\cap B$",0),(0,-5)--(0,0),Arrow);

shipout(bbox(5mm,invisible));
