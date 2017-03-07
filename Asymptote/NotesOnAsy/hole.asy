import three;
size(200);
path p=unitcircle;
path q=scale(2)*p;
draw(surface(reverse(path3(p))^^path3(q),planar=true),yellow);

