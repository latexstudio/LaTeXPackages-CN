size(200);
int n=8;
real step=360/n;
for (int i=0; i < n; ++i) {
  draw(rotate(i*step)*xscale(.5)*unitcircle);
}
