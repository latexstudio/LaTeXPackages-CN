size(200);
real a=3;
real b=4;
real c=hypot(a,b);
void Tree(pair A,pair B,int n){
  pair C=rotate(-90,B)*A;
  pair D=rotate(90,A)*B;
  pair K=interp(D,rotate(aCos(b/c),D)*C,b/c);
  if(n==0)
    fill(A--B--C--D--cycle,green);
  else{
    Tree(D,K,n-1);
    Tree(K,C,n-1);
    fill(A--B--C--D--cycle,brown);
  }
}
Tree((0,0),(1,0),8);
