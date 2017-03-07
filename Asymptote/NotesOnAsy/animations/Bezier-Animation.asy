import animate;
pair[] P={(5,0),(-8,50),(55,50),(100,0)};

defaultpen(fontsize(20pt)+1.5pt);
animation Ani;
int n=30;
for(int i=0;i<n;++i){
  picture pic;
  size(pic,400);
  real t=i/n;
  pair A=interp(P[0],P[1],t);
  pair B=interp(P[1],P[2],t);
  pair C=interp(P[2],P[3],t);
  pair U=interp(A,B,t);
  pair V=interp(B,C,t);
  pair W=interp(U,V,t);
  draw(pic,P[0]--P[1]--P[2]--P[3]);
  draw(pic,A--B--C,green);
  draw(pic,U--V,blue);
  draw(pic,P[0]..controls A and U.. W,red);
  Ani.add(pic);
}
Ani.pdf(delay=400,"control");
