settings.tex="xelatex";
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

bool valid(pair[] arr, pair z)
{
  bool retval = true;
  for (pair z0 : arr) {
    retval = retval && (length(z0-z)>=2+epsilon);
  }
  return retval;
}

picture[] RandomCircles(int[] A,real r){
  picture[] fig;
  for(int i=0;i<A.length;++i){
    picture pic;
    size(pic,400);
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
  for(int i=0;i<2*A.length;++i){
    if(i%2==0)
      Ani.add(RandomCircles(A,20)[floor(i/2)]);
    else{
      picture figure;
      size(figure,400);
      draw(figure,scale(20)*format("${%d}$",A[floor(i/2)]),(0,0),gray+opacity(0));
      Ani.add(figure);
    }
  }
  write(A);
}
//Ani.movie(delay=1000);
label(Ani.pdf(keep=true,delay=1000,"controls,loop",multipage=false));

