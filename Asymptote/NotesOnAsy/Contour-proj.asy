import graph3;
import contour;
import palette;
size(8cm,7cm,IgnoreAspect);
currentprojection=orthographic(0,0,4);
real f(pair z) {return (z.x+z.y)/(2+cos(z.x)*sin(z.y));}
real[] levels={2,4,6,8};
surface s=surface(f,(0,0),(5,10),20,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(planeproject(unitsquare3)*s,nolight);
guide[][] pl=contour(f,(0,0),(5,10),levels);
for(int i=0;i<pl.length;++i){
  for(int j=0;j<pl[i].length;++j){
    draw(path3(pl[i][j]),blue);
  }
}
