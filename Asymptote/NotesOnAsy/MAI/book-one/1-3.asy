size(200);
import graph;
real c=1;

draw((-2,c)--(2,c),linewidth(1));
label("$y=c$",(1,c),SE);
label("$O$",(0,0),SW);
label("$c$",(0,c),SE);
xlimits(-2.5,2.5);
ylimits(-1,2);
axes("$x$","$y$",Arrow());
