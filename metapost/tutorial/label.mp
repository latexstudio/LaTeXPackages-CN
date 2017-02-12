prologues:=3;

if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j-%c.mps";

verbatimtex
%&latex
\documentclass[11pt]{article}
\usepackage[charter]{mathdesign}
\usepackage[T1]{fontenc}
\renewcommand*{\ttdefault}{lmtt}
\begin{document}
etex

% Determine the size of the default font
w:=fontsize defaultfont;

beginfig(1);
	% Place a "point" at (0,0)
	fill fullcircle scaled 3;

	% Draw a square around the point
	draw (-7*w/16,-7*w/16)--(7*w/16,-7*w/16)--(7*w/16,7*w/16)--(-7*w/16,7*w/16)--cycle;

	% Draw vertical and horizontal lines through the point
	draw (0,-7*w/16)--(0,7*w/16);
	draw (-7*w/16,0)--(7*w/16,0);

	% Label the 4 positions
	label.lft(btex \texttt{lft} etex,(-w/4,0));
	label.rt(btex \texttt{rt} etex,(w/4,0));
	label.bot(btex \texttt{bot} etex,(0,-w/4));
	label.top(btex \texttt{top} etex,(0,w/4));

	% Manually set the bbox
	setbounds currentpicture to (-2*w,-2*w)--(2*w,-2*w)--(2*w,2*w)--(-2*w,2*w)--cycle;
endfig;

beginfig(2);
	% Place a "point" at (0,0)
	fill fullcircle scaled 3;

	% Draw a square around the point
	draw (-7*w/16,-7*w/16)--(7*w/16,-7*w/16)--(7*w/16,7*w/16)--(-7*w/16,7*w/16)--cycle;

	% Draw diagonals of the square through the point
	draw (-7*w/16,-7*w/16)--(7*w/16,7*w/16);
	draw (-7*w/16,7*w/16)--(7*w/16,-7*w/16);

	% Label the 4 positions
	label.llft(btex \texttt{llft} etex,(-w/4,-w/4));
	label.ulft(btex \texttt{ulft} etex,(-w/4,w/4));
	label.lrt(btex \texttt{lrt} etex,(w/4,-w/4));
	label.urt(btex \texttt{urt} etex,(w/4,w/4));

	% Manually set the bbox
	setbounds currentpicture to (-11/4*w,-2*w)--(11/4*w,-2*w)--(11/4*w,2*w)--(-11/4*w,2*w)--cycle;
endfig;
end
