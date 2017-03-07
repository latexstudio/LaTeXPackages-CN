import graph3;
size(200);
currentprojection=orthographic(3.5,-1.5,5.5);
triple[][] P={
  {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
  {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
  {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
  {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
};
patch s=patch(P);
draw(s.external(),blue);
draw(surface(s),opacity(0.2));
for(int i=0;i<P.length;++i){
  for(int j=0;j<P[i].length;++j){
    label(Label(format("$P_{%d",i)+format("%d}$",j)),align=Z,P[i][j]);
    dot(P[i][j],yellow);
  }
}
for(int i=0;i<P.length;++i){
  draw(operator--(...P[i]));
}
P=transpose(P);
for(int i=0;i<P.length;++i){
  draw(operator--(...P[i]));
}
