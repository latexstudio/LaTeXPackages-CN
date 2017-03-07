import three;
size(200);
currentprojection=perspective(4,5,5);
real a=1,b=1,c=1;
path3[] g={
  (0,0,0)--(a,0,0)--(a,b,0)--(0,b,0)--cycle,
  (0,0,0)--(a,0,0)--(a,0,c)--(0,0,c)--cycle,
  (a,0,0)--(a,b,0)--(a,b,c)--(a,0,c)--cycle,
  (a,b,0)--(0,b,0)--(0,b,c)--(a,b,c)--cycle,
  (0,b,0)--(0,0,0)--(0,0,c)--(0,b,c)--cycle,
  (0,0,c)--(a,0,c)--(a,b,c)--(0,b,c)--cycle
};
pen[] pen={red,green,blue,black};
for(path3 p:g){
  draw(surface(p,pen),nolight);
}
