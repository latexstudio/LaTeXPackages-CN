% Figures for MetaPost doc, by John Hobby.  Public domain.

input graph

if scantokens(mpversion) < 1.200:
  filenametemplate
else:
  outputtemplate :=
fi
"%j-%c.mps";

%if false:  %% Begin skipping already debugged figures
%fi input sarith %% End skipping of already debugged figures

beginfig(1);
draw begingraph(3in,2in);
  gdraw "agepop91.d";
  endgraph;
endfig;


beginfig(2);
draw begingraph(3in,2in);
  gdraw "agepop91.d" plot btex$\bullet$etex;
  endgraph;
endfig;


beginfig(3);
draw begingraph(3in,2in);
  glabel.lft(btex \vbox{\hbox{Population} \hbox{in millions}} etex, OUT);
  glabel.bot(btex Age in years etex, OUT);
  gdraw "agepopm.d";
  endgraph;
endfig;


beginfig(4);
draw begingraph(3in,2in);
 glabel.lft(btex \vbox{\hbox{Population} \hbox{in millions}} etex, OUT);
 glabel.bot(btex Age in years etex, OUT);
 setrange(origin, whatever,whatever);
 gdraw "agepopm.d";
 endgraph;
endfig;


beginfig(5);
draw begingraph(2.3in,2in);
 setcoords(log,log);
 glabel.lft(btex Seconds etex,OUT);
 glabel.bot(btex Matrix size etex,
   OUT);
 gdraw "matmul.d" dashed evenly;
 glabel.ulft(btex Standard etex,8);
 gdraw "matmul.d";
 glabel.lrt(btex Strassen etex,7);
 endgraph;
endfig;


beginfig(6);
draw begingraph(6.5cm,4.5cm);
 setrange(80,0, 90,whatever);
 glabel.bot(btex Year etex, OUT);
 glabel.lft(btex \vbox{\hbox{Emissions in} \hbox{thousands of}
   \hbox{metric tons} \hbox{(heavy line)}}etex, OUT);
 gdraw "lead.d" withpen pencircle scaled 1.5pt;
 autogrid(,otick.lft);
 setcoords(linear,linear);
 setrange(80,0, 90,whatever);
 glabel.rt(btex \vbox{\hbox{Micrograms} \hbox{per cubic}
   \hbox{meter of air} \hbox{(thin line)}}etex, OUT);
 gdraw "lead.d";
 autogrid(otick.bot,otick.rt);
 endgraph;
endfig;


input sarith

beginfig(7);
vardef newy(expr y) = (256/75)*y + mlog y enddef;
draw begingraph(3in,2in);
 glabel.lft(btex \vbox{\hbox{Population} \hbox{in millions}} etex, OUT);
 path p;
 gdata("timepop.d", $, augment.p($1, newy(Scvnum $2)); );
 gdraw p withpen nullpen;
 for y=5,10,20,50,100,150,200,250:
   grid.lft(format("%g",y), newy(y)) withcolor .85white;
 endfor
 autogrid(grid.bot,) withcolor .85white;
 gdraw p;
 frame.llft;
 endgraph;
endfig;

beginfig(8);
defaultfont:="cmr7";
draw begingraph(3in,2in);
  glabel.lft(btex \vbox{\hbox{Life}\hbox{expectancy}} etex, OUT);
  glabel.bot(btex Per capita G.N.P. (thousands of dollars) etex, OUT);
  setcoords(log,linear);
  gdata("countries.d", s,
    glabel(s3, s1, s2);
  )
  endgraph;
endfig;


beginfig(9);
draw begingraph(3in,2in);
  glabel.lft(btex \vbox{\hbox{Quadrillions}\hbox{of BTU}} etex, OUT);
  path p[];
  numeric t;
  gdata("energy.d", $,
    t:=0; augment.p1($1,0);
    for j=2 upto 5:
       t:=t+scantokens $[j]; augment.p[j]($1,t);
    endfor)
  picture lab[];
  lab2=btex coal etex; lab3=btex crude oil etex;
  lab4=btex natural gas etex; lab5=btex hydroelectric etex;
  for j=5 downto 2:
    gfill p[j]--reverse p[j-1]--cycle withcolor .16j*white;
    glabel.lft(image(unfill bbox lab[j]; draw lab[j]), .7+length p[j]);
  endfor
  endgraph;
endfig;


beginfig(10);
draw format("%g",2+2);
endfig;

beginfig(11);
draw format("%3g","6.022e23");
endfig;


end
