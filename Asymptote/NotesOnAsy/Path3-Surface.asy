//srand(seconds());
size(200);
import three;
path3 g=randompath3(15);
draw(g,red+thin());
surface s=unitsphere;
draw(s,lightyellow);
dot(intersectionpoints(g,s),red);
