settings.tex="xelatex";
import slide;
import animate;
usersetting();
orientation=Landscape;
import x11colors;
fill(background,box((-1,-1),(1,1)),Azure);
viewportsize=pagewidth-2pagemargin;

newslide();

file out=output("qiqi.txt");
srand(seconds());
int begin=10;
int end=20;
int[] A=sequence(begin,end);
int[] arrange(int[] A){
  int n = A.length;
  for (int i = 0; i < n; ++i) {
    int j = i + floor(unitrand()*(n-i));
    int tmp = A[i];
    A[i] = A[j];
    A[j] = tmp;
  }
  return A;
}

bool valid(pair[] arr, pair z)
{
  bool retval = true;
  for (pair z0 : arr) {
    retval = retval && (length(z0-z)>2);
  }
  return retval;
}

picture[] RandomCircles(int[] A,real r){
  picture[] fig;
  for(int i=0;i<A.length;++i){
    picture pic;
    size(pic,0,500);
    int n =A[i];
    pair[] arr;
    for (int i = 0; i < n; ++i) {
      pair z;
      do {
        z =r*(unitrand()-1/2, unitrand()-1/2);
      } while (!valid(arr, z));
      arr.push(z);
      filldraw(pic,shift(z) * unitcircle,red);
    }
    fig.push(pic);
  }
  return fig;
}

import animate;
animation Ani;

for(int k=0;k<1;++k){
  A=arrange(A);
  for(int i=0;i<A.length;++i){
    Ani.add(RandomCircles(A,10)[i]);
    if((i+1)%A.length==0){
      write(out,format("%d",A[i])+'  '+'\r\n\r\n');
    }
    else{
      write(out,format("%d",A[i])+'  ');
    }
  }
}

label(Ani.pdf("controls,loop",delay=1200,multipage=false));
