import graph3;
size(200);
triple f(pair z){return expi(z.x,z.y);}
path3 vector(pair z) {
  real t=sqrtEpsilon;
  triple V=(expi(z.x,z.y)-expi(z.x+t,z.y))/t;
  V=unit(V);
  return O--V;
}
add(vectorfield(vector,f,(0,0),(pi,2pi),20,0.15,yellow));
draw(unitsphere,palegray); 
limits((-1.5,-1.5,-1.5),(1.5,1.5,1.5));
axes3("$x$","$y$","$z$",red,Arrow3());
