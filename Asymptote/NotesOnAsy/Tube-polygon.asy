import tube;
import graph3;
size(0,200);
currentprojection=perspective(4,3,4);
real x(real t) {return (1/sqrt(1+0.5*t^2))*cos(2pi*t);}
real y(real t) {return (1/sqrt(1+0.5*t^2))*sin(2pi*t);}
real z(real t) {return t;}
path3 p=graph(x,y,z,0,2.7,operator ..);
path section=scale(0.2)*polygon(5);
coloredpath cp=coloredpath(section,new pen[]{brown,green,blue,red,yellow},
                           colortype=coloredSegments);
draw(tube(p,cp));
