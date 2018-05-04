# .fig -> .svg
%.svg: %.fig
	fig2dev -L svg $*.fig > $*.svg

# Original files
FIGs := $(wildcard *.fig)

# Temporal files
TMPs += $(FIGs:%.fig=%.svg)

all:	$(TMPs)

info:
	@echo $(TMPs)

clean:
	rm -f $(TMPs)
