import graph;
size(200,IgnoreAspect);
file f=input("data.txt");
pair[] a;
while(true) {
  real x=f;
  real y=f;
  if(eof(f)) break;
  a.push((x,y));
}
draw(graph(a),red);
dot(a);
xaxis(BottomTop, LeftTicks);
yaxis(LeftRight, RightTicks);
