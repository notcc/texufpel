LATEX = pdflatex --interaction=batchmode
BIBTEX = bibtex
RM = rm -f
FILE = exemplo-tese-proposta

all:	
		$(LATEX) $(FILE)
		$(BIBTEX) $(FILE)
		$(LATEX) $(FILE)
		$(LATEX) $(FILE)
		@echo ---------------------------------------------------
		@echo Ps: done.

clean:	
		$(RM) $(FILE).aux $(FILE).log $(FILE).out $(FILE).ps $(FILE).pdf $(FILE).toc $(FILE).dvi $(FILE).lof $(FILE).bbl $(FILE).lot $(FILE).blg *~ *backup
		@echo ---------------------------------------------------
		@echo Directory cleaned
