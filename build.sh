#!/bin/sh
set -xe
xelatex mtheme.ins
xelatex -shell-escape demo.tex
xelatex -shell-escape demo.tex
