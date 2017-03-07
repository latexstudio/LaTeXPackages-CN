import graph3;
size(200);
currentprojection=perspective(4.4,3.9,3.4);
limits((0,0,0),(1.4,1.4,1.4));
real a=4/3*(sqrt(2)-1);
triple[][] p={
  {(1,0,0),(1,0,a),(a,0,1),(0,0,1)},
  {(1,a,0),(1,a,a),(a,a^2,1),(0,0,1)},
  {(a,1,0),(a,1,a),(a^2,a,1),(0,0,1)},
  {(0,1,0),(0,1,a),(0,a,1),(0,0,1)}  
};
path3 g=p[0][0]{Z}..{-X}p[0][3]..p[3][3]{Y}..{-Z}p[3][0]{X}..{-Y}cycle;
draw(g,blue);
draw(surface(g,new triple[]{p[1][1],p[1][2],p[2][2],p[2][1]}),opacity(0.2));
for(int i=0;i<p.length;++i){
  draw(operator--(...p[i]),green);
  dot(p[i],red);
}
triple[][] q=transpose(p);
for(int i=0;i<q.length;++i){
  draw(operator--(...q[i]),red+2pt);
}
label("(1,0,0)",p[0][0],p[0][0]);
label("(1,0,a)",p[0][1],p[0][1]);
label("(a,0,1)",p[0][2],p[0][2]);
label("(1,a,0)",p[1][0],p[1][2]);
label("(a,1,0)",p[2][0],p[2][0]);
label("(0,1,0)",p[3][0],p[3][0]);
label("(0,1,a)",p[3][1],p[3][1]);
label("(0,a,1)",p[3][2],p[3][2]);
label("(0,0,1)",p[3][3],p[3][3]);
axes3("$x$","$y$","$z$",Arrow3());
