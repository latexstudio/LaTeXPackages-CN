verbatimtex
  \def\appl#1{\applfontx#1\strut}
  \def\ext#1{\extfontx#1\strut}
  \font\applfontx=ec-lmri10
  \font\extfontx=ec-lmtt10
  \font\extfontvii=ec-lmtt8 at 7pt
etex

% Use the boxes package for drawing charts.
input boxes
input charts
%prologues:=3;

if scantokens(mpversion) < 1.200:
  filenametemplate
else:
  outputtemplate :=
fi
"%j-%c.mps";


beginfig(1);
  interim applwidth := 72bp;
  interim applheight := 28bp;
  interim extwidth := 48bp;
  interim extheight := 28bp;
  interim rowscale := 56bp;
  interim colscale := 100bp;
  interim ahangle := 30;

% Build and draw boxes.
  ext_rc(fig.mp, (0,0), btex \ext{fig.mp} etex);
  appl_rc(mpost, (1,0), btex \appl{MetaPost} etex);
  ext_rc(fig.1, (2,0), btex \ext{fig.1} etex);
  ext_rc(doc.tex, (0,2), btex \ext{doc.tex} etex);
  appl_rc(tex, (1,2), btex \appl{\TeX} etex);
  ext_rc(doc.dvi, (2,2), btex \ext{doc.dvi} etex);
  appl_rc(dvips, (3,1), btex \appl{dvips} etex);
  ext_rc(doc.ps, (4,1), btex \ext{doc.ps} etex);

% Draw connections.
  line(fig.mp, mpost);
  line(mpost, fig.1);
  line(doc.tex, tex);
  line(tex, doc.dvi);
  curve(fig.1, dvips, -90, 0);
  curve(doc.dvi, dvips, -90, 180);
  line(dvips, doc.ps);

% Draw bounding box link.
  boxit.bb(btex
    \vbox{
      \hbox to 50bp {\hfil\strut bounding\hfil}
      \hbox to 50bp {\hfil\strut box\hfil}
    }
    etex scaled .8);
  path p;
  p := fig.1.e{right}..{right}tex.w;
  bb.c = point 0.5 of p;
  drawunboxed(bb);
  draw p cutafter bpath bb dashed evenly;
  drawarrow p cutbefore subpath (1,3) of bpath bb dashed evenly;
endfig;


verbatimtex
  \font\applfontx=ec-lmbxi10
etex

beginfig(2);
% Pre-define workflow segment parameters.
  wfsegments := 6;% counter
  wfsegangle = 360/wfsegments;% angle
  wfstart := 90;% angle
  wfdiam := 200bp;% dimension
  wfthick := 48bp;% dimension
  wfgap := 8;% angle
  wfinset := 8;% angle

% Pre-define colors of some graphic elements.
  color wf_col, appl_col, ext_col;
  wf_col = .9white;
  appl_col = (.1, .1, .7);
  ext_col = 0white;

% The size of the user icon.
  usersize := 20bp;

% Construct a workflow segment.
%
% * The anchor point of a workflow segment is at its center.
%
% * Array wfang[] stores the angle on a circle corresponding
%   to a vertex of a workflow segment.  The mapping of indices
%   to vertices is:
%
%     2---------0
%    /         /
%   3         1
%    \         \
%     2---------0
%
% * For array wfscale[] the mapping is:
%
%     3---------0
%    /         /
%   <         <
%    \         \
%     2---------1
%
  numeric wfang[], wfscale[];
  path wfseg;
  wfang0 = .5(-wfsegangle + wfgap - wfinset);
  wfang1 = .5(-wfsegangle + wfgap + wfinset);
  wfang2 = .5( wfsegangle - wfgap - wfinset);
  wfang3 = .5( wfsegangle - wfgap + wfinset);
  wfscale[0] = 1 + wfthick/wfdiam;
  wfscale[1] = 1 - wfthick/wfdiam;
  wfscale[2] = 1 - 1.0*wfthick/wfdiam;
  wfscale[3] = 1 + 1.0*wfthick/wfdiam;
  wfseg :=              0.5dir(wfang0)*wfscale0 {dir(wfang0-180)}
    ..{dir(wfang1+135)} 0.5dir(wfang1)          {dir(wfang1-135)}
    ..{dir(wfang0+180)} 0.5dir(wfang0)*wfscale1 {dir(wfang0+90)}
    ..{dir(wfang2+90)}  0.5dir(wfang2)*wfscale2 {dir(wfang2)}
    ..{dir(wfang3+45)}  0.5dir(wfang3)          {dir(wfang3-45)}
    ..{dir(wfang2)}     0.5dir(wfang2)*wfscale3 {dir(wfang2-90)}
    ..{dir(wfang0-90)}  cycle;

