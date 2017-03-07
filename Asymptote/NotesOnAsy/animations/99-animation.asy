import animate;
settings.tex="xelatex";
usepackage("xcolor");
import animation;
animation A;
int n=9;
for(int j=1;j<=n;++j){
  for(int i=1;i<=j;++i){
    picture pic;
    label(pic,scale(15)*(format("${%d}$",i)+"$\times$"+format("${%d}$",j)+"{\color{red}=}"+format("${\color{white}%d}$",i*j)+";"));
    A.add(pic);
    picture fig;
    label(fig,scale(15)*(format("${%d}$",i)+"$\times$"+format("${%d}$",j)+"{\color{red}=}"+format("${\color{blue}%d}$",i*j)+";"));
    A.add(fig);
  }
}
label(A.pdf(delay=2000,"buttonsize=2.44em,controls,loop"));
