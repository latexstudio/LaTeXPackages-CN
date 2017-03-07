//# -*- coding: utf-8 -*-
/**************************************************************************
 * node.asy
 *
 *	Asymptote 结点模块 version 1.4
 *	功能：绘制流程图、图论图形、交换图等
 *
 *	完善中。文档和示例暂缺。
 *
 *	BUGS 坐标重合时，结点连线在计算角度时会出错，此类错误不少
 *	     （暂懒得改）
 *
 *	TODO 除了矩形、圆外，更多实用的形状（派生类型）
 *	     更多的连线构造方式（但不必太复杂）
 *	     类似 MetaPost boxes 宏包的 boxjoin 功能
 *
 * 作者：刘海洋（leoliu.pku@gmail.com）
 * 2008 年 12 月 13 日完成基本框架  v1.0
 * 2009/4/24 增加 loop，修正绘制路径时 nullpath 的 BUG	v1.1
 * 2009/10/19 修正放缩时的 BUG	v1.2
 * 2009/11/5 重写整个数据结构 v1.3，简化了 node，不再支持 nodepath 类型
 * 2009/11/20 增加 draw_t 的复合函数，增加球形渐变和阴影效果 v1.4
 * 2009/11/25 按 plain_boxes 中的方式改写了默认锚点的设置算法
 *************************************************************************/

typedef void draw_t(picture pic, path[] g);

draw_t compose(... draw_t[] drawers)
{
    return new void(picture pic, path[] g) {
        for (draw_t drawer : drawers)
            drawer(pic, g);
    };
}

draw_t none = new void(picture pic, path[] g){};

draw_t drawer(pen p)
{
    return new void(picture pic, path[] g) {
        draw(pic, g, p);
    };
}
draw_t drawer=drawer(currentpen);

draw_t filler(pen p)
{
    return new void(picture pic, path[] g) {
        fill(pic, g, p);
    };
}
draw_t filler=filler(currentpen);

draw_t filldrawer(pen fillpen, pen drawpen=currentpen)
{
    return new void(picture pic, path[] g) {
        filldraw(pic, g, fillpen, drawpen);
    };
}

draw_t ballshade(pen color, pen bgcolor=black, pair lightdir=NW)
{
    return new void(picture pic, path[] g) {
        pair diff = max(g) - min(g);
        real r = max(diff.x, diff.y)/2;
        pair c = (min(g)+max(g))/2 + 0.3r*unit(lightdir);
        picture ballpic;
        radialshade(ballpic, g, interp(bgcolor,color,0.1), c, r,
                                interp(bgcolor,color,0.5), c, 0.5r);
        radialshade(ballpic, circle(c, 0.5r), interp(bgcolor,color,0.5), c, 0.5r,
                                              interp(bgcolor,color,0.7), c, 0.36r);
        radialshade(ballpic, circle(c, 0.36r), interp(bgcolor,color,0.7), c, 0.36r,
                                               interp(white,color,0.75), c, 0.18r);
        radialshade(ballpic, circle(c, 0.18r), interp(white,color,0.75), c, 0.18r,
                                               interp(white,color,0.15), c, 0);
        clip(ballpic, g);
        add(pic, ballpic);
    };
}
draw_t ballshade=ballshade(blue);

draw_t shadow(pair shift=2SE, real scale=1, pen color=gray)
{
    return new void(picture pic, path[] g) {
        fill(pic, shift(shift)*scale(scale)*g, color);
    };
}
draw_t shadow=shadow();



typedef path[] shape_t(pair min, pair max, pair innersep);

struct node {
    picture stuff;
    pair pos;   // position of anchor
    path[] outline;
    pair _E, _NE, _N, _NW, _W, _SW, _S, _SE, _O;        // 相对当前 anchor
    pair E, NE, N, NW, W, SW, S, SE, O;      // 相对用户坐标
    pair _anchor;
    pair anchor;

    pair angle(real ang)
    {
	path g = outline[0];    // first path of outline
	real len = length(max(g)-min(g));
	path ray = this._O -- this._O + len*dir(ang);
	pair inanchor = intersectionpoint(ray, g);
	return this.O + inanchor;
    }

    // 按 stuff 中的坐标，返回相对边框及其中心矫正的某方向锚点
    // 这是对矩形合理的默认锚点
    pair _rectified(pair v)
    {
        path g = outline[0];
        pair M = max(g), m = min(g);
        real len = length(M-m);
        pair c = (M+m) / 2;
        pair dir = m + realmult(rectify(v),M-m);
        return intersectionpoint(g, c -- 2*dir-c);
    }

    void setanchor(pair anch)
    {
        if (anch == (0,0)) _anchor = _O;
        else if (anch == plain.E) _anchor = _E;
        else if (anch == plain.NE) _anchor = _NE;
        else if (anch == plain.N) _anchor = _N;
        else if (anch == plain.NW) _anchor = _NW;
        else if (anch == plain.W) _anchor = _W;
        else if (anch == plain.SW) _anchor = _SW;
        else if (anch == plain.S) _anchor = _S;
        else if (anch == plain.SE) _anchor = _SE;
        else abort("Unknown anchor ("+string(anch.x)+", "+string(anch.y)+") .");       // error
        this.O = pos - _anchor;
        this.E = this.O + _E;
        this.NE = this.O + _NE;
        this.N = this.O + _N;
        this.NW = this.O + _NW;
        this.W = this.O + _W;
        this.SW = this.O + _SW;
        this.S = this.O + _S;
        this.SE = this.O + _SE;
        this.anchor = anch;
    }

