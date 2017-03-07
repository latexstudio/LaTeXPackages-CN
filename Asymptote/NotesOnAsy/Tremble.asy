import trembling;
size(200);
pair[] compass={E,S,W,N,NE,NW,SE,SW};
for(pair z: compass){
  path p=tremble(addnodes(z..(0,0)),angle=20,frequency=0.1,random=100);
  draw(p,blue,MidArrow);
}
startTrembling(angle=10,frequency=0.1,random=80);
triangle T=triangleabc(2*sqrt(3),2*sqrt(3),2*sqrt(3));
draw(shift(-sqrt(3),-1)*T);
draw(unitcircle,red);
