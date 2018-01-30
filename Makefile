default:	full

publish:	snapshot.png

full.tpl:	~/.pyenv/versions/3.6.3/lib/python3.6/site-packages/nbconvert/templates/html/full.tpl
	cp ~/.pyenv/versions/3.6.3/lib/python3.6/site-packages/nbconvert/templates/html/full.tpl .

full:
	jupyter nbconvert slides.ipynb --to slides --template full.tpl --post serve --ServePostProcessor.port=8010 --SlidesExporter.reveal_scroll=True --SlidesExporter.reveal_theme=simple 

reveal:
	jupyter nbconvert slides.ipynb --to slides --post serve --ServePostProcessor.port=8010 --SlidesExporter.reveal_scroll=True --SlidesExporter.reveal_theme=simple 

index.html:
	jupyter nbconvert slides.ipynb --to slides --SlidesExporter.reveal_theme=simple --SlidesExporter.reveal_url_prefix=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.5.0/
	mv slides.slides.html index.html

snapshot.png:	index.html
	phantomjs ../rasterize.js index.html snapshot.png 400px*300px
