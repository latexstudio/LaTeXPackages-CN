size(200);
import three;
import palette;
currentprojection=orthographic(3,1,2);
int[][] M={
  {1,2,3},
  {0,1,2},
  {0,0,1},
};
surface s;
for(int i=0;i<M.length;++i)
  for(int j=0;j<M[i].length;++j)
    for(int k=0;k<M[i][j];++k)
      s.append(shift(i,j,k)*unitcube);
s.colors(palette(s.map(zpart),Rainbow()+opacity(0.85)+yellow));
draw(s,meshpen=black+thick());


