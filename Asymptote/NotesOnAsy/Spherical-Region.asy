size(200);
import palette;
import graph3;
triple f(pair t){
  real theta=t.x;
  real phi=t.y;
  return (1+sin(5*theta)*sin(5*phi)/5)*expi(theta,phi);
}
surface sf=surface(f,(0,0),(pi,2pi),50,Spline);
sf.colors(palette(sf.map(abs),Gradient(red,yellow)));
draw(sf);



