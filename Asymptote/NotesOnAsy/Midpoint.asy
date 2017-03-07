size(200);
pair A, B, C;
A=(0,0); B=(4,0); C=(1,2);
pair D,E,F;
D=midpoint(A--B);
E=midpoint(B--C);
F=midpoint(C--A);
draw(A--B--C--cycle);
filldraw(D--E--F--cycle,red);
