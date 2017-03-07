import graph;
size(0,100);
real u(real x){return abs(x-floor(x+1/2));}

typedef real func(real);

func f(int n){
  return new real (real x)  {return u(4^n*x)/4^n;};
}
int n=20;
real Sum(real x){
  real s=0;
  for(int i=0;i<n;++i){
    s=s+f(i)(x);
  }
  return s;
}
draw(graph(Sum,-1,1,operator--),red);

