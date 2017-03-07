import three;
size(300);

currentlight.background=palegreen+opacity(0.2);

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

path3 p=arc(O,Q[0][0],Q[0][1]);
real R=abs(point(p,reltime(p,1/3)));

triple[][] P;
for(int i=0;i<Q.length;++i){
  P[i]=new triple[];
  for(int j=0;j<Q[i].length;++j){
    P[i][j]=Q[i][j]/R;
  }
}

// A-->K-->B
patch  SphericalTriangle(triple A,triple K,triple B){
  path3 p=arc(O,A,K);
  path3 q=arc(O,K,B);
  path3 r=arc(O,B,A);
  path3 g=A{dir(p,reltime(p,0))}..{dir(p,reltime(p,1))}K..K{dir(q,reltime(q,0))}..{dir(q,reltime(q,1))}B{dir(r,reltime(r,0))}..{dir(r,reltime(r,1))}cycle;
  patch T=patch(g,new triple[]{});
  return T;
}

for(int i=0;i<P.length;++i){
  triple[] pentagon=sequence(new triple(int k){
      path3 p=arc(O,P[i][0],P[i][k+1]);
      return point(p,reltime(p,1/3));
    },5);
  pentagon.cyclic=true;
  draw(sequence(new path3(int k){return arc(O,pentagon[k],pentagon[k+1]);},5),linewidth(2pt));
  triple M=unit(sum(pentagon)/5);
  for(int i=0;i<5;++i){
    surface sf=surface(SphericalTriangle(pentagon[i],M,pentagon[i+1]));
    draw(sf,black,nolight);
  }
}


for(int i=0;i<P.length;++i){
  for(int j=1;j<=5;++j){
    triple K=P[i][0];
    triple A=P[i][j];
    triple B=P[i][j%5+1];
    path3[] p={arc(O,K,A),arc(O,A,B),arc(O,B,K)};
    draw(subpath(p[0],reltime(p[0],1/3),reltime(p[0],2/3)),linewidth(1pt));
    triple[] hexagon={point(p[0],reltime(p[0],1/3)),point(p[0],reltime(p[0],2/3)),
                      point(p[1],reltime(p[1],1/3)),point(p[1],reltime(p[1],2/3)),
                      point(p[2],reltime(p[2],1/3)),point(p[2],reltime(p[2],2/3))};
    hexagon.cyclic=true;
    triple M=unit(sum(hexagon)/6);
    for(int i=0;i<6;++i){
      surface sf=surface(SphericalTriangle(hexagon[i],M,hexagon[i+1]));
      draw(sf,white,nolight);
    }
  }
}
