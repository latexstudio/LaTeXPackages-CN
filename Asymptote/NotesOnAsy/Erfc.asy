size(200);
import graph;

/* exp(-x^2)/sqrt(2pi) 从 c 到 +infinity 积分正是 erfc(c/sqrt(2))/2 */

typedef real func(real);
func f(real d){
  return new real (real eta){return (1/2)*erfc((log(eta)/d+d/2)/sqrt(2));};
}
func g(real d){
  return new real (real eta){return (1/2)*erfc((log(eta)/d-d/2)/sqrt(2));};
  }

path p1=graph(f(0.5),g(0.5),0.1,5,n=100,operator..);
path p2=graph(f(1),g(1),0.1,20,n=100,operator..);
path p3=graph(f(2),g(2),0.01,50,n=400,operator..);

draw(p1,red+1);
label(Label("\tiny $d=0.5$",align=E),p1);
draw(p2,green+1);
label(Label("\tiny $d=1.0$",align=E),p2);
draw(p3,blue+1);
label(Label("\tiny $d=2.0$",align=E),p3);

xaxis("$P_{F}\to$",BottomTop,LeftTicks);
yaxis("$P_{D}\to$",LeftRight,RightTicks());
