:: Copyright (c) 2012-2016 hzz

@echo off

:: compile the tex file

call makeclear

xelatex.exe --synctex=-1 biblatex-zh-cn.tex

makeglossaries biblatex-zh-cn

xelatex.exe --synctex=-1 biblatex-zh-cn.tex

::call makeclear



