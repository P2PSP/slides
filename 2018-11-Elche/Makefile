default:	publish

publish:	index.html snapshot.png

include $(HOME)/LaTeX_templates/Makefile

index.html:	$(HOME)/LaTeX_templates $(HOME)/bibs *.tex graphics/*.fig graphics/*.png

#$(HOME)/LaTeX_templates:
#	git clone https://github.com/vicente-gonzalez-ruiz/LaTeX_templates.git $(HOME)/LaTeX_templates

$(HOME)/bibs:
	git clone git@gitlab.hpca.ual.es:vruiz/bibs.git $(HOME)/bibs

snapshot.png:	index.html
	phantomjs ../rasterize.js index.html snapshot.png 800px*600px
