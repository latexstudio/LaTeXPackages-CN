// -*- coding:utf-8 -*-
settings.tex="xelatex";
texpreamble("\usepackage{xeCJK}
\setCJKmainfont{Adobe Heiti Std}
");
label(graphic("Costa.pdf"),position=(-2,-2),align=NE);
layer();
draw(Label("这是 Costa 曲面的洞",BeginPoint,red),(93,173)--(111,131),blue+1pt,Arrow());
shipout(bbox(0,blue));

