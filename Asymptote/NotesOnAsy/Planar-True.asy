size(200);
import three;
currentprojection=orthographic(3,4,2);
path p=reverse(polygon(6));
path q=scale(0.3)*unitcircle;
path3 pp=path3(p);
path3 qq=path3(q);
draw(surface(pp^^qq,planar=true),red);
draw(surface(shift(Z)*pp^^qq,planar=true),blue);
for(path h : p)
  draw(extrude(h,Z),green+opacity(0.5),black+1pt);
for(path h : q)
  draw(extrude(h,Z),green);

