import tube;
import graph3;
import palette;
size(0,200);
currentprojection=orthographic(4,3,4);
triple f(real t){
  return (sin(2pi*t),cos(2pi*t),t);
}
path3 p=graph(f,0,2.7,operator ..);
//draw(tube(p,scale(0.2)*unitcircle),yellow);
tube T=tube(p,0.5);
surface surf=T.s;
surf.colors(palette(surf.map(zpart),BWRainbow()));
draw(surf);
