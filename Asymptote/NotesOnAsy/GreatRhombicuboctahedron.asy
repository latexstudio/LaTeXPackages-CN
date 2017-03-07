size(400);
import graph3;

currentprojection=orthographic(2,4,3);

real[][] P={{-(1/2), 1/2 + 1/sqrt(2), -(1/2) - sqrt(2)}, {-(1/2),
  1/2 + 1/sqrt(2), 1/2 + sqrt(2)}, {-(1/2), 1/(
  2 - 2 sqrt(2)), -(1/2) - sqrt(2)}, {-(1/2), 1/(2 - 2 sqrt(2)),
  1/2 + sqrt(2)}, {-(1/2), -(1/2) - sqrt(2),
  1/2 + 1/sqrt(2)}, {-(1/2), -(1/2) - sqrt(2), 1/(
  2 - 2 sqrt(2))}, {-(1/2), 1/2 + sqrt(2), 1/2 + 1/sqrt(2)}, {-(1/2),
  1/2 + sqrt(2), 1/(2 - 2 sqrt(2))}, {1/2,
  1/2 + 1/sqrt(2), -(1/2) - sqrt(2)}, {1/2, 1/2 + 1/sqrt(2),
  1/2 + sqrt(2)}, {1/2, 1/(2 - 2 sqrt(2)), -(1/2) - sqrt(2)}, {1/2,
  1/(2 - 2 sqrt(2)), 1/2 + sqrt(2)}, {1/2, -(1/2) - sqrt(2),
  1/2 + 1/sqrt(2)}, {1/2, -(1/2) - sqrt(2), 1/(2 - 2 sqrt(2))}, {1/2,
  1/2 + sqrt(2), 1/2 + 1/sqrt(2)}, {1/2, 1/2 + sqrt(2), 1/(
  2 - 2 sqrt(2))}, {1/2 + 1/sqrt(2), -(1/2), -(1/2) - sqrt(2)}, {1/
   2 + 1/sqrt(2), -(1/2), 1/2 + sqrt(2)}, {1/2 + 1/sqrt(2), 1/
  2, -(1/2) - sqrt(2)}, {1/2 + 1/sqrt(2), 1/2,
  1/2 + sqrt(2)}, {1/2 + 1/sqrt(2), -(1/2) - sqrt(2), -(1/2)}, {1/2 +
   1/sqrt(2), -(1/2) - sqrt(2), 1/2}, {1/2 + 1/sqrt(2),
  1/2 + sqrt(2), -(1/2)}, {1/2 + 1/sqrt(2), 1/2 + sqrt(2), 1/2}, {1/(
  2 - 2 sqrt(2)), -(1/2), -(1/2) - sqrt(2)}, {1/(
  2 - 2 sqrt(2)), -(1/2), 1/2 + sqrt(2)}, {1/(2 - 2 sqrt(2)), 1/
  2, -(1/2) - sqrt(2)}, {1/(2 - 2 sqrt(2)), 1/2, 1/2 + sqrt(2)}, {1/(
  2 - 2 sqrt(2)), -(1/2) - sqrt(2), -(1/2)}, {1/(
  2 - 2 sqrt(2)), -(1/2) - sqrt(2), 1/2}, {1/(2 - 2 sqrt(2)),
  1/2 + sqrt(2), -(1/2)}, {1/(2 - 2 sqrt(2)), 1/2 + sqrt(2), 1/
  2}, {-(1/2) - sqrt(2), -(1/2),
  1/2 + 1/sqrt(2)}, {-(1/2) - sqrt(2), -(1/2), 1/(
  2 - 2 sqrt(2))}, {-(1/2) - sqrt(2), 1/2,
  1/2 + 1/sqrt(2)}, {-(1/2) - sqrt(2), 1/2, 1/(
  2 - 2 sqrt(2))}, {-(1/2) - sqrt(2),
  1/2 + 1/sqrt(2), -(1/2)}, {-(1/2) - sqrt(2), 1/2 + 1/sqrt(2), 1/
  2}, {-(1/2) - sqrt(2), 1/(
  2 - 2 sqrt(2)), -(1/2)}, {-(1/2) - sqrt(2), 1/(2 - 2 sqrt(2)), 1/
  2}, {1/2 + sqrt(2), -(1/2),
  1/2 + 1/sqrt(2)}, {1/2 + sqrt(2), -(1/2), 1/(
  2 - 2 sqrt(2))}, {1/2 + sqrt(2), 1/2,
  1/2 + 1/sqrt(2)}, {1/2 + sqrt(2), 1/2, 1/(
  2 - 2 sqrt(2))}, {1/2 + sqrt(2),
  1/2 + 1/sqrt(2), -(1/2)}, {1/2 + sqrt(2), 1/2 + 1/sqrt(2), 1/
  2}, {1/2 + sqrt(2), 1/(2 - 2 sqrt(2)), -(1/2)}, {1/2 + sqrt(2), 1/(
                                                                     2 - 2 sqrt(2)), 1/2}};

int[][] F={{44, 42, 17, 19}, {14, 6, 3, 11}, {34, 36, 27, 25}, {8, 16, 9,
  1}, {20, 18, 41, 43}, {12, 4, 5, 13}, {26, 28, 35, 33}, {2, 10, 15,
  7}, {45, 23, 24, 46}, {39, 29, 30, 40}, {48, 22, 21, 47}, {38, 32,
  31, 37}, {9, 19, 17, 11, 3, 25, 27, 1}, {2, 28, 26, 4, 12, 18, 20,
  10}, {41, 48, 47, 42, 44, 45, 46, 43}, {35, 38, 37, 36, 34, 39, 40,
  33}, {15, 24, 23, 16, 8, 31, 32, 7}, {5, 30, 29, 6, 14, 21, 22,
  13}, {46, 24, 15, 10, 20, 43}, {35, 28, 2, 7, 32, 38}, {41, 18, 12,
  13, 22, 48}, {40, 30, 5, 4, 26, 33}, {44, 19, 9, 16, 23, 45}, {37,
                                                                 31, 8, 1, 27, 36}, {47, 21, 14, 11, 17, 42}, {34, 25, 3, 6, 29, 39}};


surface sphericaltriangle(triple center, triple A, triple B, triple C,
                          int nu=3, int nv=nu) {
  path3 tri1=arc(center,A,B);
  path3 tri2=arc(center,A,C);
  path3 tri3=arc(center,B,C);
  triple tri(pair p) {
    path3 cr=arc(O,relpoint(tri2,p.x),relpoint(tri3,p.x));
    return relpoint(cr,p.y);
  };

  return surface(tri,(0,0),(1-sqrtEpsilon,1),nu,nv,Spline);
}

for(int k=0;k<F.length;++k){
  for(int j=0;j<F[k].length;++j){
     triple[] PatchPoints=sequence(new triple(int l) {
         return unit((P[F[k][l]-1][0],P[F[k][l]-1][1],P[F[k][l]-1][2]));
    },F[k].length);
     PatchPoints.cyclic=true;
     triple M=unit(sum(PatchPoints)/F[k].length);
     pen p;
    if(F[k].length==4){p=blue;}
    if(F[k].length==6){p=yellow;}
    if(F[k].length==8){p=red;}
    draw(sphericaltriangle(O,M,PatchPoints[j],PatchPoints[j+1]),p,nolight);
    draw(arc(O,PatchPoints[j],PatchPoints[j+1]),linewidth(2));
  }
}
