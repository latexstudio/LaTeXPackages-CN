prologues:=3;

if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
  path p;
  p := (0,3/16)
      --(halfcircle rotated 180 scaled (1/4) shifted (1/8,-1/4))
      --(halfcircle scaled (3/8) shifted (1/16,3/8))
      --(halfcircle rotated 180 scaled (1/2) shifted (1/8,-1/2))
      --(3/8,3/16);
	draw p scaled 18 withpen pencircle scaled 1.25bp
      withcolor (0.5985,0.7712,0.4275);
% For the color specification cf. mpintro.ltx:
%   (0.5985, 0.7712, 0.4275) = mpcolor!90!black
%   with mpcolor being defined as
%   \colorlet{mpcolor}{Chartreuse3!50!white!95!black}
%   and  Chartreuse3 = (0.4, 0.804, 0)
endfig;
end
