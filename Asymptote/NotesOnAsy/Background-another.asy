size(200); 
import solids; 
currentprojection=orthographic(5,4,3);
revolution Sp=sphere(1);
draw(Sp.silhouette(100),blue+1pt);
draw(Sp,m=7,blue+1pt);
currentpicture.add(new void(frame f, transform3 t, picture pic, projection P) {
    draw(f,surface(invert(box(min(f,P),max(f,P)),min3(f),P),
                   new pen[] {orange,green,yellow,red}));
  });

