size(200);
import graph;
pair O=(0,0);
real f(real r){return 2*r;}
draw(polargraph(f,0,2pi,operator..),red);
for(int i=0;i<4;++i){
  draw(circle(O,5*i),grey+dashed);
}
int n=12;
for(int i=0;i<n;++i){
  label(string(i*30),16*dir(i*30));
  draw(O--15*dir(i*30),gray+dotted);
}
