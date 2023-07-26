TEXFLAGS=-file-line-error -halt-on-error #-interaction=batchmode
TEX=pdflatex $(TEXFLAGS)
BIB=bibtex
CHAPTER_SOURCES=chapter/*.tex
APPENDIX_SOURCES=appendix/*.tex

all: thesis.pdf

thesis.pdf: thesis.tex $(CHAPTER_SOURCES) $(APPENDIX_SOURCES)
	$(TEX) thesis.tex
	$(TEX) thesis.tex
	$(BIB) thesis.aux
	$(TEX) thesis.tex
	mv *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot aux/

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.pdf
