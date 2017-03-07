//I had modified the code,the picture looks perfect now:-)
//# -*- coding: utf-8 -*-
settings.tex="xelatex";
texpreamble("
\usepackage{wasysym}
\usepackage{amssymb}
\usepackage{xeCJK}
\setCJKmainfont{Adobe Kaiti Std}
");
path p=reverse(arc((0,0),1,25,150));
string[] fonts={"谢","谢","\twonotes","小","k","$\kappa$","o","！"};
pen[] colors={cyan,magenta,red,yellow,green,blue,purple,brown};
colors.cyclic=true;

import animate;
animation Ani;
picture figure;

for(int i=-1;i<fonts.length;++i){

  size(figure,400);
  if(i==-1){
    Ani.add(figure);
  }
  else{
    real a=i/(fonts.length-1)*length(p);
    pair Position=point(p,a);
    pair T=dir(p,a);
    real Angle=degrees(T);
    label(figure,rotate(Angle,Position)*scale(4)*fonts[i],Position,colors[i]);
    Ani.add(figure);
  }
}
Ani.movie(delay=500);
