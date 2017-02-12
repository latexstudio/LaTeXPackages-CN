MAKE=make
MPOST=mpost
LTX=latex
DVIPS=dvips
PDFLTX=pdflatex
BIB=bibtex

SRC=mpintro.ltx
INCL=$(wildcard *.tex)
MYBIB=mpintro.bib
MPMPS=annulus-1.mps annulus-2.mps annulus-3.mps circles.mps data.mps draw-1.mps draw-2.mps fill.mps label-1.mps label-2.mps paperclip.mps parabola.mps
MP=$(patsubst %,%.mp,$(patsubst %.mps,%,$(filter-out -%,$(subst -, -,$(MPMPS)))))
MPLOG=$(patsubst %.mp,%.log,$(MP))
MPMPX=$(patsubst %.mp,%.mpx,$(MP))
RASTEPS=previewer.eps
RASTPDF=previewer.pdf

BASE=$(patsubst %.ltx,%,$(SRC))
DVI=$(BASE).dvi
PDF=$(BASE).pdf
PS=$(BASE).ps

.PHONY: clean distclean

pdf:
	$(MAKE) $(PDF)

ps:
	$(MAKE) $(PS)

all: pdf ps

$(DVI): $(SRC) $(MYBIB) $(INCL) $(MPMPS) $(RASTEPS)
	$(LTX) $<
	$(BIB) $(BASE)
	$(LTX) $<
	$(LTX) $<

$(PDF): $(SRC) $(MYBIB) $(INCL) $(MPMPS) $(RASTPDF)
	$(PDFLTX) $<
	$(BIB) $(BASE)
	$(PDFLTX) $<
	$(PDFLTX) $<

$(PS): $(DVI)
	$(DVIPS) -o $@ $<

$(RASTEPS): $(patsubst %.eps,%.png,$(RASTEPS))
	sam2p $< EPS: $@

$(RASTPDF): $(patsubst %.pdf,%.png,$(RASTPDF))
	sam2p $< PDF: $@

%.mps: %.mp
	$(MPOST) $<

%.mps:: $(patsubst %,%.mp,$(patsubst %.pdf,%,$(filter-out -%,$(subst -, -,$(MPPDF)))))
	$(MPOST) $(patsubst %,%.mp,$(patsubst %.pdf,%,$(filter-out -%,$(subst -, -,$@))))

clean:
	rm -f $(MPLOG) $(MPMPX) $(MPPDF) texnum.mpx
	rm -f $(BASE).aux $(BASE).bbl $(BASE).blg $(BASE).log $(BASE).out

distclean:
	$(MAKE) clean
	rm -f $(DVI) $(PS) $(PDF) $(MPMPS) $(RASTPDF) $(RASTEPS)
