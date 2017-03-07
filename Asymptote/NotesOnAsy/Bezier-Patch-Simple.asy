import three;
currentprojection=orthographic(2,-4,5);
size(200);
triple[][] P={
  {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
  {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
  {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
  {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
};
surface sf=surface(patch(P));
draw(surface(sf),cyan+opacity(0.8));
draw(sequence(new path3(int i){
return sf.s[i].external();},sf.s.length), orange+1bp);
