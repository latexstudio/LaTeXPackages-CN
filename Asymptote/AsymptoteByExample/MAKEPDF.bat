xelatex main
asy -compact -divisor 4 main
xelatex main
iconv -f utf-8 -t gbk main.idx | cctmkind -C mixed -s cct.ist| iconv -f gbk -t utf-8 > main.ind
bibtex main
xelatex main
xelatex main
move /y main.pdf AsymptoteByExample.pdf