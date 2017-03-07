import three;
size(200);
path3 p=(1,2,2)..(3,9,2)..(4,4,4)..(2,3,0)..cycle;
surface sf=surface(p,new pen[]{cyan,yellow,magenta,black});
draw(sf,nolight);
dot(sf.s[0].internal());
dot(sf.s[0].external());
