size(200);
import three;
import palette;

currentprojection=orthographic(1.2,3.2,0.7);

pen[] colors={green,blue,yellow,orange,cyan};
colors.cyclic=true;

triple[][] basic=new triple[][]{
  {(1,1,1),(1,-1,-1),(-1,1,-1)},
  {(1,1,1),(-1,1,-1),(-1,-1,1)},
  {(1,1,1),(-1,-1,1),(1,-1,-1)},
  {(1,-1,-1),(-1,-1,1),(-1,1,-1)}
};

surface koch(triple p,triple q,triple r,int n){
  surface s;
  triple pq=(p+q)/2;
  triple qr=(q+r)/2;
  triple pr=(p+r)/2;
  triple tmp=(p+q+r)/3+abs(p-q)*unit(cross(q-p,r-p))/sqrt(6);
  if(n>0){
    s.append(koch(p,pq,pr,n-1));
    s.append(koch(pq,q,qr,n-1));
    s.append(koch(pr,qr,r,n-1));
    s.append(koch(pr,pq,tmp,n-1));
    s.append(koch(pq,qr,tmp,n-1));
    s.append(koch(qr,pr,tmp,n-1));
  }
  if(n==0){
    s.append(surface(pr--pq--tmp--cycle));
    s.append(surface(pr--qr--tmp--cycle));
    s.append(surface(pq--qr--tmp--cycle));
  }
  return s;
}

void kochcube(int n){
  for(triple[] T : basic){
    draw(surface(T[0]--T[1]--T[2]--cycle),red);
    for(int level=0;level<n;++level)
      draw(koch(T[0],T[1],T[2],level),colors[level]);
  }
}

kochcube(5);

/*
pair[] location={NW,NE,SW,SE};
int begin=0;
for(int n=begin;n<begin+4;++n){
  picture pic;
  size(pic,200);
  draw(pic,shift(-1,-1,-1)*scale(2,2,2)*unitbox);
  for(triple[] T : basic){
    draw(pic,surface(T[0]--T[1]--T[2]--cycle),red,meshpen=thick());
    for(int level=0;level<n;++level)
      draw(pic,koch(T[0],T[1],T[2],level),colors[level]);
  }
  add(pic.fit(orthographic(1.2,3.2,0.7)),(0,0),location[n-begin]);
}
*/
