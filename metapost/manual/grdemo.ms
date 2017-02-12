.nr PS 11
.nr VS 13
.TL
MetaPost with groff 
.LP
Since MetaPost is a picture-drawing language that outputs PostScript,
it is necessary to use the
.ft CW
-mpspic
.ft
macro package, which is automatically included when \fIgroff\fR 
is invoked with the
.ft CW
-Tps
.ft 
option to prepare output for PostScript printers or previewers.
.PP
Suppose you have written some figures in MetaPost and placed
the input in a file \f(CWfigures.mp\fR.
Running
.nf
.ft CW
             mp -T figures
.ft
.fi
to invoke the MetaPost interpreter produces output files
\f(CWfigures.1\fR, \f(CWfigures.2\fR, .\|.\|. 
which can be included in a \fIgroff\fR document via macro calls 
such as
.nf
.ft CW
            .PSPIC figures.1 width height
.ft
.fi
as explained in the \fIgrops\fR(1) documentation. 
Note that the picture gets rescaled if the height and width
in the \f(CW.PSPIC\fR command don't match \fImp\fR's idea of 
the picture dimensions.
.PP
For instance,
.PSPIC figs.1 1.5i 1.08i
this figure was derived from a file
.ft CW
figs.mp
.ft
and included at this point by invoking the \f(CW.PSPIC\fR macro 
with height 1.08 inches and width 1.5 inches.  
.PP
The file
.ft CW
figs.mp
.ft
looks like this:
.nf
.ft CW
.nr PS 9
.nr VS 11
prologues:=1;
input boxes
beginfig(1);
pair shadowshift; shadowshift=(1,-1)*bp;

def drawshadowed(text t) =
  forsuffixes $=t:
    fill bpath$ shifted shadowshift;
    unfill bpath$;
    drawboxed($);
  endfor
enddef;

boxit.a(btex \\s8A\\s+2 \\(lh a etex);
circleit.b(btex $e sup {i omega t}$ etex rotated 20);
b.w - a.e = (10bp,0);
drawshadowed(a,b);
draw a.e..b.w;

draw bbox currentpicture dashed evenly;
endfig;
.nr PS 11
.nr VS 13
.ft
.fi
.PP
Note that the typesetting commands in the
\f(CWbtex\fR.\|.\|.\f(CWetex\fR blocks in the above example 
are processed by
.nf
.ft CW
             eqn -d\\$\\$ | troff -Tpost
.ft
.fi
If a different \fItroff\fR pipeline is desired, it can be specified 
via the
.ft CW
TROFF
.ft
environment variable.  For example,
.nf
.ft CW
             TROFF='tbl | eqn -d\\$\\$ | troff -Tpost'
.ft
.fi
adds \fItbl\fR to the pipeline in addition to \fIeqn\fR.
.PP
Macro definitions and such can be added via the standard
\f(CWverbatimtex\fR.\|.\|.\f(CWetex\fR mechanism that adds the 
given material to the \fItroff\fR input.  Such material should 
not generate any output since this would get mixed up with the 
next \f(CWbtex\fR.\|.\|.\f(CWetex\fR block.  Thus, newlines between 
\f(CWverbatimtex\fR and \f(CWetex\fR must be protected with \f(CW\\\fR.
.PP
Unfortunately, typesetting of \f(CWbtex\fR.\|.\|.\f(CWetex\fR blocks
currently doesn't work with \fIgroff\fR and equires a UNIX
\fItroff\fR implementation, because MetaPost's \f(CWdmp\fR
post-processor can't handle \fIgroff\fR's extended font and output
file formats documented in \fIgroff_font\fR(5) and \fIgroff_out\fR(5).
Nevertheless, using \fItroff\fR to prepare figures with MetaPost 
and \fIgroff\fR to typeset them may still be a useful combination 
if your \fItroff\fR implementation doesn't provide the
.ft CW
-mpictures
.ft 
macro packages.

