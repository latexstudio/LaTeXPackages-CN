size(200);
import palette;
import three;
currentprojection=orthographic(1,1,1);
triple[] M={
  (-1,-1,-1),(0,-1,-1),(1,-1,-1),(1,0,-1), (1,1,-1),(0,1,-1),(-1,1,-1),(-1,0,-1),
  (-1,-1,0),(1,-1,0),(1,1,0),(-1,1,0),
  (-1,-1,1),(0,-1,1),(1,-1,1),(1,0,1), (1,1,1),(0,1,1),(-1,1,1),(-1,0,1)
};
surface[] Squares={
  surface((1,-1,-1)--(1,1,-1)--(1,1,1)--(1,-1,1)--cycle),
  surface((-1,-1,-1)--(-1,1,-1)--(-1,1,1)--(-1,-1,1)--cycle),
  surface((1,1,-1)--(-1,1,-1)--(-1,1,1)--(1,1,1)--cycle),
  surface((1,-1,-1)--(-1,-1,-1)--(-1,-1,1)--(1,-1,1)--cycle),
  surface((1,-1,1)--(1,1,1)--(-1,1,1)--(-1,-1,1)--cycle),
  surface((1,-1,-1)--(1,1,-1)--(-1,1,-1)--(-1,-1,-1)--cycle),
};
int[][] SquaresPoints={
  {2,3,4,10,16,15,14,9},
  {0,7,6,11,18,19,12,8},
  {4,5,6,11,18,17,16,10},
  {2,1,0,8,12,13,14,9},
  {12,13,14,15,16,17,18,19},
  {0,1,2,3,4,5,6,7}
};
int[][] index={
  {0,2,4},{0,1},{1,2,4},{2,3},{1,3,4},{0,1},{0,3,4},{2,3},
  {4,5},{4,5},{4,5},{4,5},
  {0,2,5},{0,1},{1,2,5},{2,3},{1,3,5},{0,1},{0,3,5},{2,3}
};
int[] Sponge0=array(n=6,value=1);
int[] eraseFaces(int n,int[] Sponge0){
  int[] temp=copy(Sponge0);
  for(int k : index[n]){
    temp[k]=0;
  }
  return temp;
}
int[][] Sponge1;
for(int n=0;n<20;++n){
  Sponge1.push(eraseFaces(n,Sponge0));
}
int[][] eraseFaces(int n,int[][] Sponge1){
  int[][] temp=copy(Sponge1);
  for(int k : index[n])
    for(int n1 : SquaresPoints[k])
      temp[n1][k]=0;
  return temp;
}
int[][][] Sponge2;
for(int n=0;n<20;++n){
  Sponge2.push(eraseFaces(n,Sponge1));
}
surface s2;
int values;
real u=2/3;
for(int n2=0;n2<20;++n2){
  surface s1;
  for(int n1=0;n1<20;++n1){
    for(int k=0;k<6;++k){
      transform3 T=scale3(u)*shift(M[n1])*scale3(0.5);
      if(Sponge2[n2][n1][k]>0 ){
        s1.append(T*Squares[k]);
        ++values;
      }
    }
  }
  transform3 T=scale3(u)*shift(M[n2])*scale3(0.5*0.8);
  s2.append(T*s1);
}
s2.colors(palette(s2.map(abs),Rainbow()));
draw(s2);
write(values);
