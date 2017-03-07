settings.prc=false;
settings.render=0;
settings.tex="xelatex";
import three;
import animate;
currentprojection=orthographic(1,1,1.3);
picture base;
triple[][] P={
  {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
  {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
  {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
  {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
};
surface sf=surface(patch(P));
draw(base,sf,palecyan+opacity(0.8),nolight);
draw(base,sequence(new path3(int i){
      return sf.s[i].external();},sf.s.length), pink+1bp);
animation A;
real T=0.7;
int n=20;
for(int i=0;i<n;++i){
  picture pic;
  size(pic,250);
  add(pic,base);
  real t=interp(0.2,0.8,i/n);
  path3 u=sf.s[0].uequals(T);
  path3 v=sf.s[0].vequals(t);
  draw(pic,u,red);
  draw(pic,v,invisible);
  triple P=point(u,t);
  triple Q=point(v,T);
  dot(pic,Q,green);
  dot(pic,P,green);
  triple dU=dir(u,t);
  triple dV=dir(v,T);
  draw(pic,surface(plane(.6dU,.6dV,P)),yellow+opacity(0.5),nolight);
  draw(pic,P--P+.5dU,Arrow3());
  draw(pic,P--P+.5dV,Arrow3());
  draw(pic,P--P+cross(.5dV,.5dU),Arrow3());
  A.add(pic);
}
label(A.pdf("controls,autoplay,loop",keep=true,delay=400));
