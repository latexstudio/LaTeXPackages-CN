% Figures for MetaPost manual, by John Hobby.  Public domain.

if scantokens(mpversion) < 1.200:
  filenametemplate
else:
  outputtemplate :=
fi
"%j-%c.mps";

%%% This redefinition of dotlabel draws dots as a closed path
%%% which are rendered more smoothly in Adobe Reader.
vardef dotlabel@#(expr s,z) text t_ =
  label@#(s,z) t_;
  addto currentpicture
    contour (makepath pencircle scaled dotlabeldiam) shifted z t_;
enddef;


beginfig(1);
draw (20,20)--(0,0)--(0,30)--(30,0)--(0,0);
endfig;


beginfig(2); numeric u;
u=1cm;
draw (2u,2u)--(0,0)--(0,3u)--(3u,0)--(0,0);
pickup pencircle scaled 4pt;
for i=0 upto 2:
  for j=0 upto 2:
    drawdot (i*u,j*u);
  endfor
endfor
endfig;


beginfig(3);
z0 = (0,0);    z1 = (60,40);
z2 = (40,90);  z3 = (10,70);
z4 = (30,50);
draw z0..z1..z2..z3..z4;
dotlabels.top(0,2,4);
dotlabels.lft(3);
dotlabels.lrt(1);
endfig;


beginfig(104);
z0 = (0,0);    z1 = (60,40);
z2 = (40,90);  z3 = (10,70);
z4 = (30,50);
draw z0..z1..z2..z3..z4..cycle;
dotlabels.top(2,4);
dotlabels.lft(0,3);
dotlabels.lrt(1);
endfig;


beginfig(204);
z0 = (0,0);    z1 = (60,40);
z2 = (40,90);  z3 = (10,70);
z4 = (30,50);
draw z0..z1..z2..z3--z4--cycle;
dotlabels.top(2,4);
dotlabels.lft(0,3);
dotlabels.lrt(1);
endfig;


beginfig(5);
z0 = (0,0);    z1 = (60,40);
z2 = (40,90);  z3 = (10,70);
z4 = (30,50);
path p; p = z0..z1..z2..z3..z4;
draw p;
for t=0 upto 3:
  draw point t of p--postcontrol t of p
    --precontrol t+1 of p--point t+1 of p
    dashed (evenly scaled .5);
endfor
dotlabels.top(0,2,4);
dotlabels.lft(3);
dotlabels.lrt(1);
endfig;


beginfig(6);
z0 = (0,0);    z1 = (60,40);
z2 = (40,90);  z3 = (10,70);
z4 = (30,50);
draw z0..z1{up}..z2{left}..z3..z4;
dotlabels.top(0,2,4);
dotlabels.lft(3);
dotlabels.lrt(1);
endfig;


beginfig(7)
for a=0 upto 9:
  draw (0,0){dir 45}..{dir -10a}(6cm,0);
endfor
endfig;

beginfig(8)
for a=0 upto 7:
  draw (0,0){dir 45}..{dir 10a}(6cm,0);
endfor
endfig;


beginfig(109);
z2=-z0=(1in,0); z1=(0,.2in);
draw z0{up}..z1{right}..z2{down};
dotlabels.bot(0,1,2);
endfig;


beginfig(209);
z2=-z0=(1in,0); z1=(0,.2in);
draw z0{up}...z1{right}...z2{down};
dotlabels.bot(0,1,2);
endfig;


beginfig(110);
numeric u; 10u=1.5in;
-z0=z3=(5u,0);
(-x1,y1)=z2=(3u,2u);
draw z0..z1..z2..z3;
dotlabels.bot(0,1,2,3);
endfig;


beginfig(210);
numeric u; 10u=1.5in;
-z0=z3=(5u,0);
(-x1,y1)=z2=(3u,2u);
draw z0..z1..tension 1.3..z2..z3;
dotlabels.bot(0,1,2,3);
endfig;


beginfig(310);
numeric u; 10u=1.5in;
-z0=z3=(5u,0);
(-x1,y1)=z2=(3u,2u);
draw z0..z1..tension 1.5 and 1..z2..z3;
dotlabels.bot(0,1,2,3);
endfig;


