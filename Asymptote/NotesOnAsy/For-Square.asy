size(8cm,0);

path A=(0,0)--(2,1)--(2,3)--(0,2)--cycle;
path B=reflect((0,0),(0,1))*A;
path C=rotate(180,(0,0))*A;
path D=reflect((0,0),(1,0))*A;

picture pic;

filldraw(pic,A^^C,lightblue+white,black);
filldraw(pic,B^^D,lightred+white,black);

for(int i=0; i<9; ++i){
  for(int j=0; j<6; ++j){
    add(shift(4*i,6*j)*pic);
  }
}

