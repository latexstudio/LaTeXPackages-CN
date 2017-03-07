size(200);
import geometry;
point A=(0,0);
point B=(3,4);
point C=(3,0);
markangle("$t$",C,A,B,radius=30);
draw(Label("$a$",W),A--B,linewidth(1));
draw(Label("$x$"),C--B,linewidth(1));
draw(Label("$\sqrt{a^2-x^2}$"),A--C,linewidth(1));
