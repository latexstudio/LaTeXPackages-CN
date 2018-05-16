@echo off

% build mplibapi.pdf %
move /Y mpgraph.mp      mpgraph.saved
texexec mplibapi
move /Y mpgraph.saved   mpgraph.mp

% build mpboxes.pdf %
mpost     mpboxes.mp
pdflatex  mpboxes.tex
bibtex    mpboxes.aux
pdflatex  mpboxes.tex
makeindex -c -s mpman.ist mpboxes.idx
pdflatex  mpboxes.tex

% build mpgraph.pdf %
mpost     mpgraph.mp
pdflatex  mpgraph.tex
bibtex    mpgraph.aux
pdflatex  mpgraph.tex
pdflatex  mpgraph.tex

% build mpman.pdf %
mpost     mpman.mp 
mpost     mpman-charts.mp
pdflatex  mpman.tex
bibtex    mpman.aux
pdflatex  mpman.tex
pdflatex  mpman.tex
makeindex -c -s mpman.ist mpman.idx
pdflatex  mpman.tex

% Clean temp file %
: Call clean.bat
exit