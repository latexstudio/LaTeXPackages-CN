picture pic;
size(pic,200,0);
draw(pic,unitcircle);
draw(pic,scale(1.5)*unitcircle);
int n=120;
for(int i=0;i<n;++i){
  draw(pic,expi(i*2pi/n)--1.5expi(i*2pi/n));
}

draw(pic,Label("$R$",align=N),(0,0)--(1,0));
path p=(1.23,0).. controls (1.2121389051855,0.06579490667565) and (1.2391262964705,0.1791419500725)
 ..(1.305,0.27).. controls (1.366498578675,0.3548235431175) and (1.457424960138,0.413658260535)
  ..(1.56,0.435);
draw(pic,Label("$\Delta R$",EndPoint,align=E),p,linewidth(1));
add(pic.fit(),(0,0),N);

picture fig;
size(fig,250,0);
pair A=(-2.8,0);
pair B=(2.8,0);
pair C=(3,.5);
pair D=(-3,.5);
draw(fig,A--B--C--D--cycle,linewidth(1));
label(fig,"$2\pi R$",(0,0),align=S);
label(fig,"$\Delta R$",(1.5,0.5/2),align=Center);
draw(fig,(1.5,0.8)--(1.5,0.5),Arrow());
draw(fig,(1.5,-0.3)--(1.5,0),Arrow());
add(fig.fit(),(0,0),50S);
