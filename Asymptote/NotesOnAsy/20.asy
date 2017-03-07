import graph3;
size(200);
currentlight.background=palegreen;
real c=(1+sqrt(5))/2;
triple[] z={(c,1,0),(-c,1,0),(-c,-1,0),(c,-1,0)};
triple[] x={(0,c,1),(0,-c,1),(0,-c,-1),(0,c,-1)};
triple[] y={(1,0,c),(1,0,-c),(-1,0,-c),(-1,0,c)};
triple[][] Q={
  {z[0],y[1],x[3],x[0],y[0],z[3]},
  {z[1],x[0],x[3],y[2],z[2],y[3]},
  {z[2],z[1],y[2],x[2],x[1],y[3]},
  {z[3],z[0],y[0],x[1],x[2],y[1]},
  {x[0],x[3],z[1],y[3],y[0],z[0]},
  {x[1],x[2],z[2],y[3],y[0],z[3]},
  {x[2],x[1],z[3],y[1],y[2],z[2]},
  {x[3],x[0],z[0],y[1],y[2],z[1]},
  {y[0],y[3],x[1],z[3],z[0],x[0]},
  {y[1],y[2],x[2],z[3],z[0],x[3]},
  {y[2],y[1],x[3],z[1],z[2],x[2]},
  {y[3],y[0],x[0],z[1],z[2],x[1]}
};
real R=abs(Q[0][0]);
triple[][] P;
for(int i=0; i < Q.length; ++i){
  P[i]=new triple[] ;
  for(int j=0; j < Q[i].length; ++j){
    P[i][j]=Q[i][j]/R;
  }
}
for(int i=0;i<P.length;++i){
  for(int j=1;j<P[i].length;++j){
    draw(P[i][0]--P[i][j],red);
    draw(surface(P[i][0]--P[i][j]--P[i][j%5+1]--cycle),palegray);
  }
}

