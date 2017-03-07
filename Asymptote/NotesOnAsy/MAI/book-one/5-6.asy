size(200);
import graph;
guide p=(16,32)..controls(24.1170592018,34.3565923845)and(31.6240749879,38.4513282678)..(38,44)
..controls(45.6135411885,50.6257116723)and(51.3362355511,59.0571636639)..(56,68)
  ..controls(56.6893631291,69.3218638521)and(57.3561267958,70.6553911854)..(58,72);

draw(p,linewidth(1));
pair T=point(p,length(p));
pair K=(T.x,0);
draw(T--K,dashed);
guide q=reflect(T,K)*p;

draw(q,linewidth(1));

label(Label("$f'>0$",position=Relative(0.7),align=2W),p);
label(Label("$f'<0$",position=Relative(0.7),align=2E),q);

label("$x_{0}$",K,S);
label("$O$",(0,0),SW);
xlimits(-1,120);
ylimits(-1,80);
axes("$x$","$y$",Arrow());
