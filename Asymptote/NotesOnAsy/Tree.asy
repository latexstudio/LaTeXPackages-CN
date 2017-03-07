size(200);
real branchrotation=60;
real offset=180-branchrotation;
real thinning=0.7;
real shortening=0.8;
srand(seconds());
void tree(pair A,pair B,int n,real size){
  pair C,D;
  real thickness=size;
  real r_angle=offset+(branchrotation*(unitrand()));
  C=B+shortening*(rotate(r_angle,B)*A-B);
  real l_angle=offset+(branchrotation*(unitrand()));
  D=B+shortening*(rotate(-l_angle,B)*A-B);
  if(n>0){
    draw(A--B,linewidth(thickness));
    thickness=thinning*thickness;
    tree(B,C,n-1,thickness);
    tree(B,D,n-1,thickness);
  }
  else{
    draw(A--B,linewidth(thickness));
    thickness=thinning*thickness;
    draw(B--C,linewidth(thickness));
    draw(B--D,linewidth(thickness));
  }
}
tree((0,0),(0,1),10,2mm);
