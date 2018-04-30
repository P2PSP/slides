# svg2png Makefile

%.png:	%.svg
#	echo Building `pwd`/$@
	convert -density 100 $*.svg $*.png
#	pdf2svg ../PDFs/$*.pdf $*.svg


SVGs := $(wildcard *.svg)
TMPs += $(SVGs:%.svg=%.png)