beginfig(111);
numeric u, c; 10u=1.4in; c=0;
z1=(0,0); (x0,-y0)=z2=(2u,5u);
draw z0{curl c}..z1..{curl c}z2;
dotlabels.rt(0,1,2);
endfig;


beginfig(211);
numeric u, c; 10u=1.4in; c=1;
z1=(0,0); (x0,-y0)=z2=(2u,5u);
draw z0{curl c}..z1..{curl c}z2;
dotlabels.rt(0,1,2);
endfig;


beginfig(311);
numeric u, c; 10u=1.4in; c=2;
z1=(0,0); (x0,-y0)=z2=(2u,5u);
draw z0{curl c}..z1..{curl c}z2;
dotlabels.rt(0,1,2);
endfig;


beginfig(411);
numeric u, c; 10u=1.4in; c=infinity;
z1=(0,0); (x0,-y0)=z2=(2u,5u);
draw z0{curl c}..z1..{curl c}z2;
dotlabels.rt(0,1,2);
endfig;


beginfig(13);
z1=-z2=(.2in,0);
x3=-x6=.3in;
x3+y3=x6+y6=1.1in;
z4=1/3[z3,z6];
z5=2/3[z3,z6];
z20=whatever[z1,z3]=whatever[z2,z4];
z30=whatever[z1,z4]=whatever[z2,z5];
z40=whatever[z1,z5]=whatever[z2,z6];
draw z1--z20--z2--z30--z1--z40--z2;
pickup pencircle scaled 1pt;
draw z1--z2;
draw z3--z6;
%
dotlabels.bot(1,2);
dotlabels.rt(3);
dotlabels.lft(6);
dotlabels.top(20,30,40);
endfig;


vardef llet(expr c) =
  c infont defaultfont scaled magstep3
enddef;

primarydef p centered h =
  (p shifted (h - xpart .5[llcorner p,lrcorner p], 0))
enddef;

beginfig(14);
string s; s = "abcde";
numeric u,n, ytop, ybot;
n = 5;
ytop = 3bp + ypart urcorner llet(s);
ybot = -3bp + ypart llcorner llet(s);
ytop - ybot = u;
draw (n*u,ybot)--(0,ybot)--(0,ytop)--(n*u,ytop);
for i=1 upto n:
  draw (i*u,ybot)..(i*u,ytop);
  draw llet(substring (i-1,i) of s) centered ((i-.5)*u);
  label.bot(decimal i, (i*u,ybot));
endfor
picture llab; llab = btex \llap{$x={}$}0 etex;
z0 = urcorner llab;
draw llab shifted (-.5*x0, ybot-labeloffset-y0);
endfig;


beginfig(17);
a=.7in; b=.5in;
z0=(0,0);
z1=-z3=(a,0);
z2=-z4=(0,b);
draw z1..z2..z3..z4..cycle;
draw z1--z0--z2;
label.top("a", .5[z0,z1]);
label.lft("b", .5[z0,z2]);
dotlabel.bot("(0,0)", z0);
endfig;


beginfig(18);
numeric u;
u = 1cm;
draw (0,2u)--(0,0)--(4u,0);
pickup pencircle scaled 1pt;
draw (0,0){up}
  for i=1 upto 8: ..(i/2,sqrt(i/2))*u  endfor;
label.lrt(btex $\sqrt x$ etex, (3,sqrt 3)*u);
label.bot(btex $x$ etex, (2u,0));
label.lft(btex $y$ etex, (0,u));
endfig;


beginfig(19);
numeric ux, uy;
120ux=1.2in; 4uy=2.4in;
draw (0,4uy)--(0,0)--(120ux,0);
pickup pencircle scaled 1pt;
draw (0,uy){right}
  for ix=1 upto 8:
    ..(15ix*ux, uy*2/(1+cosd 15ix))
  endfor;
label.bot(btex $x$ axis etex, (60ux,0));
label.lft(btex $y$ axis etex rotated 90,
          (0,2uy));
