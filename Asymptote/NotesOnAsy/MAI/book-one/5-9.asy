size(200);
import graph;
path p=(16,59)..controls(24.8904056634,70.6819914334)and(35.3180085666,81.1095943366)..(47,90)
..controls(58.7379447591,98.9329881089)and(71.719288303,106.272218502)..(86,110)
..controls(95.7764580201,112.552008618)and(105.90447389,113.329009094)..(116,113)
..controls(135.502961138,112.364406421)and(155.011182625,107.48822798)..(170,95)
  ..controls(172.90335151,92.5810155897)and(175.58101559,89.9033515096)..(178,87);
draw(p,linewidth(1));
pair A=point(p,0);
pair B=point(p,length(p));
real t=maxtimes(p)[1];
pair C=point(p,t);

draw(A--(A.x,0),dashed);
draw(B--(B.x,0),dashed);
draw(C--(C.x,0),dashed);

pair K=point(p,0.1*length(p));
pair L=point(p,0.75*length(p));

draw(K--(K.x,0),dashed);
draw(L--(L.x,0),dashed);
label("$\xi$",C.x,S);
label("$a$",A.x,S);
label("$b$",B.x,S);
label("$x_{1}$",K.x,S);
label("$x_{2}$",L.x,S);
label("$O$",(0,0),SW);
xlimits(-10,B.x+20);

axes("$x$","$y$",Arrow());

