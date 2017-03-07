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
surface s1;
int values;
real u=2/3;
for(int n1=0;n1<20;++n1){
  for(int k=0;k<6;++k){
    transform3 T=scale3(u)*shift(M[n1])*scale3(0.5);
    if(Sponge1[n1][k]>0 ){
      s1.append(T*Squares[k]);
      ++values;
    }
  }
}
s1.colors(palette(s1.map(abs),Rainbow()));
draw(s1);
write(values);
