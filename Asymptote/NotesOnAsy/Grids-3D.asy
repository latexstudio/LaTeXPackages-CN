import grid3;
size(200,0,IgnoreAspect);
currentprojection=orthographic(0.25, 1, 0.25);
limits((-2,-2,0), (0,2,2));
grid3(pic=currentpicture,gridroutine=XYZgrid(pos=Relative(0)),
      N=0,n=0,Step=0,step=0,begin=true,end=true,pGrid=grey,pgrid=lightgrey,
      above=false);
//grid3(XYZgrid);
xaxis3(Label("$x$",position=EndPoint,align=S), Bounds(Min,Min), OutTicks());
yaxis3(Label("$y$",position=EndPoint,align=S), Bounds(Min,Min), OutTicks());
zaxis3(Label("$z$",position=EndPoint,align=(0,0.5)+W),
       Bounds(Min,Min), OutTicks(beginlabel=false));
