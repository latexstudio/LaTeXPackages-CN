// Pseudosphere:
// x = a sin(u) cos(v);
// y = a sin(u) sin(v);
// z = a (log(tan(u/2))+cos(u));
import three;
import solids;
import graph3;
import palette;
triple pseudosphere(real x) {
return (sin(x),0,cos(x)+log(tan(x/2)));
}
size(200,IgnoreAspect);
currentprojection=orthographic(160,40,100);
currentlight=(50,50,50);
path3 G=graph(pseudosphere,0.5pi,0.965pi,10,Spline);
revolution r=revolution(O,G,Z);
draw(r,1,longitudinalpen=nullpen);
surface s=surface(r);
s.colors(palette(s.map(zpart),Gradient(cyan+white+opacity(0.9),
magenta+white+opacity(0.2))));
draw(s);
skeleton s;
int n=5;
for(int i=0; i < n; ++i) {
r.transverse(s,reltime(r.g,0.5+i/n));
draw(s.transverse.back,linetype("10 10",10));
draw(s.transverse.front);
}
int n=10;
for(int i=0; i < n; ++i)
draw(rotate(i*360/n,O,Z)*G);
