size(200);
import graph;
xlimits(-4,4);
ylimits(-3,3);
axes("$x$","$y$",Arrow());
draw((-3,-3)--(-3,0),dashed);
draw((-2,-3)--(-2,0),dashed);
draw((-1,-2),(-1,0),dashed);
draw((1,1)--(1,0),dashed);
draw((2,2)--(2,0),dashed);
draw((3,2)--(3,0),dashed);
draw((-1,-2)--(-1,0),dashed);

for(int i=-3;i<=2;++i){
  draw((i,i)--(i+1,i));
  dot((i,i));
  dot((i+1,i),UnFill);
}
label("$O$",(0,0),SW);
for(int i=1;i<=3;++i){
  label(format("$%d$",i),i,S);
}
for(int i=-3;i<0;++i){
  label(format("$%d$",i),i,N);
}

label("$y=[\,x\,]$",(2.5,2),N);
