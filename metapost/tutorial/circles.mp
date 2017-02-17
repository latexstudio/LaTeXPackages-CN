if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
	% Use 8 circles
	N:=8;

	% Compute the "correct" radius
	r:=54*sind(180/N)/(1+sind(180/N));

	% Define one of the cirlces
	path p;
	p:=fullcircle scaled (2*r);

	% Draw all 8 circles
	for n=0 upto N-1: draw p shifted (r/sind(180/N),0) rotated (360/N*n); endfor;
endfig;
end
