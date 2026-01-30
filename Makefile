.PHONY: default build open clean notes

LATEX=pdflatex

default: build open
build: beamer.pdf

beamer.pdf: *.tex
	$(LATEX) beamer.tex -o beamer.pdf
	biber beamer
	$(LATEX) beamer.tex -o beamer.pdf

open: beamer.pdf
	evince beamer.pdf || open beamer.pdf

VortragsNotizen.pdf: VortragsNotizen.md
	pandoc -o VortragsNotizen.pdf VortragsNotizen.md

notes: VortragsNotizen.pdf

onotes: notes
	evince VortragsNotizen.pdf || open VortragsNotizen.pdf
