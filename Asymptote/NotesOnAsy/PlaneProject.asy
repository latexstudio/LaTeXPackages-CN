import three;
size(8cm,0);
currentprojection=obliqueX;
currentlight=(0,2,1);
path3 plane=plane(12X,12Y,(-3,-3,0));
triple dir=(1,-1,4);
path3 p=(5,3,4)..(5,4,8)..(1,4,4)..(4,-2,3)..cycle;
draw(surface(plane),lightyellow+opacity(.5),blue);
draw(surface(p),cyan+opacity(.9),red+1pt,nolight);
transform3 proj=planeproject(plane,dir);
draw(proj*p,dir,blue);
draw(O--dir,Arrow3);
for(int i=0; i<length(p); ++i){
  draw(point(p,i)--point(proj*p,i),dotted,Arrow3(4));
}

