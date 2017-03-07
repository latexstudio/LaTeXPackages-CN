import graph3;
size(200);
currentprojection=orthographic(-4,-4,5);
real R=12;
triple f(pair t){
  real u=t.x;
  real v=t.y;
  real x=(R+u*cos(v/2))*cos(v);
  real y=(R+u*cos(v/2))*sin(v);
  real z=u*sin(v/2);
  return (x,y,z);
}
material m=(material(diffusepen=grey,ambientpen=yellow,
                     emissivepen=black,specularpen=orange));
surface s=surface(f,(-pi,0),(pi,2pi),50,Spline);
draw(s,m);

