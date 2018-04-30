# .tex -> .pdf
%.pdf: %.tex
	pdflatex -jobname $*_ << EOF \
\\documentclass{article} \
\\usepackage[a3paper]{geometry} \
\\usepackage{amsmath} \
\\usepackage{amssymb} \
\\usepackage{color} \
\\usepackage{graphicx} \
\\graphicspath{{../FIGs/}} \
\\DeclareGraphicsExtensions{.pdf} \
\\begin{document} \
\\sffamily \
\\def\\normalfont{\\sffamily} \
\\renewcommand{\\familydefault}{cmss} \
\\pagestyle{empty} \
\\thispagestyle{empty} \
\\resizebox{1.0\\textwidth}{!}{\\input{$*}} \
\\end{document} \
EOF
	pdfcrop $*_.pdf $*.pdf
	rm $*_.pdf
	rm $*_.aux
	rm $*_.log

#../EPSs/%.eps: %.tex
#	latex << EOF \
#\\documentclass{article} \
#\\usepackage{epsfig} \
#\\usepackage{amsmath} \
#\\usepackage{amssymb} \
#\\usepackage{color} \
#\\usepackage{listings} \
#\\begin{document} \
#\\sffamily \
#\\def\\normalfont{\\sffamily} \
#\\renewcommand{\\familydefault}{cmss} \
#\\pagestyle{empty} \
#\\thispagestyle{empty} \
#\\resizebox{1.0\\textwidth}{!}{\\input{$*}} \
#\\end{document} \
#EOF
##	mv article.dvi $*.dvi
##	dvips $*.dvi
##	ps2eps --loose < $*.ps > ../EPSs/$*.eps
##	rm $*.ps
##	rm $*.dvi
##	rm article.aux
##	rm article.log

# Original files
TEXs := $(wildcard *.tex)

# Temporal files
TMPs += $(TEXs:%.tex=%.pdf)
#TMPs += $(TEXs:%.tex=%.pdf)
