texpreamble("
\usepackage{xeCJK}
%\setmainfont{DejaVu Sans}
\setmainfont{TeX Gyre Heros:style=Bold}
\setCJKmainfont{SimHei}
");
settings.tex="xelatex";
settings.user="stepping=true"; // 生成步进形式的幻灯

orientation=Landscape;
import slide;
import three; // 此处告诉 asy 调用 hyperref 和 movie15.
usersetting();// 使得 settings.user="stepping=true"; 生效.
titlepen=fontsize(40)+brown;// 控制 title 的字体大小和颜色.
itempen=fontsize(20)+green;// 控制 item 的字体大小和颜色.
import x11colors; // Azure 颜色在 x11colors 里面定义了.
fill(background,box((-1,-1),(1,1)),Azure);
label(background,"",(0,startposition.y));

titlepage(title="PRC 真 3D 示例",
          author="F.A.Zhang",
          institution="数学系",
          date="\today",
          url="http://bbs.ctex.org");
title("Asymptote 开始支持真3D");
item("整个进展如下");
subitem("先是支持把 asy 生成的 prc 嵌入 pdf 中");
subitem("接着支持利用 OpenGL 不依赖于 Adobe Reader 预览");
item("希望有进一步的进展");
item("下面是一个 unitbox 的例子");
newslide();
asyinclude("unitbox",20cm);


