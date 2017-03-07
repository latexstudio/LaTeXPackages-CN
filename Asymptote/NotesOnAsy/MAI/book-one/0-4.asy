size(200);
import graph;
real r=4;
xtick("$r$",r,N);
xtick("$-r$",-r,N);
label("$x$",r/2,N);
xtick((0,0),N);
label("$O$",(0,0),SW);

xlimits(-r-2,r+2);
xaxis("$x$",Arrow());
