size(300);
import three;
currentprojection=perspective(20,-10,8);
triple a_orth=2X;
triple b=2Y;
triple a_par=0.5*b;
triple a=a_orth+a_par;
draw((4,4,0)--(-4,4,0)--(-4,-4,0)--(4,-4,0)--cycle);
draw(surface(O--0.3Y--(0.3Y+0.3Z)--0.3*Z--cycle),lightyellow,nolight);
draw(surface(O--(-0.3)*X--(-0.3X+0.3Z)--0.3Z--cycle),lightyellow,nolight);
draw(surface(O--(-0.3Y)--(-0.3Y-0.3X)--(-0.3X)--cycle),lightyellow,nolight);
draw(O--a_orth,Arrow3(DefaultHead2(normal=Z)));
draw(O--b,red,Arrow3(DefaultHead2(normal=Z)));
draw(O--a,red,Arrow3(DefaultHead2(normal=Z)));
draw(O--cross(a,b),red,Arrow3(DefaultHead2()));
draw(a_orth--a_orth+a_par,Arrow3(DefaultHead2(normal=Z)));
draw(O--(-0.3)*b);
draw(O--(-0.3)*a_orth);
draw(a--a+3*a_par,deepgreen+dashed,Arrow3(DefaultHead2(normal=Z)));
draw(a_orth--a_orth+(-3)*a_par,deepgreen+dashed);
int[] I={-2,-1,0,1,2,3};
I=reverse(I);
for(int i: I){
  if(i!=0 && i!=1)
    draw(Label(YZ()*format("$x_{%d}$",find(I==i)+1),EndPoint,align=S,red),
         O--a_orth+i*a_par, deepgreen, Arrow3(DefaultHead2(normal=Z)));
}
