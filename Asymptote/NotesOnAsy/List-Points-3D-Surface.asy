import palette;
import three;
currentprojection=orthographic(8,5,9);
currentlight.background=black;
size(200);
triple[] a;
for(real  i=-5;i<5;i=i+.25)
  for(real j=-5;j<5;j=j+.25)
    a.push((i,j,sin(i)*cos(j)));
for(int i=0; i < a.length; ++i)
  dot(a[i],Rainbow(a.length)[i]);
