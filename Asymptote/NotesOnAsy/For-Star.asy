size(200);
pair P(int i){return dir(90+2*(360/5)*i);}
Label L(int i){return Label(string(i),align=P(i));}

pair[] star=sequence(P,5);
Label[] starlabel=sequence(L,5);
dot(starlabel,star);

path[] p2p(pair[] p){return operator--(...p)--cycle;}
draw(p2p(star));

shipout("star",bbox(10,Fill(paleyellow)),"png");
