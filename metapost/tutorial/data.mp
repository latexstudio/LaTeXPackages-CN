prologues:=3;

if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

verbatimtex
%&latex
\documentclass[11pt]{article}
\usepackage[charter]{mathdesign}
\usepackage[T1]{fontenc}
\renewcommand*{\ttdefault}{lmtt}
\begin{document}
etex

input graph;
Fmfont_:="bchr8r";
beginfig(0);
	draw begingraph(144bp,89bp);
		gdraw "data.d";
	endgraph;
endfig;
end
