# Ojo, este Makefile siempre es incluido en otro. De ah'i que los includes
# sean tan raros.

include ../../Makefile-rules/fig2pdf/Makefile
include ../../Makefile-rules/gpt2pdf/Makefile
#include ../../Makefile-rules/pdf2gray-pdf/Makefile
include ../../Makefile-rules/pdf2svg/Makefile
#include ../../Makefile-rules/svg2png/Makefile
include ../../Makefile-rules/tex2pdf/Makefile
include ../../Makefile-rules/txt2svg/Makefile
include ../../Makefile-rules/copy/Makefile

.PHONY:		default
default:
	make $(TMPs)

info:
	@echo $(TMPs)
	
clean:
	rm -f $(TMPs)
