import graph3;
size3(200,IgnoreAspect);
currentprojection=orthographic(-2,-2,4);
file in=input("data-1.txt").line();
real[] x=in;
real[] y=in;
real[][] z=in.dimension(0,0);
surface s=surface(z,(0,0),(x.length-1,y.length-1));
draw(s,yellow+opacity(0.5),meshpen=thick());
