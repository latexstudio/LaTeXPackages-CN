settings.tex="xelatex";
import slide;
import animate;
usersetting();
orientation=Landscape;
import x11colors;
fill(background,box((-1,-1),(1,1)),Azure);
label(background,"",(0,startposition.y));
viewportsize=pagewidth-2pagemargin;
newslide();
srand(seconds());
int[] A=sequence(1,50);
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
real epsilon=0.1;
real radius=0.4;
bool valid(pair[] arr, pair z){
  bool retval = true;
  for (pair z0 : arr) {
    retval = retval && (length(z0-z)>=2*radius+epsilon);
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
      filldraw(pic,shift(z)*scale(radius)*unitcircle,red);
    }
    fig.push(pic);
  }
  return fig;
}
import animate;
animation Ani;
for(int k=0;k<1;++k){
  A=arrange(A);
  for(int i=0;i<2*A.length;++i){
    if(i%2==0)
      Ani.add(RandomCircles(A,10)[floor(i/2)]);
    else{
      picture figure;
      size(figure,0,500);
      label(figure,format("${%d}$",A[floor(i/2)]),(0,0),gray+fontsize(400));
      Ani.add(figure);
    }
  }
  write(A);
}
label(Ani.pdf("controls,loop",delay=1200,multipage=false));
