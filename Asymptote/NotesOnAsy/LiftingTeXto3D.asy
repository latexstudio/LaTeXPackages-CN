settings.tex="xelatex";
settings.prc=false;
texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
import graph3 ;
size(300);
currentprojection=orthographic(-20,-24,292);
real f(pair z){return z.x^2-z.y^2;}
surface surf=surface(f,(-6,-4),(6,4),30,30);
draw(surf,palegray,nolight,meshpen=paleblue+1pt);
string ctex="中文 \TeX";
real uoffset=0.3*30;
real voffset=0.3*30;
draw(surf.uequals(uoffset),red+dashed+1.2pt);
draw(surf.vequals(voffset),green+dashed+1.2pt);
draw(surface(scale(0.2)*ctex,surf,uoffset,voffset,height=0.2),yellow);


