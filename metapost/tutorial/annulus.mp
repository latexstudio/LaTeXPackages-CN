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

% Set unit size to 54bp = 3/4in
u:=54;
	
path p,q;
% Define circle of radius 3/4in
p:=fullcircle scaled (2*u);
% Define circle of radius 3/8in
q:=fullcircle scaled u;

beginfig(1);
	% Fill annulus
	fill p withcolor (3/5,4/5,1);
	unfill q;
	
	% Draw big circle
	draw p;
	% Draw small circle
	draw q;
endfig;

beginfig(2);
	% Fill annulus
	fill p--reverse q--cycle withcolor (3/5,4/5,1);

	% This loop draws arrows around the big circle
	N:=12;
	for n=1 upto N:
		drawarrow subpath ((n-1)/N*length(p),n/N*length(p)) of p;
	endfor;
	
	% These 3 commands draw the "cut"
	drawarrow (u,0)--(5*u/6,0);
	draw (5*u/6,0)--(2*u/3,0);
	drawarrow (u/2,0)--(2*u/3,0);
	
	% This loop draws arrows around the small circle
	for n=1 upto N:
		drawarrow subpath ((n-1)/N*length(p),n/N*length(p)) of reverse q;
	endfor;

	% Label p and q
	label.urt(btex \texttt{p} etex,(u/sqrt(2),u/sqrt(2)));
	label.llft(btex \texttt{q} etex,(u/2/sqrt(2),u/2/sqrt(2)));
endfig;

beginfig(3);
	% Fill annulus
	fill p--reverse q--cycle withcolor (3/5,4/5,1);
	
	% Draw big circle
	draw p;
	% Draw small circle
	draw q;

	% Above is used to determine the bbox of the annulus
	picture h;
	h:=currentpicture; % Store the currentpicture
	currentpicture:=nullpicture; % Clear the currentpicture

	% Create magenta background
	fill bbox h withcolor (1,0,1);

	% Fill the big circle
	fill p withcolor (3/5,4/5,1);

	% Unfill the small circle
	unfill q;
	
	% Draw the big circle
	draw p;
	% Draw the small circle
	draw q;
endfig;
end
