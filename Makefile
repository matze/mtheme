SRC = demo.tex
PDF = demo.pdf
TEXC := xelatex

.PHONY: clean

$(PDF): $(SRC)
	$(TEXC) $(SRC)

clean:
	@rm -f $(PDF)
	@git clean -xf
