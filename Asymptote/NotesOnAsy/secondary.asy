import graph;

size(200,100,IgnoreAspect);
scale(true);

// 画第一副图, 正弦函数, 在左边用蓝色 y 轴
draw(graph(sin,-pi,pi),blue);
draw(ellipse((-pi/2,sin(-pi/2)),.3,.2),yellow);
arrow(shift(-2.5)*(-pi/2,sin(-pi/2)),E,yellow);

xaxis(BottomTop,LeftTicks);
yaxis(Left,blue,RightTicks);

// 画第二副图, 指数函数, 在右边用红色 y 轴.
picture secondary=secondaryY(new void(picture pic){
    scale(pic,Linear(true),Log(true));
    draw(pic,graph(pic,exp,-pi,pi),red);
    draw(pic,ellipse((2,.2),.3,.2),yellow);
    arrow(pic,shift(2.5)*(2,.2),W,yellow);
    yaxis(pic,Right,red,LeftTicks(begin=false,end=false));
  });
add(secondary);


