import node;

void drawarrows(picture pic=currentpicture, path[] g, pen p=currentpen,
                arrowbar arrow=Arrow, arrowbar bar=None)
{
    for (path g0 : g)
        draw(pic, g0, p, arrow, bar);
}

real u = 1.5cm;
pen textpen = white;
draw_t shader = ballshade;

node v1 = Circle("$v_1$", (0,0), textpen, shader),
     v2 = Circle("$v_2$", v1.pos+2u*E, textpen, shader),
     v3 = Circle("$v_3$", v1.pos+u*(E+S), textpen, shader),
     v4 = Circle("$v_4$", v2.pos+2u*S, textpen, shader),
     v5 = Circle("$v_5$", v1.pos+2u*S, textpen, shader),
     v7 = Circle("$v_7$", v5.pos+u*S, textpen, shader),
     v8 = Circle("$v_8$", v4.pos+u*S, textpen, shader),
     v6 = Circle("$v_9$", v7.pos+u*(E+S), textpen, shader);

picture digraph;

draw(digraph, v1, v2, v3, v4, v5, v6, v7, v8);

drawarrows(digraph, v1 -- v2 ^^ v1 -- v5 ^^ v1 .. bendright .. v4
    ^^ v2 -- v3 ^^ v2 -- v4
    ^^ v3 -- v1
    ^^ v4 -- v3
    ^^ v5 -- v4
    ^^ v6 -- v7 ^^ v6 .. bend(15) .. v8
    ^^ v7 -- v5
    ^^ v8 -- v4 ^^ v8 .. bend(15) .. v6 ^^ v8 -- v7);

picture spanningforest;

void setpos(node nd, pair pos)
{
    nd.pos = pos;
    nd.setanchor(nd._anchor);
}

real v = 1.5u;
pair lb = v*dir(-120), rb = v*dir(-60);
setpos(v1, (0,0));
setpos(v2, v1.pos + lb);
setpos(v3, v2.pos + lb);
setpos(v4, v2.pos + rb);
setpos(v5, v1.pos + rb);
setpos(v7, v5.pos + v*E);
setpos(v6, v7.pos - lb);
setpos(v8, v6.pos + rb);

draw(spanningforest, v1, v2, v3, v4, v5, v6, v7, v8);
drawarrows(spanningforest, v1 -- v2 ^^ v1 -- v5
    ^^ v2 -- v3 ^^ v2 -- v4
    ^^ v6 -- v7 ^^ v6 -- v8,
    linewidth(1), Arrow(6));
drawarrows(spanningforest, v1 -- v4
    ^^ v3 .. bendleft .. v1
    ^^ v4 -- v3
    ^^ v5 -- v4
    ^^ v7 -- v5
    ^^ v8 -- v4 ^^ v8 .. bendright .. v6 ^^ v8 -- v7,
    gray, Arrow(6));

add(digraph.fit(), (0,0), align=.5u*W);
add(spanningforest.fit(), (0,0), align=.5u*E);