% Store user icon in picture variable.
  picture unituserLeft, unituserRight;
  unituserRight := image(
% This clip-art has been taken from the Open Clip-Art Library at
% <URL:http://www.openclipart.org/about>.  The original SVG file by
% 'yyycatch' is licensed as Public Domain and can be found at
% <URL:http://www.openclipart.org/detail/18601>.  It has been
% converted to MetaPost by exporting the SVG file to EPS in Inkscape
% and then coordinates, colours and pens have been manually translated
% to the corresponding MetaPost commands.
    path p[];
    p1 =
      (39.387, 60.034) .. controls (17.117, 59.401) and (-0.352, 22.932)
      .. (7.887, 10.565) .. controls (16.125, -1.802) and (64.465, -1.802)
      .. (72.34, 10.565) .. controls (80.215, 22.932) and (62.383, 60.686)
      .. cycle;
    p2 =
      (22.809, 52.588)
      -- (59.93, 52.588) .. controls (59.93, 52.588) and (60.523, 15.705)
      .. (47.293, 15.705) .. controls (34.852, 15.705) and (22.809, 52.588)
      .. cycle;
    p3 =
      (69.125, 67.963) .. controls (69.125, 50.881) and (56.723, 37.037)
      .. (41.422, 37.037) .. controls (26.125, 37.037) and (13.723, 50.881)
      .. (13.723, 67.963) .. controls (13.723, 85.045) and (26.125, 98.893)
      .. (41.422, 98.893) .. controls (56.633, 98.893) and (69, 85.198)
      .. cycle;
    p4 =
      (31.047, 76.764) .. controls (31.047, 76.764) and (43.93, 63.147)
      .. (57.152, 64.209) .. controls (70.398, 65.276) and (79.316, 71.444)
      .. (79.316, 71.444) .. controls (79.316, 71.444) and (72.488, 108.674)
      .. (41.977, 109.291) .. controls (18.086, 109.791) and (6.324, 86.862)
      .. (2.84, 71.444) .. controls (-0.691, 55.83) and (4.152, 55.889)
      .. (9.313, 57.221) .. controls (14.477, 58.549) and (31.047, 76.764)
      .. cycle;
    p5 =
      (84.211, 30.416) .. controls (87.586, 25.877) and (85.977, 18.955)
      .. (80.617, 14.967) .. controls (75.258, 10.979) and (68.164, 11.428)
      .. (64.785, 15.971)
      -- (64.734, 16.037) .. controls (62.766, 18.741) and (62.41, 30.342)
      .. (65.918, 32.764) .. controls (69.781, 35.428) and (80.832, 34.955)
      .. cycle;
    interim linecap := butt;
    interim linejoin := mitered;
    fill p1 withcolor (1, 0.501961, 0.501961);
    draw p1 withcolor 0.219608 withpen pencircle scaled 2.577288;
    fill p2 withcolor 1;
    draw p2 withcolor 0.219608 withpen pencircle scaled 2.782928;
    fill p3 withcolor (1, 0.8, 0.666667);
    draw p3 withcolor 0.219608 withpen pencircle scaled 3.31912;
    fill p4 withcolor (0.827451, 0.552941, 0.372549);
    draw p4 withcolor 0.219608 withpen pencircle scaled 3.262816;
    fill p5 withcolor (1, 0.8, 0.666667);
    draw p5 withcolor 0.219608 withpen pencircle scaled 2.4;
  );
% Normalize user icon.
  unituserRight := unituserRight shifted (-llcorner unituserRight -.5urcorner unituserRight);
  unituserRight := unituserRight scaled (.5/ypart urcorner unituserRight);
  unituserLeft := unituserRight reflectedabout ((0,0), (0,1));

% Helper function: transform location on workflow circle in
% degrees into cartesian coordinates.
  def degtoxy(expr deg) =
    (point deg/45 of fullcircle scaled wfdiam)
  enddef;

% Draw workflow segments.
  for i=0 upto wfsegments-1:
    fill wfseg scaled wfdiam rotated (wfstart+i*wfsegangle) withcolor wf_col;
  endfor

% Fill-in workflow segment descriptions.
  label(unituserLeft scaled usersize, degtoxy(wfstart+wfsegangle*0));
  label(btex \appl{Editor} etex, degtoxy(wfstart+wfsegangle*1)) withcolor appl_col;
  label(btex \ext{fig.mp} etex, degtoxy(wfstart+wfsegangle*2)) withcolor ext_col;
  label(btex \appl{MetaPost} etex, degtoxy(wfstart+wfsegangle*3)) withcolor appl_col;
  label(btex \ext{fig.1} etex, degtoxy(wfstart+wfsegangle*4+wfsegangle/7)) withcolor ext_col;
  label(btex \ext{fig.log} etex, degtoxy(wfstart+wfsegangle*4-wfsegangle/7)) withcolor .7[ext_col, wf_col];
  label(btex \appl{Previewer} etex, degtoxy(wfstart+wfsegangle*5)) withcolor appl_col;
endfig;

end
