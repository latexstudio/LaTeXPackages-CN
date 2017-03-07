import graph;
size(0,100);

pair[] z={(0,1/4),(1/4,1),(1,2+3/4),(2+3/4,4+1/4),(4+1/4,5)};
real[] Y={1,0.92,0.8325,0.7217,0.5171};
for(int i=0;i<Y.length;++i){
  draw((z[i].x,Y[i])--(z[i].y,Y[i]),red);
  dot((z[i].x,Y[i]));
  dot((z[i].y,Y[i]),UnFill);
}
xaxis("$x$",0,5.5,Arrow);
yaxis("$y$",0,1.4,Arrow);
