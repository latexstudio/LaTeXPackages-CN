import graph;
size(200,IgnoreAspect);

typedef real func(real);

func f(int n){
  return new real (real x){return (n*x-1/2-floor(n*x-1/2));};
  //real g(real x){return (n*x-1/2-floor(n*x-1/2));}; return g;
}

int n=35;
real Sum(real x){
  real s=0;
  for(int i=0;i<n;++i){
    s=s+f(i)(x);
  }
  return s;
}
draw(graph(Sum,0,2,operator--),red);
