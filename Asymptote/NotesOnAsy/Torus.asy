size(200);
import solids;
currentprojection=perspective(5,4,4);
draw(shift(3X)*Circle(O,1,Y,32),red+2);
xaxis3("$x$",0,5,Arrow3);
yaxis3("$y$",0,5,Arrow3);
zaxis3("$z$",Arrow3);
revolution torus=revolution(shift(3X)*Circle(O,1,Y,32),Z,90,360);
draw(surface(torus),green);
