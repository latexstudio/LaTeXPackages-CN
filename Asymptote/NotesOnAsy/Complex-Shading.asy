import graph3;
import palette;
size(200);
currentprojection=orthographic(1,2,1);
surface s=surface(new real(pair z) {return abs(sin(z));},
		  (-pi/2,-pi/2),(pi/2,pi/2),10,Spline);

s.colors(palette(s.map(new real(triple v){
        return degrees(sin((v.x,v.y)),warn=false);}),Wheel()));
draw(s);
