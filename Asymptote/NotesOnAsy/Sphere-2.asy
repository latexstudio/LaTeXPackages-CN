import graph3;
import palette;
size(200);
triple f(pair z){return (1+sin(5z.x)*sin(5z.y)/5)*expi(z.x,z.y);}
surface sf=surface(f,(0,0),(pi,2pi),40,Spline);
sf.colors(palette(sf.map(abs),Gradient(orange,paleyellow)));
draw(sf);
