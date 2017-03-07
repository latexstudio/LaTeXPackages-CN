size(200);
import graph;
guide p=(16,68).. controls (24.1170592018,65.6434076155) and (31.6240749879,61.5486717322)
  ..(38,56).. controls (45.6135411885,49.3742883277) and (51.3362355511,40.9428363361)
  ..(56,32).. controls (56.6893631291,30.6781361479) and (57.3561267958,29.3446088146)
  ..(58,28);

draw(p,linewidth(1));
pair T=point(p,length(p));
pair K=(T.x,0);
draw(T--K,dashed);
guide q=reflect(T,K)*p;

draw(q,linewidth(1));

label(Label("$f'<0$",position=Relative(0.7),align=2W),p);
label(Label("$f'>0$",position=Relative(0.7),align=2E),q);

label("$x_{0}$",K,S);
label("$O$",(0,0),SW);
xlimits(-1,120);
ylimits(-1,80);
axes("$x$","$y$",Arrow());
