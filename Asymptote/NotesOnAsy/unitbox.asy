// unitbox.asy
import three;
size(200);
defaultrender=render(compression=Zero,merge=true);
draw(unitbox);
dot((1,1,1),red);
arrow(Label("$A$ 点"),(1,1,1),-Z+Y);
