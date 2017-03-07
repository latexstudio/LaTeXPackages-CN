// # -*- coding: utf-8 -*-
settings.tex="xelatex";
settings.render=8;
texpreamble("\usepackage{xeCJK}
\setCJKmainfont{KaiTi}
\usepackage{hyperref}
\hypersetup{
  bookmarksopen=false,
  bookmarksnumbered=true,
  pdftitle={馬},
  pdfauthor={cvgmt},
  pdfcreator={Asymptote2.24+XeLaTeX},
  %pdfstartview={FitH},
  pdfpagemode=FullScreen,
  setpagesize=false,
  colorlinks=false,
  pdfborder=0 0 1
}");
srand(seconds());
path[] name=texpath("涂");

import animate;
animation Ani;
picture pic;
size(pic,0,600);
draw(pic,name,blue+2);
pair a=min(name);
pair b=max(name);
for(int k;k<name.length;++k){
  for(real x: uniform(a.x, b.x, 45)){
    for(real y: uniform(a.y,b.y,15)){
      real r=0.2;
      pair h=r*(unitrand()-1/2, unitrand()-1/2);
      pair z=(x,y)+h;
      if(inside(name[k],z)){
        label(pic,scale(2)*"馬",z,rgb(unitrand(),unitrand(),unitrand()));
        clip(pic,name);
        Ani.add(pic);
      }

    }
  }
}

Ani.movie(delay=500);
//label(Ani.pdf(keep=true,delay=500,"autoplay,controls,loop",multipage=false));
label(Ani.pdf(keep=true,delay=500,"autoplay,loop",multipage=false));
