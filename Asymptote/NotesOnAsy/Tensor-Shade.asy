size(10cm,0);  
 
real r=1; 
real R=3.8; 
 
int step=30; 
path p=arc(0,r,0,step); 
path P=arc(0,R,step,0); 
for(int h=0; h < 360; h += step) { 
transform t=rotate(90-h); 
tensorshade(t*p--t*P--cycle, 
new pen[] {white,white,hsv(h-step,1,1),hsv(h,1,1)}); 
}  
 
for(int h=0; h < 360; h += 30) { 
pair v=R*dir(90-h); 
draw(Label(string(h)+"$^\circ$",EndPoint),(v--1.05v)); 
} 
 
draw(circle(0,r)); 
draw(circle(0,R)); 
