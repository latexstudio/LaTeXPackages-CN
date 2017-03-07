import slopefield;
picture base;
size(base,200);
real func(real x) {return 2x;}
add(base,slopefield(func,(-3,-3),(3,3),20,Arrow));
draw(base,curve((0,0),func,(-3,-3),(3,3)),red);
draw(base,box((0,0),(1,1)),blue);
add(base.fit());

clip(base,box((0,0),(1,1)));
add(scale(0.5)*base.fit(),(150,10));
