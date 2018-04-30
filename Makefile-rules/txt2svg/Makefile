# This uses https://bitbucket.org/dhobsd/asciitosvg.  hg clone
# https://bitbucket.org/dhobsd/asciitosvg; git clone
# https://github.com/wez/lemon-php.git; cd lemon-php; cc -o
# lemon lemon.c; cd ..; git clone
# https://github.com/wez/JLexPHP.git; cd JLexPHP/; make #
# "openjdk" is needed (sudo pacman -S jdk8-openjdk; sudo
# archlinux-java set java-8-openjdk); cd ..; ln -s JLexPHP/
# jlexphp; cd asciitosvg; make # php5-cli (Ubuntu) / php
# (Arch) is needed; cp a2s ASCIIToSVG.php ~/bin; export
# PATH=~/bin:$PATH


# .txt -> ./.svg
%.svg: %.txt
	@sed -e 's/\([^ ]\)$$/\1 /g' -e :a -e '/^\n*$$/{$$d;N;};/\n$$/ba' $< > $<.improved
	echo >> $<.improved
	@mv $<.improved $<
	~/bin/a2s -i$< -o$@

TXTs += $(wildcard *.txt)
TMPs += $(TXTs:%.txt=%.svg)
