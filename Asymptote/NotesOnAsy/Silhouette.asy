import solids;
size(200);
currentprojection=perspective(45,45,20);
path p=(2,3)..(3,3.5)..(4,4.5)..(4.5,6)
  ..(4,8)..(1,10)..(2,12);
path3  generator=path3(p,YZplane);
//draw(generator,pink+1bp);
revolution vase=revolution(c=(0,0,0),generator,0,360);
// 画外轮廓
draw(vase.silhouette(64),red+1bp);
// 画纬线, 并且做到自动画虚线
skeleton s;
vase.transverse(s,reltime(vase.g,0.5));
vase.transverse(s,0.5*length(vase.g));
draw(s.transverse.front,blue);
draw(s.transverse.back,blue+dashed);
//画两条母线, 并且做到自动画虚线
vase.longitudinal(s);
draw(s.longitudinal.front,pink+1pt);
draw(s.longitudinal.back,pink+1pt+linetype("8 8",8));
