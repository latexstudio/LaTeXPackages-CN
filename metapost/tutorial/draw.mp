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

% Set unit size to 72bp = 1in
u:=72;

beginfig(1);
	% Draw line segmented path
	draw (0,0)--(3*u/4,u/4)--(u,u) dashed evenly scaled 0.6;

	% Draw curved path
	draw (0,0){right}..{dir 45}(3*u/4,u/4){dir 45}..{up}(u,u);

	% Label the 3 points
	label.bot(btex \texttt{z1} etex,(0,0));
	label.lrt(btex \texttt{z2} etex,(3*u/4,u/4));
	label.rt(btex \texttt{z3} etex,(u,u));
endfig;

beginfig(2);
	% Draw arrow around curved path
	drawarrow (0,0){right}..{dir 45}(3*u/4,u/4){dir 45}..{up}(u,u);

	% Label the 3 points
	label.bot(btex \texttt{z1} etex,(0,0));
	label.lrt(btex \texttt{z2} etex,(3*u/4,u/4));
	label.rt(btex \texttt{z3} etex,(u,u));			
endfig;
end
