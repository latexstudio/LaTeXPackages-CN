size(200);
import graph;
path g= (0, 0.65){right}
  ..{up}(0.45, 1)
  --(0.5, 1){down}
..{left}(0.1,0.6)
  {right}..{down}(0.15,0.55)
  ..{down}(0.075,0.35){down}
  ..{down}(0.075, 0.2)
  ..(0.15,0.15){down}
  ..{left}(0.1,0.1){right}
  ..{right}(0.4,0.05)
  --(0.4,0){left}
  ..{left}(0,0.05);
pen[] colors={red,green,blue};
colors.cyclic=true;
for(int i=0;i<length(g);++i){
  draw(subpath(g,i,i+1),colors[i]+1bp);
}
xaxis("$x$",Arrow());
yaxis("$y$",Arrow());
