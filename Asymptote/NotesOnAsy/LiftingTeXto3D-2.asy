settings.tex="xelatex";
settings.prc=false;
texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
import graph3;
size(200,0);
currentprojection=orthographic(4,0,2);
real R=2;
real a=1.2;
triple f(pair t) {
  return ((R+a*cos(t.y))*cos(t.x),(R+a*cos(t.y))*sin(t.x),a*sin(t.y));
}
surface s=surface(f,(0,0),(2pi,2pi),20,20,Spline);
draw(s,lightgray);
string ctex="中文\TeX";
real uoffset=0.1*20;
real voffset=0.15*20;
real h=0.05;
draw(surface(scale(0.15)*ctex,s,uoffset,voffset,h),yellow);
draw(s.uequals(uoffset),red+dashed);
draw(s.vequals(voffset),blue+dashed);