label.lft(
  btex $\displaystyle y={2\over1+\cos x}$ etex,
  (120ux, 4uy));
endfig;


beginfig(20);
picture p;
p = "testing" infont "ptmr8r" scaled 7;
draw p;
draw llcorner p--lrcorner p--urcorner p--ulcorner p--cycle;
dotlabel.lft(btex \tt llcorner etex, llcorner p);
dotlabel.rt(btex \tt lrcorner etex, lrcorner p);
dotlabel.lft(btex \tt ulcorner etex, ulcorner p);
dotlabel.rt(btex \tt urcorner etex, urcorner p);
endfig;


beginfig(21);
path p;
p = (-1cm,0)..(0,-1cm)..(1cm,0);
fill p{up}..(0,0){-1,-2}..{up}cycle;
draw p..(0,1cm)..cycle;
endfig;


beginfig(22);
path a, b, aa, ab;
a = fullcircle scaled 2cm;
b = a shifted (0,1cm);
aa = halfcircle scaled 2cm;
ab = buildcycle(aa, b);
picture pa, pb;
pa = thelabel(btex $A$ etex, (0,-.5cm));
pb = thelabel(btex $B$ etex, (0,1.5cm));
fill a withcolor .7white;
fill b withcolor .7white;
fill ab withcolor .4white;
unfill bbox pa;
draw pa;
unfill bbox pb;
draw pb;
label.lft(btex $U$ etex, (-1cm,.5cm));
draw bbox currentpicture;
endfig;


beginfig(123);
path aa, b;
b = a shifted (0,1cm);
aa = halfcircle scaled 2cm;
draw aa;
draw b dashed evenly;
z1 = aa intersectionpoint reverse b;
z2 = reverse aa intersectionpoint b;
dotlabel.rt(btex 1 etex, z1);
dotlabel.lft(btex 2 etex, z2);
label.bot(btex \tt aa etex, point 0 of aa);
label.bot(btex \tt b etex, point 2 of b);
endfig;

beginfig(223);
path aa, b;
b = a shifted (0,1cm);
aa = halfcircle scaled 2cm;
numeric t[], tt[];
(t1,8-tt1) = aa intersectiontimes reverse b;
(4-t2,tt2) = reverse aa intersectiontimes b;
pickup(pencircle scaled .3);
draw aa;
draw b;
pickup(pencircle scaled .8);
draw subpath (t1,t2) of aa;
draw subpath (tt2,tt1) of b;
dotlabel.rt(btex 1 etex, point t1 of aa);
dotlabel.lft(btex 2 etex, point t2 of aa);
label.bot(btex \tt aa etex, point 0 of aa);
label.bot(btex \tt b etex, point 2 of b);
endfig;


beginfig(24);
h=2in; w=2.7in;
path p[], q[], pp;
for i=2 upto 4: ii:=i**2;
  p[i] = (w/ii,h){1,-ii}...(w/i,h/i)...(w,h/ii){ii,-1};
endfor
q0.5 = (0,0)--(w,0.5h);
q1.5 = (0,0)--(w/1.5,h);
pp = buildcycle(q0.5, p2, q1.5, p4);
fill pp withcolor .7white;
z0=center pp;
picture lab; lab=thelabel(btex $f>0$ etex, z0);
unfill bbox lab; draw lab;
draw q0.5; draw p2; draw q1.5; draw p4;
dotlabel.top(btex $P$ etex, p2 intersectionpoint q0.5);
dotlabel.rt(btex $Q$ etex, p2 intersectionpoint q1.5);
dotlabel.lft(btex $R$ etex, p4 intersectionpoint q1.5);
dotlabel.bot(btex $S$ etex, p4 intersectionpoint q0.5);
endfig;


beginfig(25);
numeric u;
u = .2in;
path a, b;
a = (0,0){up}..(4u,0)..(8u,0)..(8u,4u);
b = (10u,3u)..(5u,u)..(-u,u);
numeric t; t=0;
forsuffixes $=bot, llft, lrt, lft:
  dotlabel$(decimal t, point t of a);
  t:=t+1;
