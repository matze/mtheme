INS         = source/beamerthemem.ins
PACKAGE_SRC = $(wildcard source/*.dtx)
PACKAGE_STY = $(notdir $(PACKAGE_SRC:%.dtx=%.sty))
DEMO_SRC    = demo/demo.tex demo/demo.bib
DEMO_PDF    = demo/demo.pdf
DOC_SRC     = doc/metropolistheme.dtx
DOC_PDF     = doc/metropolistheme.pdf

CTAN_CONTENT = $(INS) $(PACKAGE_SRC) $(DOC_PDF)

TEXMFHOME   = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme
DOC_DIR     = $(TEXMFHOME)/doc/latex/mtheme
CACHE_DIR   := $(shell pwd)/.latex-cache

COMPILE_TEX := latexmk -xelatex -output-directory=$(CACHE_DIR)
export TEXINPUTS:=$(shell pwd):$(shell pwd)/source:${TEXINPUTS}

DOCKER_IMAGE = latex-image
DOCKER_CONTAINER = latex-container

.PHONY: all sty doc demo clean install uninstall ctan clean-cache clean-sty ctan-version docker-run docker-build docker-rm

all: sty doc

sty: $(PACKAGE_STY)

doc: $(DOC_PDF)

demo: $(DEMO_PDF)

clean: clean-cache clean-sty

install: $(PACKAGE_STY) $(DOC_PDF)
	@mkdir -p $(INSTALL_DIR)
	@cp $(PACKAGE_STY) $(INSTALL_DIR)
	@mkdir -p $(DOC_DIR)
	@cp $(DOC_PDF) $(DOC_DIR)

uninstall:
	@rm -f $(addprefix $(INSTALL_DIR)/, $(PACKAGE_STY))
	@rmdir $(INSTALL_DIR)
	@rm -f $(DOC_DIR)/$(notdir $(DOC_PDF))
	@rmdir $(DOC_DIR)

ctan: $(CTAN_CONTENT) ctan-version
	@zip mtheme-$(shell date "+%Y-%m-%d").zip $(CTAN_CONTENT)

clean-cache:
	@rm -f $(CACHE_DIR)/*

clean-sty:
	@rm -f $(PACKAGE_STY)

ctan-version:
	@sed -i '' -- 's@\(ProvidesPackage.*\[\)[0-9/]*@\1$(shell date "+%Y/%m/%d")@' $(PACKAGE_SRC)

$(CACHE_DIR):
	@mkdir -p $(CACHE_DIR)

$(PACKAGE_STY): $(PACKAGE_SRC) $(INS) | $(CACHE_DIR) clean-cache
	@cd $(dir $(INS)) && latex -output-directory=$(CACHE_DIR) $(notdir $(INS))
	@cp $(addprefix $(CACHE_DIR)/,$(PACKAGE_STY)) .

$(DOC_PDF): $(DOC_SRC) $(PACKAGE_STY) | $(CACHE_DIR) clean-cache
	@cd $(dir $(DOC_SRC)) && $(COMPILE_TEX) $(notdir $(DOC_SRC))
	@cp $(CACHE_DIR)/$(notdir $(DOC_PDF)) $(DOC_PDF)

$(DEMO_PDF): $(DEMO_SRC) $(PACKAGE_STY) | $(CACHE_DIR) clean-cache
	@cd $(dir $(DEMO_SRC)) && $(COMPILE_TEX) $(notdir $(DEMO_SRC))
	@cp $(CACHE_DIR)/$(notdir $(DEMO_PDF)) $(DEMO_PDF)

docker-run: docker-build
	docker run --rm=true --name $(DOCKER_CONTAINER) -i -t -v `pwd`:/data $(DOCKER_IMAGE) make

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-rm:
	docker rm $(DOCKER_CONTAINER)
