# .pdf -> ./.svg
%.svg: %.pdf
#	echo Building `pwd`/$@
#	convert -density 150 $*.pdf $*.png
	pdf2svg $*.pdf $*.svg


PDFs += $(wildcard *.pdf)
TMPs += $(PDFs:%.pdf=%.svg)

