import solids;
size(6cm,0);
currentprojection=orthographic(10,5,2);

nslice=4*nslice;
revolution Ball=sphere(O,1);
draw(surface(Ball),palegreen+opacity(.4));

skeleton s;

Ball.transverse(s,reltime(Ball.g,0.2));
Ball.transverse(s,reltime(Ball.g,0.3));
Ball.transverse(s,reltime(Ball.g,0.4));
draw(s.transverse.back,dashed);
draw(s.transverse.front,red);
