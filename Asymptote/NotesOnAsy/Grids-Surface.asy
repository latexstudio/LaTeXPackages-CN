import graph3;
import contour;
import grid3;
import palette;
size(8cm,7cm,IgnoreAspect);
currentprojection=orthographic(-10,-10,12);
limits((0,0,0),(5,10,12));
real f(pair z) {return (z.x+z.y)/(2+cos(z.x)*sin(z.y));}
surface s=surface(f,(0,0),(5,10),50,Spline);
draw(s,green);
grid3(new grid3routines [] {XYXgrid, ZXgrid(10), ZYgrid(5)},
      Step=2,
      step=1,
      pGrid=new pen[] {red, blue, black},
      pgrid=new pen[] {0.5red, lightgray, lightgray});
xaxis3(Label("$x$",position=MidPoint,align=SE), 
       Bounds(Min,Min), 
       OutTicks());
yaxis3(Label("$y$",position=MidPoint,align=SW), 
       Bounds(Min,Min), 
       OutTicks(Step=2));
zaxis3(Label("$z$",position=EndPoint,align=N+W),
       XYEquals(0,10),
       InTicks(beginlabel=false,endlabel=false,Label(align=Y))
       );