    void operator init(Label text, pair at, pair anchor, pair innersep,
         shape_t shape, draw_t drawer)
    {
        this.pos = at;
        this.anchor = anchor;
        label(this.stuff, text);
        this.outline = shape(min(this.stuff), max(this.stuff), innersep);
        drawer(this.stuff, this.outline);
        // 默认的锚点位置
        _O = (0,0);
        _E = _rectified(plain.E);
        _NE = _rectified(plain.NE);
        _N = _rectified(plain.N);
        _NW = _rectified(plain.NW);
        _W = _rectified(plain.W);
        _SW = _rectified(plain.SW);
        _S = _rectified(plain.S);
        _SE = _rectified(plain.SE);
        setanchor(anchor);
    }
}

void draw(picture pic=currentpicture, node[] nodearr)
{
    for (node nd: nodearr)
        add(pic, shift(nd.O) * nd.stuff);
}

void draw(picture pic=currentpicture ... node[] nodearr)
{
    draw(pic, nodearr);
}


node Circle(Label text, pair at, pair anchor=(0,0), pen textpen=currentpen,
            real innersep=fontsize(textpen)/3,
            real xinnersep=innersep, real yinnersep=innersep,
            draw_t drawfunc=drawer)
{
    path[] circleshape(pair min, pair max, pair innersep)
    {
        pair c = (min + max) / 2, diag = max-min+2innersep;
        real r = max(diag.x, diag.y)/2;
        return circle(c, r);
    }
    node nd = node(Label(text,textpen), at, anchor, (xinnersep,yinnersep), circleshape, drawfunc);
    return nd;
}

node Rectangle(Label text, pair at, pair anchor=(0,0), pen textpen=currentpen,
               real innersep=fontsize(textpen)/3,
               real xinnersep=innersep, real yinnersep=innersep,
               draw_t drawfunc=drawer)
{
    path[] rectangleshape(pair min, pair max, pair innersep)
    {
        return box(min-innersep, max+innersep);
    }
    node nd = node(Label(text,textpen), at, anchor, (xinnersep,yinnersep), rectangleshape, drawfunc);
    return nd;
}

path operator--(node a, node b)
{
    real ang = degrees(b.pos-a.pos);
    return a.angle(ang) -- b.angle(ang+180);
}

// 控制曲线的辅助类型
typedef path edgecontrol(node nd1, node nd2);

// 按相对角度弯曲
edgecontrol bend(real angle, real tensions=1)
{
    return new path(node nd1, node nd2) {
	real deg = degrees(nd2.O - nd1.O);
	return nd1.angle(deg+angle) {dir(deg+angle)}
	    .. tension tensions .. {dir(deg-angle)} nd2.angle(180+deg-angle);
    };
}
// 预定义的左弯和右弯
edgecontrol bendleft=bend(30);
edgecontrol bendright=bend(-30);

// 按绝对角度出入
edgecontrol outin(real out, real in, real tensions=1)
{
    return new path(node nd1, node nd2) {
	return nd1.angle(out) {dir(out)}
	    .. tension tensions .. {dir(180+in)} nd1.angle(in);
    };
}

// 先水平线后竖直线
edgecontrol HV = new path(node nd1, node nd2) {
    pair c1 = nd1.O, c2 = nd2.O;
    pair midway = (c2.x, c1.y);
    return (c1.x<c2.x ? nd1.E : nd1.W)
	-- midway
	-- (c1.y<c2.y ? nd2.S : nd2.N);
};

// 先竖直线再水平线
edgecontrol VH = new path(node nd1, node nd2) {
    pair c1 = nd1.O, c2 = nd2.O;
    pair midway = (c1.x, c2.y);
    return (c1.y<c2.y ? nd1.N : nd1.S)
	-- midway
	-- (c1.x<c2.x ? nd2.W : nd2.E);
};

// node 和 edgecontrol 的复合，仅作为构造路径的中间类型使用
private struct nd_con {
    node nd;
    edgecontrol con;
    void operator init(node nd, edgecontrol con)
    {
        this.nd = nd;
        this.con = con;
    }
}

// 构造 node 连线的前一半
nd_con operator ..(node nd, edgecontrol con)
{
    return nd_con(nd, con);
}

// 构造 node 连线的后一半
path operator ..(nd_con ndc, node nd)
{
    return ndc.con(ndc.nd, nd);
}

// 自动机循环
path loop(node nd, pair direction, real ratio=1.5)
{
    real deg = degrees(direction);
    real angle1 = deg - 15, angle2 = deg + 15;
    pair mid = nd.angle(deg)
        + ratio*fontsize(currentpen)*unit(direction);
    return nd.angle(angle1) {dir(angle1)} .. mid
        .. {-dir(angle2)} nd.angle(angle2);
}


/* 
// 测试代码
node p = Rectangle("$p$", (-2cm, -5cm)),
     q = Rectangle("$q$", (0cm, -3cm));
draw(p .. bendleft .. q, Arrow);
draw(q .. bendleft .. p, Arrow);
draw(p,q);
draw(loop(p,up),Arrow);

node[] nodes;
for (int i = 0; i < 5; ++i)
    nodes[i] = Circle("$A_{"+string(i)+"}$", at=2cm*dir(90+144i), filldrawer(yellow));
draw(nodes);
nodes.cyclic=true;
for (int i = 0; i < nodes.length; ++i)
    draw(nodes[i] -- nodes[i+1], Arrow);

draw(q .. HV .. nodes[4], Arrows);
write("ok");
*/
