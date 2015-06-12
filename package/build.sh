#!/bin/sh

mkdir -p .temptex
xelatex -shell-escape -output-directory .temptex mtheme.dtx
pythontex .temptex/mtheme.dtx
xelatex -shell-escape -output-directory .temptex mtheme.dtx
cp .temptex/mtheme.pdf ./mtheme.pdf
