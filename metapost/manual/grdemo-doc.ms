.\" grdemo-doc.ms
.\"
.
.nr PS 11
.nr VS 13
.
.TL
MetaPost with groff
.
.LP
John Hobby's MetaPost program had an \f[I]AT&T troff\/\f[P]interface which
have been changed to use \f[I]GNU troff\/\f[P] instead.
.
.
.SH
Usage
.
.LP
Since MetaPost is a picture-drawing language that outputs PostScript, it is
necessary to use the \f[CW]\%-mpspic\f[P] macro package, which is
automatically included when \f[I]groff\/\f[P](1) is invoked with the
\f[CW]\%-Tps\f[P] option to prepare output for PostScript printers or
previewers.
.
.PP
Suppose you have written some figures in MetaPost and placed the input in a
file \f[CW]\%figures.mp\f[P].
Running
.
.DS I
.ft CW
mp -T figures
.ft
.DE
.
to invoke the MetaPost interpreter produces output files
\f[CW]\%figures.1\f[P], \f[CW]\%figures.2\f[P], \&.\|.\|.
.
.PP
Standalone EPS pictures can be produced from such files by
\f[CW]\%fixgrofffonts\f[P], that fixes comments according to
Adobe Document Structuring Conventions (DSC), embeds
font reencoding commands and non-standard fonts.
.
.DS I
.nf
.ft CW
fixgrofffonts < figures.1 > figures1.eps 
fixgrofffonts < figures.2 > figures2.eps 
\&...
.ft
.fi
.DE
.
.PP
Before these figures can be included into \f[I]groff\/\f[P], they have to
be processed with the \f[CW]\%fixmp\f[P] script:
It adds an encoding vector for all text fonts back to the file (which
MetaPost can't add itself) and changes the Adobe Document Structuring
Conventions (DSC) comments to something \f[I]groff\/\f[P] can handle.
.
.DS I
.nf
.ft CW
fixmp < figures.1 > figures.1ps
fixmp < figures.2 > figures.2ps
\&...
.ft
.fi
.DE
.
Now the converted files can be included in a \f[I]groff\/\f[P] document via
macro calls such as
.
.DS I
.ft CW
\&.PSPIC figures.1ps [width [height]]
.ft
.DE
.
as explained in the \f[I]grops\/\f[P](1) documentation.
Note that the picture gets rescaled if the height and width in the
\f[CW]\%.PSPIC\f[P] command don't match \f[I]mp\/\f[P]'s idea of the
picture dimensions.
.
.
.SH
An example
.
.PSPIC grdemo.1ps
.
.LP
This figure was derived from a file \f[CW]\%grdemo.mp\f[P] and included at
this point by invoking the \f[CW]\%.PSPIC\f[P] macro (omitting the height
and width parameters to avoid rescaling).
.
.PP
The file \f[CW]\%grdemo.mp\f[P] looks like this:
.
.DS I
.nf
.ft CW
.ps 9
.vs 11
verbatimtex
\&.EQ
delim $$
\&.EN
\e# etex

input boxes

beginfig(1);
  pair shadowshift;
  shadowshift = (1, -1) * bp;

  def drawshadowed(text t) =
    forsuffixes $=t:
      fill bpath$ shifted shadowshift;
      unfill bpath$;
      drawboxed($);
    endfor
  enddef;

  boxit.a(btex \e[12] \es8A\es+2 \e[lh] a etex);
  circleit.b(btex $e sup {i omega t}$ etex rotated 20);

  b.w - a.e = (10bp, 0);

  drawshadowed(a, b);
  draw a.e .. b.w;

  label.top(btex \e[Cs] \e[Po] \e[Eu] etex, a.n);
  label.llft(btex \e[Fn] etex, a.s);

  draw bbox currentpicture dashed evenly;
endfig;

end
.ps 11
.vs 13
.ft
.fi
.DE
.
.
.SH
Changing GNU troff pipeline
.PP
Note that, by default, the typesetting commands in the \f[CW]\%btex\f[P]
\&.\|.\|.\& \f[CW]\%etex\f[P] blocks in the above example
are processed by
.
.DS I
.ft CW
eqn -Tps -d\e$\e$ | troff -Tps
.ft
.DE
.
If a different \f[I]troff\/\f[P] pipeline must be used it can be
specified via the \f[CW]\%TROFF\f[P] environment variable.
For \f[I]groff\f[P], the following is recommended:
.
.DS I
.ft CW
TROFF='groff -teZ'
.ft
.DE
.
It adds \f[I]tbl\/\f[P] to the pipeline in addition to \f[I]eqn\f[P],
producing output for \f[I]groff\/\f[P]'s default `ps' device.  Note that
you then have to specify the left and right delimiters of \f[I]eqn\/\f[P]'s
in-line equations within the document (which is good practice anyway).
.
.PP
Macro definitions and such can be added via the standard
\f[CW]\%verbatimtex\f[P] \&.\|.\|.\& \f[CW]\%etex\f[P] mechanism that adds
the given material to the \f[I]troff\/\f[P] input.
Such material should not generate any output since this would get mixed up
with the next \f[CW]\%btex\f[P] .\|.\|.\& \f[CW]\%etex\f[P] block.
Note the comment escape right before the first \f[CW]\%etex\f[P] command in
the above example to avoid an empty line.
.
.\" eof
