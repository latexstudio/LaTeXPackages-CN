//生成的 pdf 文件目前只能在 Windows 下用最新的 Adobe Reader 打开.
settings.tex="xelatex";
texpreamble("\usepackage{xeCJK}
\setmainfont{Comic Sans MS}
\setCJKmainfont{SimHei}");
settings.user="stepping=true";
string[] foods={"cake","chicken"};
orientation=Landscape;
import slide;
import embed;
usersetting();
defaultpen(fontsize(100)+blue);
for(int i=0;i<foods.length;++i){
  newslide();
  label(graphic(foods[i]+".pdf"));
  display(embed.embed(foods[i]+".mp3",
                      "poster,text="+"\bf{"+foods[i]+"}"));
}
titlepen=fontsize(60)+red;
titlepen=fontsize(40)+blue;
title("title");
item("item");
item("item");
subitem("subitem");
