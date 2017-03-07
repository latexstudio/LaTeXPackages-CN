import graph3;
import contour;
import palette;
size(8cm,7cm,IgnoreAspect);
currentprojection=orthographic(-10,-5,4);
//limits((0,0,0),(5,10,12));
real f(pair z) {return (z.x+z.y)/(2+cos(z.x)*sin(z.y));}
real[] levels={2,4,6,8};
surface s=surface(f,(0,0),(5,10),10,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);
xaxis3(Label("$x$",position=MidPoint,align=SE),
       Bounds(Min,Min),OutTicks());
yaxis3(Label("$y$",position=MidPoint,align=SW),
       Bounds(Min,Min),OutTicks(Step=2));
zaxis3(Label("$z$",position=EndPoint,align=N+W),
       XYEquals(0,10),InTicks(beginlabel=false,endlabel=false,Label(align=Y)));
guide[][] pl=contour(f,(0,0),(5,10),levels);
draw(lift(f,pl),1bp+red);
for(int i=0;i<pl.length;++i){
  for(int j=0;j<pl[i].length;++j){
    draw(path3(pl[i][j]),blue);
  }
}
