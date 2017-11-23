include ../Makefile-rules/svg2png/Makefile

logop2psp.png:	logop2psp.svg

thanks.png:	thanks.fig ceia3.jpg feder.png gobierno.jpg gsoc2015-300x270.jpg junta.png logoluxundafondoblanco.png logop2psp.png SAL-logo.png
		fig2dev -L png thanks.fig > thanks.png

default:	thanks.png

clean:
		rm -r thanks.png
