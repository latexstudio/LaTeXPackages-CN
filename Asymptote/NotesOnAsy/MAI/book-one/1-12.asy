size(200);
import graph;
import geometry;
path p=(14,64)..controls(27.3999450372,65.7853098391)and(40.3144351869,70.2034248903)..(52,77)
..controls(60.4538340412,81.9169311834)and(68.1530587385,88.0180378611)..(75,95)
..controls(89.6237720615,109.912151129)and(99.9742102782,128.340791551)..(107,148)
     ..controls(109.915900847,156.159125855)and(112.254992342,164.513024052)..(114,173);
draw(p,linewidth(1));
pair P=point(p,length(p));
draw(rotate(45)*Label("$y=x$",align=SE),(0,0)--(173,173),dashed);

draw(shift(160,160)*rotate(45)*scale(0.2,0.4)*Arc((0,0),r=20,angle1=20,angle2=320),(160,160),Arrow());
label("$y=f(x)$",(35,140));
label("$x=f^{-1}(y)$",(40,120));
label("$O$",(0,0),SW);
xaxis("$x$",Arrow());
yaxis(Label("$y$",align=E),Arrow());
