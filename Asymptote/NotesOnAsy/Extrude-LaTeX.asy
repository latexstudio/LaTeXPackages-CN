import three;
size(200);
currentprojection=orthographic(-2,-2,1);
path[] g=texpath("\LaTeX");
for(path p:g){
  draw(path3(p),red+1pt);
  draw(extrude(p,2Z),yellow);
  draw(shift(2Z)*path3(p),red+1pt);
}