endfor
for i=0 upto 2:
   dotlabel.top(decimal i, point i of b);
endfor
pickup(pencircle scaled .3);
draw a;
pickup(pencircle scaled .8);
draw b;
% intersections (atime, btime):
% (0.2501,1.77225)
% (2.58316,0.23619)
% (0.75288,1.40094)
endfig;


beginfig(26);
numeric scf, #, t[]; 
3.2scf = 2.4in;
path fun;
# = .1;  % Keep the function single-valued
fun = ((0,-1#)..(1,.5#){right}..(1.9,.2#){right}..{curl .1}(3.2,2#))
  yscaled(1/#) scaled scf;
x1 = 2.5scf;
for i=1 upto 2:
  (t[i],whatever) =
    fun intersectiontimes ((x[i],-infinity)--(x[i],infinity));
  z[i] = point t[i] of fun;
  z[i]-(x[i+1],0) = whatever*direction t[i] of fun;
  draw (x[i],0)--z[i]--(x[i+1],0);
  fill fullcircle scaled 3bp shifted z[i];
endfor
label.bot(btex $x_1$ etex, (x1,0));
label.bot(btex $x_2$ etex, (x2,0));
label.bot(btex $x_3$ etex, (x3,0));
draw (0,0)--(3.2scf,0);
pickup pencircle scaled 1pt;
draw fun;
endfig;


beginfig(28);
path p[];
p1 = fullcircle scaled .6in;
z1=(.75in,0)=-z3;
z2=directionpoint left of p1=-z4;
p2 = z1..z2..{curl1}z3..z4..{curl 1}cycle;
fill p2 withcolor .4[white,black];
unfill p1;
draw p1;
transform T;
z1 transformed T = z2;
z3 transformed T = z4;
xxpart T=yypart T;  yxpart T=-xypart T;
picture pic;
pic = currentpicture;
for i=1 upto 2:
  pic:=pic transformed T;
  draw pic;
endfor
dotlabels.top(1,2,3); dotlabels.bot(4);
endfig;


beginfig(29);
if unknown withdots:	% So this works w/o MetaPost version 0.5
  picture withdots; withdots=dashpattern(off 2.5 on 0 off 2.5);
fi
z0 = (0,0);
z1 = (2in-2bp,0);
for i=1 upto 4:
  z[2i]-z[2i-2] = z[2i+1]-z[2i-1] = (0,14pt);
endfor
draw z0..z1 dashed evenly;
label.rt(btex \tt dashed evenly etex, z1);
draw z2..z3 dashed evenly scaled 2;
label.rt(btex \tt dashed evenly scaled 2 etex, z3);
draw z4..z5 dashed evenly scaled 4;
label.rt(btex \tt dashed evenly scaled 4 etex, z5);
draw z6..z7 dashed withdots;
label.rt(btex \tt dashed withdots etex, z7);
draw z8..z9 dashed withdots scaled 2;
label.rt(btex \tt dashed withdots scaled 2 etex, z9);
endfig;


beginfig(30);
picture e[]; e4=evenly scaled 4;
z0 = (0,0);
z1 = (2in,0);
for i=1 upto 3:
  z[2i]-z[2i-2] = z[2i+1]-z[2i-1] = (0,14pt);
endfor
dotlabels.lft(0,2,4,6);
draw z0..z1 dashed e4;
dotlabel.rt(btex 1 \tt\ draw z0..z1 dashed e4 etex, z1);
draw z2..z3 dashed e4 shifted (6bp,0);
dotlabel.rt(btex 3 \tt\ draw z2..z3 dashed e4 shifted (6bp,0) etex, z3);
draw z4..z5 dashed e4 shifted (12bp,0);
dotlabel.rt(btex 5 \tt\ draw z4..z5 dashed e4 shifted (12bp,0) etex, z5);
draw z6..z7 dashed e4 shifted (18bp,0);
dotlabel.rt(btex 7 \tt\ draw z6..z7 dashed e4 shifted (18bp,0) etex, z7);
endfig;


beginfig(31);
picture d; d = dashpattern(on 6bp  off 12bp  on 6bp);
draw d;
endfig;


beginfig(32);
draw dashpattern(on 15bp off 15bp) dashed evenly;
picture p;
p=currentpicture;
currentpicture:=nullpicture;
draw fullcircle scaled 1cm xscaled 3 dashed p;
endfig;


beginfig(33);
for i=0 upto 2:
  z[i]=(0,-40i); z[i+3]-z[i]=(100,30);
endfor
pickup pencircle scaled 18;
draw z0..z3 withcolor .8white;
linecap:=butt;
draw z1..z4 withcolor .8white;
linecap:=squared;
draw z2..z5 withcolor .8white;
dotlabels.top(0,1,2,3,4,5);
endfig; linecap:=rounded;


beginfig(34);
for i=0 upto 2:
  z[i]=(0,-50i); z[i+3]-z[i]=(60,40);
  z[i+6]-z[i]=(120,0);
endfor
pickup pencircle scaled 24;
draw z0--z3--z6 withcolor .8white;
linejoin:=mitered;
draw z1..z4--z7 withcolor .8white;
linejoin:=beveled;
draw z2..z5--z8 withcolor .8white;
dotlabels.bot(0,1,2,3,4,5,6,7,8);
endfig; linejoin:=rounded;


beginfig(35);
z2a=(0,0);
(-x1a,y1a) = -z3a = .5in*unitvector(6,1);
z1b - z1a = .75*z1a rotated -90;
z2b - z1b = whatever*(z2a-z1a);
z3b - z2b = whatever*(z3a-z2a);
y2b = 0;
z3b - z3a = whatever*(z3a rotated 90);
z0b-z1b = z0a-z1a = z1a;
x4a=x2a; x4b=x2b;
y4a = y4b = 1.3*y3b;
fill z1a--z2a--z3a--z3b--z2b--z1b--cycle withcolor .8 white;
for p= z2a--z4a, z2b--z4b, z0a--z1a, z0b--z1b:
   draw p dashed evenly;
endfor
drawdblarrow z4a--z4b;
drawdblarrow z0a--z0b;
label.bot(btex miter length etex, .5[z4a,z4b]);
label.ulft(btex line width etex, .5[z0a,z0b]);
endfig;


beginfig(36);
z[-1]=(0,0); z0=(1in,0);
for i=1 upto 6:
  z[i]-z[i-2] = (0,-15pt);
  if x[i]=0: label.lft(decimal i, z[i]);
  fi
endfor
drawarrow z1..z2;
drawarrow reverse(z3..z4);
drawdblarrow z5..z6;
label.rt(btex 2 \tt\ drawarrow z1..z2 etex, z2);
label.rt(btex 4 \tt\ drawarrow reverse(z3..z4) etex, z4);
label.rt(btex 6 \tt\ drawdblarrow z5..z6 etex, z6);
endfig;


beginfig(37);
path p, q, r;
ahlength := 1.5cm;
pickup pencircle scaled .2cm;
p = (0,0)..{right}(2.5cm,2cm);
q = counterclockwise arrowhead p;
z0 = directionpoint up of q;
z.a = directionpoint right of q;
z.b = directionpoint (-1,-1) of q;
drawarrow p withcolor .4white;
pickup defaultpen;
undraw p;
undraw q;
ahlength:=4bp;
z.a1-z0 = .3cm*unitvector(z.a-z0) rotated 90;
z.a1-z.a2 = z0-z.a;
z.b1-z0 = .3cm*unitvector(z.b-z0) rotated -90;
z.b1-z.b2 = z0-z.b;
z.ab = whatever[z.a1,z.a2] = whatever[z.b1,z.b2];
z.a0-z.ab = .4cm*unitvector(z.a1-z.a2);
z.b0-z.ab = .4cm*unitvector(z.b1-z.b2);
drawdblarrow z.a1..z.a2;
label.lrt(btex \tt ahlength etex, .9[z.a1,z.a2]);
draw z.a1..z.a0 dashed evenly;
drawdblarrow z.b1..z.b2;
label.urt(btex \tt ahlength etex, .9[z.b1,z.b2]);
draw z.b1..z.b0 dashed evenly;
r = z.a0{(z.a2-z.a0) rotated 90}..{(z.b2-z.b0)rotated 90}z.b0;
draw r;
label.rt(btex \tt ahangle etex, point .5 of r);
endfig;


beginfig(38);
pickup pencircle scaled .2in yscaled .08 rotated 30;
x0=x3=x4;
z1-z0 = .45in*dir 30;
z2-z3 = whatever*(z1-z0);
z6-z5 = whatever*(z1-z0);
z1-z6 = 1.2*(z3-z0);
rt x3 = lft x2;
x5 = .55[x4,x6];
y4 = y6;
lft x3 = bot y5 = 0;
top y2 = .9in;
draw z0--z1--z2--z3--z4--z5--z6 withcolor .7white;
dotlabels.top(0,1,2,3,4,5,6);
endfig;


beginfig(40);
path p[];
p1 = (0,0){curl 0}..(5pt,-3pt)..{curl 0}(10pt,0);
p2 = p1..(p1 yscaled-1 shifted(10pt,0));
p0 = p2;
for i=1 upto 3:  p0:=p0.. p2 shifted (i*20pt,0);
  endfor
for j=0 upto 8:  draw p0 shifted (0,j*10pt);
  endfor
p3 = fullcircle shifted (.5,.5) scaled 72pt;
clip currentpicture to p3;
draw p3;
endfig;


marksize=4pt;
angle_radius=8pt;

def draw_mark(expr p, a) =
  begingroup
  save t, dm; pair dm;
  t = arctime a of p;
  dm = marksize*unitvector direction t of p
    rotated 90;
  draw (-.5dm.. .5dm) shifted point t of p;
  endgroup
enddef;

def draw_marked(expr p, n) =
  begingroup
  save amid;
  amid = .5*arclength p;
  for i=-(n-1)/2 upto (n-1)/2:
    draw_mark(p, amid+.6marksize*i);
  endfor
  draw p;
  endgroup
enddef;

def mark_angle(expr a, b, c, n) =
  begingroup
  save s, p; path p;
  p = unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
  s = .9marksize/length(point 1 of p - point 0 of p);
  if s<angle_radius: s:=angle_radius; fi
  draw_marked(p scaled s shifted b, n);
  endgroup
enddef;

def mark_rt_angle(expr a, b, c) =
  draw ((1,0)--(1,1)--(0,1))
       zscaled (angle_radius*unitvector(a-b)) shifted b
enddef;

beginfig(42);
pair a,b,c,d;
b=(0,0); c=(1.5in,0); a=(0,.6in);
d-c = (a-b) rotated 25;
dotlabel.lft("a",a);
dotlabel.lft("b",b);
dotlabel.bot("c",c);
dotlabel.llft("d",d);
z0=.5[a,d];
z1=.5[b,c];
(z.p-z0) dotprod (d-a) = 0;
(z.p-z1) dotprod (c-b) = 0;
draw a--d;
draw b--c;
draw z0--z.p--z1;
draw_marked(a--b, 1);
draw_marked(c--d, 1);
draw_marked(a--z.p, 2);
draw_marked(d--z.p, 2);
draw_marked(b--z.p, 3);
draw_marked(c--z.p, 3);
mark_angle(z.p, b, a, 1);
mark_angle(z.p, c, d, 1);
mark_angle(z.p, c, b, 2);
mark_angle(c, b, z.p, 2);
mark_rt_angle(z.p, z0, a);
mark_rt_angle(z.p, z1, b);
endfig;


def getmid(suffix p) =
  pair p.mid[], p.off[], p.dir[];
  for i=0 upto 36:
    p.dir[i] = dir(5*i);
    p.mid[i]+p.off[i] = directionpoint p.dir[i] of p;
    p.mid[i]-p.off[i] = directionpoint -p.dir[i] of p;
  endfor
enddef;

def joinup(suffix pt, d)(expr n) =
  begingroup
  save res, g; path res;
  res = pt[0]{d[0]};
  for i=1 upto n:
    g:= if (pt[i]-pt[i-1]) dotprod d[i] <0: - fi 1;
    res := res{g*d[i-1]}...{g*d[i]}pt[i];
  endfor
  res
  endgroup
enddef;

beginfig(45)
path p, q;
p = ((5,2)...(3,4)...(1,3)...(-2,-3)...(0,-5)...(3,-4)
     ...(5,-3)...cycle) scaled .3cm shifted (0,5cm);
getmid(p);
draw p;
draw joinup(p.mid, p.dir, 36)..cycle;
q = joinup(p.off, p.dir, 36);
draw q..(q rotated 180)..cycle;
drawoptions(dashed evenly);
for i=0 upto 3:
  draw p.mid[9i]-p.off[9i]..p.mid[9i]+p.off[9i];
  draw -p.off[9i]..p.off[9i];
endfor
endfig;


beginfig(55)
picture wheel, car;
path body;
  u := 5bp;
  % Use a calligraphic pen.
  pickup pencircle scaled .1u yscaled .6 rotated 30;
  % Define a wheel object.
  wheel := image(
    draw fullcircle scaled 2u xscaled .8 rotated 30;
    draw fullcircle scaled .1u xscaled .8 rotated 30
      withpen currentpen scaled .5;
  );
  % Construct path for car body.
  body := (3.2u,0){right}..(4.5u,1.5u){up}..(1.5u,2.5u){dir(-170)}
    ..(1.5u,4.25u){up}...(0,5u){left};
  body := body .. reverse body reflectedabout (origin, (0,u));
  % Define a car object.
  car := image(
    draw wheel shifted (2u, 0);% Draw two wheels.
    draw wheel shifted (-2u, 0);
    draw (-.8u,0){dir(5)}..(.8u,0);% Draw connection betweeen wheels.
    draw body;% Draw body.
    % Draw speed indicators.
    for i=1.5, 2, 2.5:
      draw (5u, u*i){right}..{dir(-10)}(6.5u,u*i*.95);
    endfor
  ) shifted (0, u) slanted -.2 rotated 1;% Introduce asymmetries.
  % Draw two cars and a faster one.
  draw car shifted (5u,0);
  draw car shifted (20u,0);
  draw car slanted -.25 shifted (45u,0);
  % Draw motorway.
  draw (-5u,-u)...(25u,-.5u)...(60u,-u)
    withpen currentpen scaled 4 withcolor .7white;
endfig;


fontmapfile "=lm-ec.map";
beginfig(56);
  picture q;
  path p;
  interim ahlength := 12bp;
  interim ahangle := 25;
  q := glyph "Dcaron" of "ec-lmr10" scaled .2;
  for item within q:
    p := pathpart item;
    drawarrow p withcolor (.6,.9,.6)
        withpen pencircle scaled 1.5;
    for j=0 upto length p:
      pickup pencircle scaled .7;
      draw (point j of p -- precontrol j of p)
          dashed evenly withcolor blue;
      draw (point j of p -- postcontrol j of p)
          dashed evenly withcolor blue;
      pickup pencircle scaled 3;
      draw precontrol j of p withcolor red;
      draw postcontrol j of p withcolor red;
      pickup pencircle scaled 2;
      draw point j of p withcolor black;
    endfor
  endfor
endfig;


%%% Title page rule.
beginfig(60);
  pickup pencircle scaled 1.1bp;
  linecap := rounded;
  draw origin--(4.38in,0);
endfig;


beginfig(61);
  def shape_with_cardinal_points(expr shape) =
    image(
      interim ahangle := 30;
      interim ahlength := 6bp;
      drawarrow shape withpen pencircle scaled .5;
      for k = 0 upto length shape:
        drawdot point k of shape withpen pencircle scaled dotlabeldiam;
      endfor
    )
  enddef;
  
  draw shape_with_cardinal_points(fullcircle scaled 1in);
  draw shape_with_cardinal_points(unitsquare scaled 1in) withcolor .5white;
endfig;

end
