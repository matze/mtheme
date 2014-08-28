SRC = demo.tex
PDF = demo.pdf
AUX = demo.aux
TEXC := xelatex

.PHONY: clean

all: $(PDF)

$(AUX):
	$(TEXC) $(SRC)

$(PDF): $(AUX) $(SRC)
	$(TEXC) $(SRC)

clean:
	@rm -f $(PDF)
	@git clean -xf
