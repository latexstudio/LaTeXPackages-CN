//# -*- coding: utf-8 -*-

path operator@(path p, transform t)
{
    return t * p;
}

typedef path fpath(path);

path operator@(path p, fpath t)
{
    return t(p);
}

fpath cutbefore(path knife)
{
    return new path (path p) {
        return firstcut(p, knife).after;
    };
}

fpath cutafter(path knife)
{
    return new path (path p) {
        return lastcut(p, knife).before;
    };
}

filltype BallShade(pen color, pen bgcolor=black, pair lightdir=NW)
{
    return filltype(new void(frame f, path[] g, pen) {
        pair diff = max(g) - min(g);
        real r = max(diff.x, diff.y)/2;
        pair c = (min(g)+max(g))/2 + 0.3r*unit(lightdir);
        frame fr;
        radialshade(fr, g, interp(bgcolor,color,0.1), c, r,
                           interp(bgcolor,color,0.5), c, 0.5r);
        radialshade(fr, circle(c, 0.5r), interp(bgcolor,color,0.5), c, 0.5r,
                                        interp(bgcolor,color,0.7), c, 0.36r);
        radialshade(fr, circle(c, 0.36r), interp(bgcolor,color,0.7), c, 0.36r,
                                         interp(white,color,0.75), c, 0.18r);
        radialshade(fr, circle(c, 0.18r), interp(white,color,0.75), c, 0.18r,
                                         interp(white,color,0.15), c, 0);
        clip(fr, g);
        add(f, fr);
    });
}

filltype BallShade = BallShade(blue);

unitsize(2cm);
object a = draw("A", ellipse, (0,0), BallShade(yellow));
object b = draw("B", ellipse, dir(30), BallShade);
object c = draw("C", ellipse, dir(-30), BallShade(lightgreen,darkred));
object d = draw("D", roundbox, (sqrt(3),0), xmargin=5, ymargin=2, FillDraw(palegreen));
object e = draw("E", box, sqrt(3)+(1,0), xmargin=2, FillDraw(palegreen));
add(
    new void(picture pic, transform t) {
        draw(pic, point(a,ENE,t) -- point(b,WSW,t), Arrow);
        draw(pic, point(a,ESE,t) -- point(c,WNW,t), Arrow);
        draw(pic, point(b,ESE,t) -- point(d,WNW,t), Arrow);
        draw(pic, point(c,ENE,t) -- point(d,WSW,t), Arrow);
        draw(pic, "loop", point(b,NNE,t){NNE} .. point(b,N,t)+(0,15) .. {SSE}point(b,NNW,t), Arrow);//loop
        draw(pic, point(d,ENE,t){ENE} .. {ESE}point(e,WNW,t), Arrow);
        draw(pic, point(e,WSW,t){WSW} .. {WNW}point(d,ESE,t), Arrow);
    }
);

