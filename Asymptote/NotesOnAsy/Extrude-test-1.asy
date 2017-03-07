import three;
size(200);
path3 p=shift(Z)*unitcircle3;
path3 q=scale3(2)*unitcircle3;
draw(p^^q,yellow+1bp);
draw(extrude(p,q),magenta+opacity(0.25));

