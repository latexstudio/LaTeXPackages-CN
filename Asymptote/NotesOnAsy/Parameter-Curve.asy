import graph;
size(200);
pair f(real t){
  real x=(1-t^2)/(1+t^2);
  real y=t*(1-t^2)/(1+t^2);
  return (x,y);
}
draw(graph(f,-2,2),red);
/*
  real x(real t) {return (1-t^2)/(1+t^2);}
  real y(real t) {return t*(1-t^2)/(1+t^2);}
  draw(graph(x,y,-2,2),red);
*/
limits((-1.5,-1.5),(1.5,1.5));
xaxis("$x$",Arrow);
yaxis("$y$",Arrow);


