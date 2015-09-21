INS         = source/beamerthemem.ins
PACKAGE_SRC = $(wildcard source/*.dtx)
PACKAGE_STY = $(notdir $(PACKAGE_SRC:%.dtx=%.sty))
DEMO_SRC    = demo/demo.tex demo/demo.bib
DEMO_PDF    = demo/demo.pdf
DOC_SRC     = doc/metropolistheme.dtx
DOC_PDF     = doc/metropolistheme.pdf

CTAN_CONTENT = $(INS) $(DTX) $(DOC_PDF)

TEXMFHOME   = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme
DOC_DIR     = $(TEXMFHOME)/doc/latex/mtheme
TEMP_DIR    = $(shell pwd)/.latex-cache

DOCKER_IMAGE = latex-image
DOCKER_CONTAINER = latex-container

COMPILE_TEX := TEXINPUTS=".//:$$TEXINPUTS" latexmk -xelatex -output-directory=$(TEMP_DIR)


.PHONY: all clean sty doc demo install uninstall ctan docker-run docker-build docker-rm

all: sty doc

clean:
	@rm -f $(TEMP_DIR)/*
	@rm -f $(PACKAGE_STY)

sty: $(PACKAGE_STY)

doc: $(DOC_PDF)

demo: $(DEMO_PDF)

install: $(PACKAGE_STY) $(DOC_PDF)
	@mkdir -p $(INSTALL_DIR)
	@cp $(PACKAGE_STY) $(INSTALL_DIR)
	@mkdir -p $(DOC_DIR)
	@cp $(DOC_PDF) $(DOC_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_STY))
	@rmdir $(INSTALL_DIR)
	@rm -f $(DOC_DIR)/$(DOC_PDF)
	@rmdir $(DOC_DIR)

ctan: $(CTAN_CONTENT)
	@mkdir -p mtheme
	@cp $(CTAN_CONTENT) mtheme/
	@zip -q mtheme-$(shell grep -A1 ProvidesPackage < beamerthemem.dtx | grep -P -o '\d\.\d\.\d').zip mtheme/*
	@rm -rf mtheme

$(TEMP_DIR):
	@mkdir -p $(TEMP_DIR)

$(PACKAGE_STY): $(PACKAGE_SRC) $(INS) | $(TEMP_DIR)
	@cd $(dir $(INS)) && latex -output-directory=$(TEMP_DIR) $(notdir $(INS))
	@cp $(addprefix $(TEMP_DIR)/,$(PACKAGE_STY)) .

$(DOC_PDF): $(DOC_SRC) $(PACKAGE_STY) | $(TEMP_DIR)
	@$(COMPILE_TEX) $(DOC_SRC)
	@cp $(TEMP_DIR)/$(notdir $(DOC_PDF)) $(DOC_PDF)

$(DEMO_PDF): $(DEMO_SRC) $(PACKAGE_STY) | $(TEMP_DIR)
	$(COMPILE_TEX) $(DEMO_SRC)
	@cp $(TEMP_DIR)/$(notdir $(DEMO_PDF)) $(DEMO_PDF)

docker-run: docker-build
	docker run --rm=true --name $(DOCKER_CONTAINER) -i -t -v `pwd`:/data $(DOCKER_IMAGE) make

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-rm:
	docker rm $(DOCKER_CONTAINER)
