#!/bin/sh
set -xe
xelatex -shell-escape demo.tex
bibtex demo.aux
xelatex -shell-escape demo.tex
