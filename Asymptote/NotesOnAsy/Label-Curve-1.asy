texpreamble("\usepackage{CJKutf8}
      \AtBeginDocument{\begin{CJK*}{UTF8}{gbsn}}
        \AtEndDocument{\clearpage\end{CJK*}}");
size(200);
import labelpath;
path p=reverse(rotate(-90)*yscale(2)*xscale(4)*unitcircle);
labelpath("中华人民共和国万岁",p,red);
//draw(p);
