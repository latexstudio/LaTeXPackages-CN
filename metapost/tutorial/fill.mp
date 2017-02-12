if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
	% Set unit size to 72bp = 1in
	u:=72;
	
	% Define path
	path p;
	p:=(0,0){right}..{dir 45}(3*u/4,u/4){dir 45}..{up}(u,u)--cycle;
	
	% Fill the path
	fill p withcolor red;

	% Draw the path
	draw p;
endfig;
end
