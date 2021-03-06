size(200);
import solids;
currentprojection=perspective(4,3,2);
revolution Sp=sphere(1);
draw(Sp.silhouette(100),red);
triple P=dir(40,60);
draw("$r$",O--P);
draw("$\phi$",arc(O,1/3,0,0,40,60),N+0.3E,Arrow3(DefaultHead2));
draw("$\theta$",arc(O,1/2,90,0,90,60),Arrow3(DefaultHead2));
draw(O--dir(90,60),dashed);
draw(P--(xpart(P),ypart(P),0));
triple i=dir(40,60);
triple j=dir(40+90,60);
triple k=cross(i,j);
draw(Label("$\dot{r}$",1),i--i+0.5*i,red,Arrow3());
draw(Label("$\dot{\phi}$",1),i--i+0.5*j,red,Arrow3());
draw(Label("$\dot{\theta}$",1),i--i+0.5*k,red,Arrow3());
path3 pa=arc(c=O,r=1,0,60,40,60);
real l=arclength(pa);
real k=(1-l/pi);
skeleton s;
Sp.transverse(s,k*length(Sp.g));
Sp.transverse(s,reltime(Sp.g,0.5));
draw(s.transverse.front,blue);
draw(s.transverse.back,blue+dashed);
draw(arc(c=O,r=1,-10,60,150,60));
draw(arc(c=O,r=1,150,60,-10,60),dashed);
draw(arc(c=O,r=1,-10,0,140,0));
draw(arc(c=O,r=1,14,0,-10,0),dashed);
xaxis3("$x$",-1.5,1.5);
yaxis3("$y$",-1.5,1.5);
zaxis3("$z$",-1.5,1.5);
