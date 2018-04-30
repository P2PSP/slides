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

## .fig -> .pdf
%.pdf: %.fig
	fig2dev -L pstex $*.fig > tmp.eps
	fig2dev -L pstex_t -f sf -p tmp.eps $< > tmp.tex
	latex << EOF \
\\documentclass[portrait,a3,final]{a0poster} \
\\usepackage{epsfig} \
\\usepackage{amsmath} \
\\usepackage{amssymb} \
\\usepackage{color} \
\\begin{document} \
\\pagestyle{empty} \
\\thispagestyle{empty} \
\\resizebox{1.0\\textwidth}{!}{\\input{tmp}} \
\\end{document} \
EOF
	mv a0poster.dvi $*.dvi
	dvips $*.dvi -o $*.ps
	ps2eps --loose < $*.ps > /tmp/$*.eps
	epstopdf /tmp/$*.eps
	mv /tmp/$*.pdf $*.pdf
	rm $*.ps
	rm tmp.eps
	rm $*.dvi
	#rm $*.eps
	rm tmp.tex
	rm a0poster.aux
	rm a0poster.log

# Original files
FIGs := $(wildcard *.fig)

# Temporal files
#TMPs += $(FIGs:%.fig=../EPSs/%.eps)
#TMPs += $(FIGs:%.fig=../PNGs/%.png)
TMPs += $(FIGs:%.fig=%.pdf)
#TMPs += $(FIGs:%.fig=../SVGs/%.svg)

