@echo off

% generate metapost picture file %
mpost       annulus.mp
mpost       circles.mp 
mpost       data.mp 
mpost       draw.mp 
mpost       fill.mp 
mpost       label.mp 
mpost       paperclip.mp
mpost       parabola.mp

% build .pdf file with bib %
xelatex 	mpintro.tex
bibtex 		mpintro
xelatex 	mpintro.tex
xelatex 	mpintro.tex

% Clean temp file %
: Call clean.bat
exit