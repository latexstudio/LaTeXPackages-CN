texpreamble("\usepackage{CJKutf8}
      \AtBeginDocument{\begin{CJK}{UTF8}{gbsn}}
        \AtEndDocument{\clearpage\end{CJK}}");

size(200);
path p=reverse(arc((0,0),1,20,160));
string[] fonts={"中","华","人","民","共","和","国","万","岁"};
pen[] colors={cyan,magenta,yellow,green,blue,red};
colors.cyclic=true;
for(int i=0;i<fonts.length;++i){
  real a=i/(fonts.length-1)*length(p);
  pair Position=point(p,a);
  pair T=dir(p,a);
  real Angle=degrees(T);
  label(rotate(Angle,Position)*scale(2)*fonts[i],Position,colors[i]);
}
draw(p,lightgray);
