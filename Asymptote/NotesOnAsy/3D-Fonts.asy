settings.tex="xelatex";
settings.prc=false;
texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
import graph3 ;
size(200);
currentprojection=orthographic(39.4,-264.6,121) ;
real f(pair z) {return 0.5+exp(-abs(z)^2);}
draw(surface(f,(-2.5,-2.5),(2.5,2.5),20,Spline),lightgray);
path[] china=scale(0.2)*texpath("中国");
guide[][] gui;
for(int i=0;i<china.length;++i){
  gui[i]=new guide[];
  int n=8;
  for(int j=0;j<n*length(china[i]);++j){
    gui[i][j]=subpath(china[i],j/n,(j+1)/n);
  }
}
draw(lift(f,gui),yellow+1pt);
