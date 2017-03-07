// # -*- coding:utf-8 -*-
// 星空图
// 刘海洋
srand(seconds());
// 随机实数
real random(real a, real b=0)
{
    return (b-a) * unitrand() + a;
}
// 半径为 1 的 n 角星形路向
guide star(int n = 5, real r = 0, real angle = 90)
{
    guide unitstar;
    if (n < 2) return nullpath;
    real theta = 180/n;
    if (r == 0) {
        if (n < 5)
            r = 1/4;
        else
            r = Cos(2theta) / Cos(theta);
    }
    for (int k = 0; k < n; ++k)
        unitstar = unitstar -- dir(angle+2k*theta) -- r * dir(angle+(2k+1)*theta);
    unitstar = unitstar -- cycle;
    return unitstar;
}
// 全局定义
size(15cm);
real xmin=0, ymin=0, xmax=40, ymax=30, sizemin=0.3, sizemax=0.8;
pen[] colors = {palered, paleblue, lightyellow, pink};
// 夜空
fill(box((xmin-1,ymin-1), (xmax+1,ymax+1)), darkblue);
// 星星
for (int i = 0; i < 100; ++i) {
    real shape = unitrand();
    pair pos = (random(xmin, xmax), random(ymin, ymax));
    real size = random(sizemin, sizemax);
    pen color = colors[rand() % colors.length];
    if (shape < 1/3)
        fill(shift(pos)*scale(size)*star(4), color);
    else if (shape < 2/3)
        fill(shift(pos)*scale(size)*star(5), color);
    else
        draw(pos, white+1bp);
}
// 彗星
picture comet;
radialshade(comet, unitcircle,
            yellow, (0,0), 0.2,
            darkblue, (0,0), 1);
path tail = (0,0){NW} .. {W}(-20,10);
for (real t = 0; t < 1; t += 1/1000) {
    real r = 0.2 + 2*t^3;
    draw(comet, point(tail,t^3) + (random(-r,r), random(-r,r)),
         lightyellow+1bp);
}
add(shift(30,3) * comet);
// 月亮
picture moon_nobg, moon;
fill(moon_nobg, unitcircle, lightyellow);
unfill(moon_nobg, shift(-0.5,-0.2)*unitcircle);
fill(moon, unitcircle, darkblue);
add(moon, moon_nobg);
add(shift(5, 25) * scale(2) * moon);
// 文字
settings.tex = "xelatex";
usepackage("xeCJK");
texpreamble("\setCJKmainfont{FZSongHeiTi_GB18030}"); // 方正宋黑体
string text = "\begin{minipage}{3em}
天上星\par
亮晶晶\par
永燦爛\par
長安寧
\end{minipage}";
label(text, (xmax,ymax), align=SW, yellow+fontsize(0.7cm),
      Fill(darkblue+opacity(0.5)));
