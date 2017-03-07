//#-*- coding: utf-8 -*-
// automata.asy
// `\color{comment}描述 C 语言浮点数词法有限自动机（需要 simplenode 模块）`
import simplenode;

settings.tex="xelatex";
usepackage("xeCJK");
texpreamble("\setCJKmainfont{SimHei}");

real u = 2cm;
Arrow = Arrow(6);
pen text = white;
pen starttext = black;
currentpen = linewidth(0.6) + fontcommand("\scriptsize\ttfamily");

draw_t Initial = none;
draw_t State = compose(shadow, filldrawer(deepgreen, darkgreen+0.6));
draw_t Accepting = compose(shadow, filler(deepgreen),
                           drawer(darkgreen+1.8), drawer(white+0.6));

node q0 = Circle("$q_0$", (0,0), text, State),
     q1 = Circle("$q_1$", q0.pos + u*S, text, State),
     q2 = Circle("$q_2$", q1.pos + u*E, text, Accepting),
     q3 = Circle("$q_3$", q0.pos + u*E, text, State),
     q4 = Circle("$q_4$", q3.pos + u*E + 0.5u*S, text, State),
     q5 = Circle("$q_5$", q4.pos + u*E, text, State),
     q6 = Circle("$q_6$", q5.pos + u*E, text, Accepting),
     q7 = Circle("$q_7$", q6.pos + u*E, text, Accepting);
node start = Circle("开始", q0.pos + 0.7u*W, starttext, Initial);
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
draw("[0-9]", q3 .. loop(N) @ shorten, Arrow);
draw("[0-9]", q2 .. loop(S) @ shorten(1,2), Arrow);
draw("[0-9]", q6 .. loop(N) @ shorten(1,2), Arrow);
draw("[0-9]",  q4 .. bendright .. q6 @ shorten, Arrow);
draw("[fFlL]", q2 .. bendright .. q7 @ shorten(1,2), Arrow);

