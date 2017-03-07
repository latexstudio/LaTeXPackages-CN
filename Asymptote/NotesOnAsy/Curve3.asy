import three;
size(200);
path3 g=(1,0,0)..(0,1,1)..(-1,0,0)..(0,-1,1)..cycle;
draw(g,green);
dot(g,red);
draw((-1,-1,0)--(1,-1,0)--(1,1,0)--(-1,1,0)--cycle,blue);
