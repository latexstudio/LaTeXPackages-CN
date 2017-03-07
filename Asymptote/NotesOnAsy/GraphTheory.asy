size(300);
int n=12;
int k=5;
defaultpen(linewidth(1)+fontsize(20)+font("OT1","cmtt","bx","it"));

pair P(int i){return dir(90+k*(360/n)*i);}
Label L(int i){return Label(format("$A_{%d}$",i+1),align=P(i));}

pair[] star=sequence(P,n);
Label[] starlabel=sequence(L,n);
dot(starlabel,star);

path[] p2p(pair[] p){return operator--(...p)--cycle;}
draw(p2p(star));

shipout("star",bbox(10,Fill(paleyellow)),"png");
