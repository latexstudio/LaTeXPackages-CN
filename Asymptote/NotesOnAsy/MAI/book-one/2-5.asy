size(200);
import math;
import graph;
path p=(-59,68).. controls (-46.5203226427,58.6118357427) and (-31.5811116618,53.0530595638)
 ..(-16,52).. controls (-1.34944548619,51.0098327462) and (13.1895842553,54.0381811713)
 ..(27,59).. controls (34.1727446595,61.5770302765) and (41.1454435459,64.6690152814)
 ..(48,68).. controls (57.5264587615,72.6294007161) and (66.8200432764,77.7174961828)
 ..(76,83).. controls (83.3830456299,87.2484913488) and (90.692647387,91.6226941582)
 ..(98,96).. controls (109.671672362,102.9916537924) and (121.338342013,109.9916555832)
  ..(133,117);
draw(rotate(30)*Label("$y=f(x)$",Relative(0.4),align=2N),p,linewidth(1));

pair A=(-10,17);
pair T=(-3,-2.05);

drawline(A,A+T);
label(rotate(aTan(T.y/T.x))*"$y=kx+b$",position=A-15T,align=SE);
pair P=point(p,0.75*length(p));
label("$x$",P.x,S);
draw(P--(P.x,0),dashed);

label("$O$",(0,0),SW);
axes("$x$","$y$",Arrow());

