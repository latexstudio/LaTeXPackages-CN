size(200);
pair z0=(0,0),c0=(-1,2),c1=(4,3), z1=(3,0);
path p=z0..controls c0 and c1..z1;
draw(p,red);
dot("$(0,0)$",z0,S);
dot("$(1,1)$",c0,N);
dot("$(2,1)$",c1,N);
dot("$(3,0)$",z1,S);

write(precontrol(p,0));
write(postcontrol(p,0));

write(precontrol(p,1));
write(postcontrol(p,1));


