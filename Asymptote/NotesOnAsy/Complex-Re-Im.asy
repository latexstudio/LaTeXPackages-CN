import graph3;
import palette;
size(200);
pair f(pair z){return sin(z);}
currentprojection=orthographic(1,2,1);
surface s=surface(new real(pair z) {return f(z).x;},
		  (-pi/2,-pi/2),(pi/2,pi/2),10,Spline);
s.colors(palette(s.map(new real(triple v){
        return f((v.x,v.y)).y;}),Rainbow()));
draw(s);
