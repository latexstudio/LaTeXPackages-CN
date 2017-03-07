import graph;
unitsize(4cm,8cm);
defaultpen(1.5pt+fontsize(20pt)+Helvetica());
real f(real x){return sin(2pi*x)^2*exp(-x);}
real g(real x){return cos(2pi*x)^2*exp(-x);}

draw(graph(f,0,4,operator..),red,Label("$\phi_{f_1}$ vs $\phi_{f_{11}}$"));
draw(graph(g,0,4,operator..),blue+linetype("2 2"),Label("$\phi_{f_6}$ vs $\phi_{f_{11}}$"));

xaxis("Frequency(kHz)",BottomTop,LeftTicks);
yaxis("Cross Power(a.u.)",LeftRight,RightTicks());

xequals(1,blue+Dotted);
xequals(2,blue+Dotted);
xequals(3,blue+Dotted);
yequals(0.5,blue+Dotted);

add(legend(),point((0)),NE,UnFill);
