% Support package for drawing charts.

def _drawNode = drawboxed enddef;

%%% These paramaters determine the size of nodes and the grid distance.
newinternal applwidth; applwidth := 30bp;
newinternal applheight; applheight := 14bp;
newinternal extwidth; extwidth := 30bp;
newinternal extheight; extheight := 14bp;
newinternal rowscale; rowscale := 100bp;
newinternal colscale; colscale := 100bp;

%%% This macro builds and draws a rectangular node at a given location
%%% with text indicating an application.
%% @param i  Node suffix.
%% @param row  Row.
%% @param col  Column.
%% @param text  The text to render in the box node.
def appl(suffix i)(expr coor)(text t) =
  boxit.i(t);
	i.c = coor;
  i.e = i.c + .5applwidth*right;
  i.n = i.c + .5applheight*up;
  _drawNode(i);
enddef;


%%% This macro builds and draws an oval node at a given location with
%%% text indicating a file name extension.
%% @param i  Node suffix.
%% @param row  Row.
%% @param col  Column.
%% @param text  The text to render in the oval node.
def ext(suffix i)(expr coor)(text t) =
  circleit.i(t);
	i.c = coor;
  i.e = i.c + .5extwidth*right;
  i.n = i.c + .5extheight*up;
  _drawNode(i);
enddef;


%%% This macro builds and draws a rectangular node at a given location
%%% with text indicating an application.
%% @param i  Node suffix.
%% @param row  Row.
%% @param col  Column.
%% @param text  The text to render in the box node.
def appl_rc(suffix i)(expr coor)(text t) =
  boxit.i(t);
	i.c = (colscale * ypart coor, -rowscale * xpart coor);
  i.e = i.c + .5applwidth*right;
  i.n = i.c + .5applheight*up;
  _drawNode(i);
enddef;


%%% This macro builds and draws an oval node at a given location with
%%% text indicating a file name extension.
%% @param i  Node suffix.
%% @param row  Row.
%% @param col  Column.
%% @param text  The text to render in the oval node.
def ext_rc(suffix i)(expr coor)(text t) =
  circleit.i(t);
	i.c = (colscale * ypart coor, -rowscale * xpart coor);
  i.e = i.c + .5extwidth*right;
  i.n = i.c + .5extheight*up;
  _drawNode(i);
enddef;


%%% This macro draws a straight arrow between two nodes.  Arrow length
%%% is corrected for the pen width, so that the arrow doesn't sink into
%%% the frame of the target node.  If pen width is changed, the code
%%% "0.5bp" has to be replaced by half of the new pen width.
%% @param a  Source node.
%% @param b  Target node.
def line(suffix a,b) =
	begingroup
		save p;path p;
		p := a.c--b.c cutbefore bpath(a) cutafter bpath(b);
		drawarrow subpath (0, arctime (arclength p - 0.5bp) of p) of p;
	endgroup
enddef;


%%% This macro draws a curved arrow between two nodes with determined
%%% leaving and entering angles.  Arrow length is corrected for the pen
%%% width so that the arrow doesn't sink into the frame of the target
%%% node.  If pen width is changed, the code "0.5bp" has to be replaced
%%% by half of the new pen width.
%% @param a  Source node.
%% @param b  Target node.
%% @param anga  Leaving angle at (center of) node a.
%% @param angb  Entering angle at (center of) node b.
def curve(suffix a,b)(expr anga,angb) =
	begingroup
		save p;path p;
		p := a.c{dir anga}..{dir angb}b.c cutbefore bpath(a) cutafter bpath(b);
		drawarrow subpath (0, arctime (arclength p - 0.5bp) of p) of p;
	endgroup
enddef;


%%% This macro draws a curved arrow between two nodes with determined
%%% leaving and entering angles offset.  Arrow length is corrected for
%%% the pen width so that the arrow doesn't sink into the frame of the
%%% target node.  If pen width is changed, the code "0.5bp" has to be
%%% replaced by half of the new pen width.
%% @param a  Source node.
%% @param b  Target node.
%% @param angr  Offset to entering and leaving angles at nodes a and b.
def curve_rel(suffix a,b)(expr angr) =
	begingroup
		save alpha;
		alpha = angle(b.c-a.c);
		curve(a, b, alpha+angr, alpha-angr);
	endgroup
enddef;
