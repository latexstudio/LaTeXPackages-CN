import solids;
size(7.5cm,0);
currentprojection=perspective(45,45,20);
draw("$x$",O--X,Arrow3);draw(O--3X);
draw("$y$",O--Y,Arrow3);draw(O--3Y);
draw("$z$",O--Z,Arrow3);draw(O--13Z,Arrow3);
path p=(2,3)..(3,3.5)..(4,4.5)..(4.5,6)
  ..(4,8)..(1,10)..(2,12);
path3 generator=path3(p,YZplane);
draw(generator,green+1bp);
revolution vase=revolution(c=(0,0,0),generator,axis=Z,-50,270);
draw(surface(vase),palegreen);
draw(vase,m=4,frontpen=blue+1bp,backpen=paleblue+1bp,
     longitudinalpen=yellow+1bp);
skeleton s;
vase.transverse(s,reltime(vase.g,0.4));
draw(s.transverse.back,red+1bp+linetype("8 8",8));
draw(s.transverse.front,red+1bp);
