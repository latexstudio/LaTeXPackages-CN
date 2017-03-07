import three;
size(200);
path p=(1,0)..(0,1)..(-1,0)..(0,-1)..cycle;
path3 p3=path3(p);
draw(p3);
dot(p3,red);
