import graph3;
import palette;
size(200);
currentprojection=orthographic(1.3,1.5,2.4);
currentlight=(-2,2,10);
triple[][][] P={
  {
    {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
    {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
    {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
    {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
  }
};
surface sf=surface(P);
//draw(sf,yellow);
for(int i=0;i<P.length;++i){
  for(int j=0;j<P[i].length;++j){
    for(int k=0;k<P[i][j].length;++k){
      dot(P[i][j][k],linewidth(3)+yellow);
    }
  }
}
for(int i=0;i<P.length;++i){
  for(int j=0;j<P[i].length;++j){
    for(int k=0;k<P[i][j].length-1;++k)
      draw(P[i][j][k]--P[i][j][k+1],linewidth(1));
  }
}
for(int i=0;i<P.length;++i){
  for(int j=0;j<P[i].length-1;++j){
    for(int k=0;k<P[i][j].length;++k)
      draw(P[i][j][k]--P[i][j+1][k],linewidth(1));
  }
}
for(int i=0; i <4; ++i) {
  draw(sf.s[0].uequals(i/3),linewidth(1)+green);
  draw(sf.s[0].vequals(i/3),linewidth(1)+green);
}
draw(surface(sf.s[0].external(),sf.s[0].internal(),new pen[]{green,cyan,magenta,yellow}));
//sf.colors(palette(sf.cornermap(ypart),Rainbow()));
//draw(sf);
