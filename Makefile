SRC = demo.tex
PDF = demo.pdf
AUX = demo.aux
TEXC := xelatex
TEXC_OPTS += -shell-escape

.PHONY: clean

all: $(PDF)

$(AUX):
	$(TEXC) $(SRC)

$(PDF): $(AUX) $(SRC)
	$(TEXC) $(TEXC_OPTS) $(SRC)

clean:
	@rm -f $(PDF)
	@git clean -xf
