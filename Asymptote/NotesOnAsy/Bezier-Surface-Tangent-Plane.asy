import three;
size(200,0);
triple[][] P={
  {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
  {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
  {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
  {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
};
surface sf=surface(patch(P));
draw(sf,palecyan+opacity(0.8));
draw(sequence(new path3(int i){
      return sf.s[i].external();},sf.s.length), orange+1bp);
real t=0.5;
path3 u=sf.s[0].uequals(t);
path3 v=sf.s[0].vequals(t);
draw(u,red);
draw(v,red);
triple P=point(u,t);
dot(P,blue);
triple dU=dir(u,t);
triple dV=dir(v,t);
draw(surface(plane(1.5dU,1.5dV,P)),yellow+opacity(0.5));
triple dX=0.5dU+dV;
triple dY=0.5dU+0.5dV;
draw(P--P+dX,Arrow3(DefaultHead2(normal=Z)));
draw(P--P+dY,Arrow3(DefaultHead2(normal=Z)));
draw(P--P+dX+dY,Arrow3(DefaultHead2(normal=Z)));
