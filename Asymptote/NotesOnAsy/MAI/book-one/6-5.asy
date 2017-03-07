size(200);
import geometry;
point A=(0,0);
point B=(3,4);
point C=(3,0);
markangle("$t$",C,A,B,radius=30);
draw(Label("$x$",align=W),A--B,linewidth(1));
draw(Label("$\sqrt{x^2-a^2}$"),C--B,linewidth(1));
draw(Label("$a$"),A--C,linewidth(1));
