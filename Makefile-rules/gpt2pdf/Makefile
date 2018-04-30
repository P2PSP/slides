# Rules

## .gpt -> .pdf
/tmp/%.tex:	%.gpt
	(echo "set terminal cairolatex pdf; set output \"/tmp/$*.tex\"" | cat - $*.gpt) | gnuplot
%.pdf: /tmp/%.tex
	pdflatex << EOF \
\\documentclass{minimal} \
\\usepackage{graphicx} \
\\usepackage{amsmath} \
\\usepackage{amssymb} \
\\usepackage{color} \
\\begin{document} \
\\pagestyle{empty} \
\\thispagestyle{empty} \
\\resizebox{1.0\\textwidth}{!}{\\input{/tmp/$*}} \
\\end{document} \
EOF
	pdfcrop minimal.pdf $*.pdf
	rm minimal.log
	rm minimal.aux
	rm minimal.pdf
#	rm /tmp/$*.pdf

# Original files
GPTs := $(wildcard *.gpt)

# Temporal files
TMPs += $(GPTs:%.gpt=%.pdf)

