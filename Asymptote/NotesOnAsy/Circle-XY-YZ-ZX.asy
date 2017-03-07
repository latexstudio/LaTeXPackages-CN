import graph3;
size(200);
defaultpen(linewidth(2));
path p=(1,0)..(0,1)..(-1,0)..(0,-1)..cycle;
draw(shift(X+Y)*XY()*path3(p),red);
draw(shift(Y+Z)*YZ()*path3(p),green);
draw(shift(Z+X)*ZX()*path3(p),blue);
axes3();
