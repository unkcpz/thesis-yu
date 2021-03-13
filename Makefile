###############################################################################
#
# 	Makefile for scutthesis
#
# 	Copyright (C) 2021-2021 Jusong Yu,
#   Department of Physics, South China University of Technology.
#
# 	Copyright (C) 2013-2015 Haixing Hu,
#   Department of Computer Science and Technology, Nanjing University.
#
#	Home Page of the Project: https://github.com/unkcpz/scut-thesis
# Project fork and modified from: http://haixing-hu.github.io/nju-thesis/
#
###############################################################################

PACKAGE=scutthesis
BST_FILE=gbt7714-2005.bst
BST_URL=https://raw.githubusercontent.com/Haixing-Hu/GBT7714-2005-BibTeX-Style/master/gbt7714-2005.bst
SOURCES=$(PACKAGE).dtx $(PACKAGE).ins
CLS=$(PACKAGE).cls $(PACKAGE).cfg dtx-style.sty
MAIN=main
CONTENTS=$(MAIN).tex
BIB=$(MAIN).bib
INSTITUTE_LOGO=scutlogo.eps
TEXMFLOCAL=$(shell sh get_texmf_dir.sh)

.PHONY: all clean main

all: main

###### for main

main:	 $(MAIN).pdf

$(MAIN).pdf: $(CLS) $(INSTITUTE_LOGO) $(BST_FILE) $(MAIN).tex $(BIB)
	xelatex $(MAIN).tex
	bibtex $(MAIN)
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex

###### clean

clean:
	-@rm -f \
		*.pdf \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
