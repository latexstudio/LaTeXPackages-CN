size(300,0);
defaultpen(linewidth(1pt)+fontsize(20));
real shortening=0.5;
void tree(pair A,pair B,int n){
  pair C,D,M;
  C=B+shortening*(rotate(90,B)*A-B);
  D=B+shortening*(rotate(-90,B)*A-B);
  M=B+shortening*(rotate(180,B)*A-B);
  if(n>0){
    draw(A--B);
    tree(B,C,n-1);
    tree(B,D,n-1);
    tree(B,M,n-1);
  }
  else{
    draw(A--B);
    draw(B--C);
    draw(B--D);
    draw(B--M);
  }
}
tree((0,0),(0,1),4);
tree((0,0),(1,0),4);
tree((0,0),(-1,0),4);
tree((0,0),(0,-1),4);
draw(Label("$a$",EndPoint,NW),(0,0)--(1,0),red+2pt);
draw(Label("$b$",EndPoint,SE),(0,0)--(0,1),blue+2pt);
label("$e$",(0,0),NE);
