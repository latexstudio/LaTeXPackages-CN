size(200);
draw(unitsquare);
pair w1(pair t){
  real x=t.x;
  real y=t.y;
  return (x/3,2y/3);
}
pair w2(pair t){
  real x=t.x;
  real y=t.y;
  return ((2-x)/3,(1+y)/3);
}
pair w3(pair t){
  real x=t.x;
  real y=t.y;
  return ((2+t.x)/3,(1+2t.y)/3);
}
void recur(pair A,pair B,int level){
  if(level >0){
    draw(box(w1(A),w1(B)),blue);
    draw(box(w2(A),w2(B)),blue);
    draw(box(w3(A),w3(B)),blue);
    recur(w1(A),w1(B),level-1);
    recur(w2(A),w2(B),level-1);
    recur(w3(A),w3(B),level-1);
  }
  else{
    draw(A--B,red);
  }
}
recur((0,0),(1,1),3);

