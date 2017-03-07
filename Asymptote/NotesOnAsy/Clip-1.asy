size(200);
import patterns;
draw(unitcircle,red);
add("name",hatch(NW));
filldraw(unitsquare,pattern("name"));

clip(currentpicture,unitcircle);
