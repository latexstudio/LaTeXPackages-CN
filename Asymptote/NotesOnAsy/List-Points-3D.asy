import three;
import palette;
size(200);
file f=input("scatter.txt");
triple[] a;
while(true) {
  real x=f;
  real y=f;
  real z=f;
  if(eof(f)) break;
  a.push((x,y,z));
}
for(int i=0; i < a.length; ++i)
  dot(a[i],Rainbow(a.length)[i]+8bp);
