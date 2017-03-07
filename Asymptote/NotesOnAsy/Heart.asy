size(200);
draw((0,0)--(2.5,2.5),linewidth(1),Arrow);
filldraw((0,1)..(1,2)..(2,0)..(1,-2)..(0,-3)
         ..(0,-3)..(-1,-2)..(-2,0)..(-1,2)..(0,1)..cycle,
         pink,red+linewidth(3));
draw((-3,-3)--(0,0),linewidth(1));
