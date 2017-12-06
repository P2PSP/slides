full.tpl:	~/.pyenv/versions/3.6.3/lib/python3.6/site-packages/nbconvert/templates/html/full.tpl
	cp ~/.pyenv/versions/3.6.3/lib/python3.6/site-packages/nbconvert/templates/html/full.tpl .

slides_slides:
	jupyter nbconvert slides.ipynb --to slides --template full.tpl --post serve --ServePostProcessor.port=8001 --SlidesExporter.reveal_scroll=True --SlidesExporter.reveal_theme=simple
