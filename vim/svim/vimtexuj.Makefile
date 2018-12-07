# This file is called by vim when making pdf or dvi from tex.

# default
CC=tex_analyze

# TEXFILE must come from caller
TEXFILE=

dvi: $(TEXFILE).dvi

$(TEXFILE).dvi: $(TEXFILE).tex
	$(CC) DVI $(TEXFILE).tex

pdf: $(TEXFILE).pdf

$(TEXFILE).pdf: $(TEXFILE).tex
	$(CC) PDF $(TEXFILE).tex

