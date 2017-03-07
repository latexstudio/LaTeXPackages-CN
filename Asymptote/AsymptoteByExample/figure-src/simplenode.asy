//#-*- coding: utf-8 -*-
// simplenode.asy
// `\color{comment}关于绘制图论图形、自动机、流程图的简单模块`

// `\color{comment}结点类型，第二个实现`
struct node {
    path outline;
    picture stuff;
    pair pos;
    pair E, N, W, S;
    pair dir(pair v)
    {
        path g = shift(pos) * outline;
        pair M = max(g), m = min(g), c = 0.5*(M+m);
        path ray = c -- c + length(M-m)*unit(v);
        return intersectionpoint(g, ray);
    }
    pair angle(real ang)
    {
        return this.dir(dir(ang));
    }
}

// `\color{comment}画出结点数组`
void draw(picture pic=currentpicture, node[] nodearr)
{
    for (node nd: nodearr)
        add(pic, shift(nd.pos) * nd.stuff);
}

// `\color{comment}画出一个或多个结点`
void draw(picture pic=currentpicture ... node[] nodearr)
{
    draw(pic, nodearr);
}

// `\color{comment}边框绘制函数类型`
typedef void draw_t(picture pic, path g);

// `\color{comment}多个边框绘制函数的复合`
draw_t compose(... draw_t[] drawfns)
{
    return new void(picture pic, path g) {
        for (draw_t f : drawfns)
            f(pic, g);
    };
}

// `\color{comment}空函数，不做边框的绘制`
draw_t none = new void(picture pic, path g){};
// `\color{comment}画边框线`
draw_t drawer(pen p)
{
    return new void(picture pic, path g) {
        draw(pic, g, p);
    };
}
draw_t drawer=drawer(currentpen);
// `\color{comment}填充边框`
draw_t filler(pen p)
{
    return new void(picture pic, path g) {
        fill(pic, g, p);
    };
}
draw_t filler=filler(currentpen);
// `\color{comment}对边框填充并画线`
draw_t filldrawer(pen fillpen, pen drawpen=currentpen)
{
    return new void(picture pic, path g) {
        filldraw(pic, g, fillpen, drawpen);
    };
}

// `\color{comment}画双线边框，第二个实现`
draw_t doubledrawer(pen p, pen bg=white)
{
    return compose(drawer(p+linewidth(p)*3), drawer(bg+linewidth(p)));
}
draw_t doubledrawer = doubledrawer(currentpen);

// `\color{comment}画阴影`
draw_t shadow(pair shift=2SE, real scale=1, pen color=gray)
{
    return new void(picture pic, path g) {
        fill(pic, shift(shift)*scale(scale)*g, color);
    };
}
draw_t shadow=shadow();

// `\color{comment}圆形结点的构造函数，第三个实现`
node Circle(Label text, pair pos, pen textpen=currentpen,
            draw_t drawfn)
{
    node nd;
    nd.pos = pos;
    label(nd.stuff, text, textpen);
    pair M = max(nd.stuff), m = min(nd.stuff);
    nd.outline = circle(0.5*(M+m), 0.5*length(M-m));
    drawfn(nd.stuff, nd.outline);
    nd.E = nd.dir(E);
    nd.N = nd.dir(N);
    nd.W = nd.dir(W);
    nd.S = nd.dir(S);
    return nd;
}

// `\color{comment}直线连接结点`
path operator--(node nd1, node nd2)
{
    path g1 = shift(nd1.pos) * nd1.outline;
    path g2 = shift(nd2.pos) * nd2.outline;
    pair c1 = (max(g1)+min(g1)) / 2;
    pair c2 = (max(g2)+min(g2)) / 2;
    path edge = c1 -- c2;
    edge = firstcut(edge, g1).after;
    edge = lastcut(edge, g2).before;
    return edge;
}

// `\color{comment}结点连线函数类型`
typedef path edgeconnector(node nd1, node nd2);
// `\color{comment}由单结点生成边的函数类型`
typedef path edgemaker(node nd);

// `\color{comment}nd1 .. con .. nd2 的前一半`
edgemaker operator..(node nd, edgeconnector con)
{
    return new path(node nd2) {
        return con(nd, nd2);
    };
}

// `\color{comment}nd1 .. con .. nd2 的后一半`
path operator..(edgemaker maker, node nd)
{
    return maker(nd);
}

path operator..(node nd, edgemaker maker)
{
    return maker(nd);
}

// `\color{comment}以 ang 角弯曲连曲线`
edgeconnector bend(real ang)
{
    return new path (node nd1, node nd2) {
        path g1 = shift(nd1.pos) * nd1.outline;
        path g2 = shift(nd2.pos) * nd2.outline;
        pair c1 = (max(g1)+min(g1)) / 2;
        pair c2 = (max(g2)+min(g2)) / 2;
        real deg = degrees(c2 - c1);
        return nd1.angle(deg+ang) {dir(deg+ang)}
            .. {dir(deg-ang)} nd2.angle(180+deg-ang);
    };
}

// `\color{comment}左弯与右弯`
edgeconnector bendleft = bend(30);
edgeconnector bendright = bend(-30);

// `\color{comment}自动机循环`
edgemaker loop(pair direction, real ratio=1.5)
{
    return new path(node nd) {
        real deg = degrees(direction);
        real angle1 = deg - 15, angle2 = deg + 15;
        pair mid = nd.angle(deg)
            + ratio*fontsize(currentpen)*unit(direction);
        return nd.angle(angle1) {dir(angle1)} .. mid
            .. {-dir(angle2)} nd.angle(angle2);
    };
}

// `\color{comment}对路径作任意变换的函数类型`
typedef path fpath(path);

// `\color{comment}用函数 t 作用于路径 p`
path operator@(path p, fpath t)
{
    return t(p);
}

// `\color{comment}缩短路径。默认为末端缩短 2bp`
fpath shorten(real pre=0, real post=2)
{
    return new path(path p) {
	return subpath(p, arctime(p, pre), arctime(p, arclength(p)-post));
    };
}
fpath shorten=shorten(0,2);

