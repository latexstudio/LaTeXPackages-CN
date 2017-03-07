settings.tex="xelatex";
settings.prc=false;
texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
import tube;
import palette;
size(200,0);
currentprojection=perspective(0.5,-0.5,0.5,up=Z);
path[] china=texpath("中国");
path3[] p=scale3(0.5)*path3(china);
for(int i=0;i<china.length;++i){
  tube T=tube(p[i],0.2);
  surface s=T.s;
  s.colors(palette(s.map(abs),BWRainbow()));
  draw(s);
}
