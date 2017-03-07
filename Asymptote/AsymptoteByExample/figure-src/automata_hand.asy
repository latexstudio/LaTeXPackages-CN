//#-*- coding: utf-8 -*-
// 模仿手绘自动机（需要 node 模块）
// 刘海洋
import node;
import trembling;

startTrembling();

typedef path fpath(path);

path operator@(path p, fpath t)
{
    return t(p);
}

fpath shorten(real pre=0, real post=2)
{
    return new path(path p) {
	return subpath(p, arctime(p, pre), arctime(p, arclength(p)-post));
    };
}
fpath shorten=shorten(0,2);

settings.tex="xelatex";
usepackage("fontspec");
usepackage("amsmath");
texpreamble("\setmainfont{FZQiTi-S14}");

real u = 2cm;
Arrow = Arrow(SimpleHead, 6);
pen text = black;
pen starttext = black;
defaultpen(linewidth(0.6));
currentpen = fontcommand("\scriptsize");

draw_t Initial = none;
draw_t State = drawer;
draw_t Accepting = compose(drawer(linewidth(1.8)), drawer(white+0.6));

node q0 = Circle("q$_{\text{0}}$", (0,0), text, State),
     q1 = Circle("q$_{\text{1}}$", q0.pos + u*S, text, State),
     q2 = Circle("q$_{\text{2}}$", q1.pos + u*E, text, Accepting),
     q3 = Circle("q$_{\text{3}}$", q0.pos + u*E, text, State),
     q4 = Circle("q$_{\text{4}}$", q3.pos + u*E + 0.5u*S, text, State),
     q5 = Circle("q$_{\text{5}}$", q4.pos + u*E, text, State),
     q6 = Circle("q$_{\text{6}}$", q5.pos + u*E, text, Accepting),
     q7 = Circle("q$_{\text{7}}$", q6.pos + u*E, text, Accepting);
node start = Rectangle("开始", q0.pos + 0.7u*W, starttext, innersep=0, Initial);
draw(start, q0, q1, q2, q3, q4, q5, q6, q7);

draw(start -- q0 @ shorten, Arrow);
draw(".",     q0 -- q1 @ shorten, Arrow);
draw("[0-9]", q1 -- q2 @ shorten, Arrow);
draw(".",     q3 -- q2 @ shorten, Arrow);
draw("[eE]",  q2 -- q4 @ shorten(1,2), Arrow);
draw(Label("[0-9]", LeftSide),  q0 -- q3 @ shorten, Arrow);
draw(Label("[eE]", LeftSide),   q3 -- q4 @ shorten, Arrow);
draw(Label("[+-]", LeftSide),   q4 -- q5 @ shorten, Arrow);
draw(Label("[0-9]", LeftSide),  q5 -- q6 @ shorten, Arrow);
draw(Label("[fFlL]", LeftSide), q6 -- q7 @ shorten(1,2), Arrow);
draw("[0-9]", loop(q3, N) @ shorten, Arrow);
draw("[0-9]", loop(q2, S) @ shorten(1,2), Arrow);
draw("[0-9]", loop(q6, N) @ shorten(1,2), Arrow);
draw("[0-9]",  q4 .. bendright .. q6 @ shorten, Arrow);
draw("[fFlL]", q2 .. bendright .. q7 @ shorten(1,2), Arrow);

//shipout(bbox(0.5cm, Fill(white)));
