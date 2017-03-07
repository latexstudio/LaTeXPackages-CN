import graph3;
size(8cm,0);
currentprojection=orthographic(1,1,1);
limits((0,-2,0),(2,2,2));
xaxis3("$x$", InTicks());
yaxis3("$y$", InTicks(Label,5,2));
zaxis3("$z$",OutTicks(beginlabel=false),p=red,arrow=Arrow3);
