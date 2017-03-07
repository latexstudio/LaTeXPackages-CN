import graph3;
size(200);
currentprojection=orthographic(4,4,4);
surface sf=unitsphere;
for(int i=0;i<sf.s.length;++i){
  draw(surface(sf.s[i].external(),sf.s[i].internal(),
               new pen[] {cyan,magenta,yellow,green}),nolight);
}
