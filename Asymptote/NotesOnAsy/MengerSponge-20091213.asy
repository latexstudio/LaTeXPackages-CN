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

int values;
surface Sponge1(triple[] M,surface[] Squares,triple p,real u, int[][] Faces){
  surface s;
  for(int i=0;i<Faces.length;++i){
    for(int j=0;j<Faces[i].length;++j){
      transform3 T=shift(p)*scale3(u)*shift(M[i])*scale3(0.5);
      if(Faces[i][j]>0){
        surface t=T*Squares[j];
        s.append(t);
        values=values+1;
      }
    }
  }
  return s;
}

int[][] Faces=array(n=20,value=array(n=6,value=1));

int[][] eraseFaces1(int[][] Faces){
  int[][] temp=copy(Faces);
  for(int i=0;i<index.length;++i )
    for(int j : index[i])
      temp[i][j]=0;
  return temp;
}

int[][][] eraseFaces2(int[][] Faces){
  int[][][] TEMP;
  for(int n=0;n<20;++n){
    int[][] temp=copy(Faces);
    for(int j=0;j<6;++j){
      if(temp[n][j]==0)
        for(int i=0;i<20;++i){
          if(find(SquaresPoints[j]==i)!=-1 )
            temp[i][j]=0;
        }
    }
    TEMP.push(temp);
  }
  return TEMP;
}

int[][][] character=eraseFaces2(eraseFaces1(Faces));

surface sf;

for(int n=0;n<M.length;++n){
  surface S;
  int[][][] temp=copy(character);
  for(int k : index[n])
    for(int i: SquaresPoints[k])
      for(int j: SquaresPoints[k])
        temp[i][j][k]=0;
  for(int i=0;i<M.length;++i){
    //real u=1/2;
    real u=1/3;
    triple p=M[i];
    S.append(Sponge1(M,Squares,shift(p)*scale3(u)*M[i],u,temp[i]));
  }
  sf.append(shift(M[n])*scale3(1/6)*S);
  //sf.append(shift(M[n])*scale3(1/4)*S);
}

sf.colors(palette(sf.map(abs),Rainbow()));
draw(sf);
write(values);
