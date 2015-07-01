TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme
DOC_DIR = $(TEXMFHOME)/doc/latex/mtheme
TEMP_DIR = .temptex

INS = mtheme.ins
DEMO_SRC = demo.tex
DEMO_PDF = demo.pdf
DOC_SRC = mtheme.dtx
DOC_PDF = mtheme.pdf
DTX = $(wildcard *.dtx)
STY = $(patsubst %.dtx,%.sty,$(wildcard beamer*.dtx pgfplotsthemetol.dtx))
CTAN_CONTENT = $(INS) $(DTX) $(DOC_PDF)

TEXC := latexmk -xelatex -output-directory=$(TEMP_DIR)

DOCKER_IMAGE = latex-image
DOCKER_CONTAINER = latex-container


.PHONY: sty doc demo ctan clean install uninstall docker-run docker-build docker-rm

all: sty doc demo

$(STY): $(DTX) $(INS)
	@latex $(INS)

$(DEMO_PDF): $(STY) $(DEMO_SRC)
	$(TEXC) $(DEMO_SRC)
	@cp $(TEMP_DIR)/$(DEMO_PDF) .

$(DOC_PDF): $(DOC_SRC) $(DTX)
	@$(TEXC) $(DOC_SRC)
	@cp $(TEMP_DIR)/$(DOC_PDF) .

sty: $(STY)

doc: $(DOC_PDF)

demo: $(DEMO_PDF)

ctan: $(CTAN_CONTENT)
	@mkdir -p mtheme
	@cp $(CTAN_CONTENT) mtheme/
	@zip -q mtheme-$(shell grep -A1 ProvidesPackage < beamerthemem.dtx | grep -P -o '\d\.\d\.\d').zip mtheme/*
	@rm -rf mtheme

clean:
	@git clean -xfd

install: $(STY) $(DOC_PDF)
	@mkdir -p $(INSTALL_DIR)
	@cp $(STY) $(INSTALL_DIR)
	@mkdir -p $(DOC_DIR)
	@cp $(DOC_PDF) $(DOC_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(STY))
	@rm -f $(DOC_DIR)/$(DOC_PDF)
	@rmdir $(INSTALL_DIR)
	@rmdir $(DOC_DIR)

docker-run: docker-build
	docker run --rm=true --name $(DOCKER_CONTAINER) -i -t -v `pwd`:/data $(DOCKER_IMAGE) make

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-rm:
	docker rm $(DOCKER_CONTAINER)
