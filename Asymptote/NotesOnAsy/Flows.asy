size(200);
real margin=1mm;
pair A=(0,2), B=(-2,0), C=(2,0), D=(-2,-2), F=(2,-2);
object one=draw("$1$",ellipse,A,margin);
object four=draw("$4$",ellipse,B,margin);
object five=draw("$5$",ellipse,C,margin);
object two=draw("$2$",ellipse,D,margin);
object three=draw("$3$",ellipse,F,margin);

add(new void(picture pic, transform t) {
    draw(pic,Label("two",align=W),point(two,SW,t){SW}..{SE}point(two,NW,t),Arrow);
    draw(pic,Label("three",align=E),point(three,SE,t){SE}..{SW}point(three,NE,t),Arrow);
    draw(pic,Label("four",align=W),point(four,NW,t){NW}..{NE}point(four,SW,t),Arrow);
    draw(pic,Label("five",align=E),point(five,NE,t){NE}..{NW}point(five,SE,t),Arrow);
    draw(pic,point(one,SW,t){SW}..{SW}point(four,NE,t),Arrow);
    draw(pic,point(one,SE,t){SE}..{SE}point(five,NW,t),Arrow);
    draw(pic,point(four,E,t){E}..{E}point(five,W,t),Arrow);
    draw(pic,Label("$\frac{1}{2}$",align=N),
         point(two,NE,t){NE}..{SE}point(three,NW,t),Arrow);
    draw(pic,Label("$\frac{1}{4}$",align=N),
         point(three,SW,t){SW}..{NW}point(two,SE,t),Arrow);    
  });
