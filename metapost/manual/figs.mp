% Examples for MetaPost doc, by John Hobby.  Public domain.

input boxes
beginfig(1);
pair shadowshift; shadowshift=(1,-1)*bp;

def drawshadowed(text t) =
  forsuffixes $=t:
    fill bpath$ shifted shadowshift;
    unfill bpath$;
    drawboxed($);
  endfor
enddef;

boxit.a(btex \s8A\s+2 \(lh a etex);
circleit.b(btex $e sup {i omega t}$ etex rotated 20);
b.w - a.e = (10,0)*bp;
drawshadowed(a,b);
draw a.e..b.w;

draw bbox currentpicture dashed evenly;
endfig;

end
