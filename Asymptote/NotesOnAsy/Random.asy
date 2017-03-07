size(200);
pen colorpen=blue;
pair end=(0,0);
pair direction=E;
srand(seconds());
void randomwalk(int n){
  if (n==0)return;
  else{
    real angle=rand()%360;
    real lambda=1;
    pair begin=end;
    end=begin+scale(lambda)*direction;
    path randompath=begin--end;
    draw(randompath,colorpen);
    direction=rotate(angle)*direction;
    randomwalk(n-1);
  }
}
randomwalk(1000);
