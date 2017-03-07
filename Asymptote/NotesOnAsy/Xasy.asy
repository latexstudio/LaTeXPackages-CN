size(0,200,IgnoreAspect);
import graph;
path p0=(0,0)..controls(19.1626305611,9.53339005251)and(34.4106887299,27.2072756573)..(44,48)
  ..controls(52.0319312179,65.4158213296)and(55.8872099039,84.6685012723)..(66,101)
  ..controls(79.5675370561,122.910690528)and(104.662033674,136.247402292)..(126,125)
  ..controls(139.515072689,117.876103692)and(145.270118249,102.660055607)..(152,89)
  ..controls(158.917506848,74.9591101743)and(167.753273728,61.7678239834)..(180,52)
  ..controls(190.315187474,43.7727453553)and(202.945383656,38.316393021)..(216,40)
  ..controls(232.951635585,42.1861915528)and(245.759610698,55.3306870085)..(253,71)
  ..controls(263.884987238,94.556781939)and(262.765590107,122.789002413)..(278,144)
  ..controls(283.864988393,152.165872884)and(292.054412958,158.744370744)..(302,160)
  ..controls(324.100991125,162.790247667)and(339.118758573,141.703444546)..(350,121)
  ..controls(362.275681403,97.6433921255)and(374.681335139,74.0387013701)..(393,55)
  ..controls(398.248521358,49.5451793825)and(403.934116961,44.5284773796)..(410,40);
draw(p0,linewidth(2));
xaxis();
yaxis();
real t0=dirtime(p0, (1,0));
dot(point(p0,t0),red+linewidth(4));

path p1=subpath(p0,t0+10epsilon,infinity);
real t1=dirtime(p1,(1,0));
dot(point(p1,t1),green+linewidth(4));

path p2=subpath(p1,t1+10epsilon,infinity);
real t2=dirtime(p2,(1,0));
dot(point(p2,t2),blue+linewidth(4));

arrow("Research",point(p0,t0),N,red);
arrow("Standards",point(p1,t1),N,green);
arrow("{Billion dollar} {investment}",point(p2,t2),N,blue);

arrow("Time",(250,-10),W);

arrow(rotate(90)*"Activity",(-10,120),S);

