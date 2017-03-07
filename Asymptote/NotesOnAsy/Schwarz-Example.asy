// 澄清曲面面积定义的 Schwarz 例子.
size(400);
import solids;
defaultrender=render(compression=Zero,merge=true);
int n=5;
int m=n;// m=n^3;
real[] a=uniform(0,2pi,n);
real[] b=uniform(0,1,m);
triple f(pair t){
  return (cos(t.x),sin(t.x),t.y);
}
pen p=blue+thick();
for(int i=0;i<a.length-1;++i)
  for(int j=0;j<b.length-1;++j){
    pair A=(a[i],b[j]);
    pair B=(a[i+1],b[j]);
    pair C=(a[i+1],b[j+1]);
    pair D=(a[i],b[j+1]);
    pair CC=(A+B+C+D)/4;
    draw(surface(f(CC)--f(A)--f(B)--cycle),white,meshpen=p);
    draw(surface(f(CC)--f(B)--f(C)--cycle),white,meshpen=p);
    draw(surface(f(CC)--f(C)--f(D)--cycle),white,meshpen=p);
    draw(surface(f(CC)--f(D)--f(A)--cycle),white,meshpen=p);
    dot(f(CC),red);
  }

//draw(unitcylinder,magenta+opacity(0.4));
