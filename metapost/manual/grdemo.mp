verbatimtex
.EQ
delim $$
.EN
\# etex

prologues := 2;

input boxes

beginfig(1);
  pair shadowshift;
  shadowshift = (1, -1) * bp;

  def drawshadowed(text t) =
    forsuffixes $ = t:
      fill bpath$ shifted shadowshift;
      unfill bpath$;
      drawboxed($);
    endfor
  enddef;

  boxit.a(btex \[12] \s8A\s+2 \[lh] a etex);
  circleit.b(btex $e sup {i omega t}$ etex rotated 20);

  b.w - a.e = (10bp, 0);

  drawshadowed(a, b);
  draw a.e .. b.w;

  label.top(btex \[Cs] \[Po] \[Eu] etex, a.n);
  label.llft(btex \[Fn] etex, a.s);

  draw bbox currentpicture dashed evenly;
endfig;

end
