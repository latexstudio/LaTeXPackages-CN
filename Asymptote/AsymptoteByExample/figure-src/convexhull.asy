size(5cm);
int n = 10;
pair[] Q = new pair[n];
for (int i = 0; i < n; ++i)
{
    Q[i] = unitrand() * expi(2pi*unitrand());
    dot(Q[i]);
}

pair p0 = Q[0];
int imin = 0;
for (int i = 0; i < n; ++i) {
    if (Q[i].y < p0.y) {
        p0 = Q[i];
        imin = i;
    }
}
pair[] parr = sort(copy(Q),
    new bool(pair i, pair j) {
        if (i == p0 && j != p0)
            return true;
        else if (i == p0 || j == p0)
            return false;
        else
            return angle(i-p0) < angle(j-p0);
    });

pair[] CH;
int k;
CH.push(parr[0]);
CH.push(parr[1]);
CH.push(parr[2]);
k = 2;

bool nonleftturn(pair z1, pair z2, pair z3)
{
    pair u = z2-z1, v = z3-z2;
    return u.x*v.y < v.x*u.y;
}

for (int i = 3; i < n; ++i) {
    while (nonleftturn(CH[CH.length-2], CH[CH.length-1], parr[i]))
        CH.pop();
    CH.push(parr[i]);
}

guide g = nullpath;
for (pair p: CH) { g = g .. tension atleast 2 .. p; }
g = g .. tension atleast 2 .. cycle;
draw(g);