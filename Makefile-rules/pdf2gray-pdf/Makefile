# Rules.

# .fig -> .eps
#../EPSs/%.eps: %.fig
#	fig2dev -L pstex $*.fig > tmp.eps
#	fig2dev -L pstex_t -f sf -p tmp.eps $< > tmp.tex
#	latex << EOF \
#\\documentclass[portrait,a3,final]{a0poster} \
\\usepackage{epsfig} \
\\usepackage{amsmath} \
\\usepackage{amssymb} \
\\usepackage{color} \
\\usepackage[normalem]{ulem} \
\\usepackage{soul} \
\\begin{document} \
\\sffamily \
\\def\\normalfont{\\sffamily} \
\\renewcommand{\\familydefault}{cmss} \
\\pagestyle{empty} \
\\thispagestyle{empty} \
\\resizebox{1.0\\textwidth}{!}{\\input{tmp}} \
\\end{document} \
EOF
#	mv a0poster.dvi $*.dvi
#	dvips $*.dvi
#	ps2eps --loose < $*.ps > ../EPSs/$*.eps
#	rm $*.ps
#	rm tmp.eps
#	rm $*.dvi
#	rm tmp.tex
#	rm a0poster.aux
#	rm a0poster.log

## .pdf -> (gray).pdf
%-gray.pdf: %.pdf
	gs -sOutputFile=../tmp/$*_gray.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH ../tmp/$*.pdf

# Original files
PDFs := $(wildcard *.pdf)

# Temporal files
#TMPs += $(FIGs:%.fig=../EPSs/%.eps)
#TMPs += $(FIGs:%.fig=../PNGs/%.png)
TMPs += $(PDFs:%.pdf=.%-gray.pdf)
#TMPs += $(FIGs:%.fig=../SVGs/%.svg)
