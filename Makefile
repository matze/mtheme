INS = mtheme.ins
PYTHON_SRC = contributors.py
DTX = $(wildcard *.dtx)
STY = $(patsubst %.dtx,%.sty,$(wildcard beamer*.dtx))
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme
TEMP_DIR = .temptex

DEMO_SRC = demo.tex
DEMO_PDF = demo.pdf
MANUAL_SRC = mtheme.dtx
MANUAL_PDF = mtheme.pdf
TEXC := latexmk -xelatex -output-directory=$(TEMP_DIR)

DOCKER_IMAGE = latex-image
DOCKER_CONTAINER = latex-container


.PHONY: clean install manual sty docker-run docker-rm


all: sty demo manual

sty: $(DTX) $(INS)
	@latex $(INS)

demo: $(STY) $(DEMO_SRC)
	$(TEXC) $(DEMO_SRC)
	@cp $(TEMP_DIR)/$(DEMO_PDF) .

contributors: $(PYTHON_SRC)
	@python $(PYTHON_SRC)

manual: $(MANUAL_SRC)
	@$(TEXC) $(MANUAL_SRC)
	@cp $(TEMP_DIR)/$(MANUAL_PDF) .

clean:
	@git clean -xfd

install: $(STY)
	@mkdir -p $(INSTALL_DIR)
	@cp $(STY) $(INSTALL_DIR)

docker-run: docker-build
	docker run --rm=true --name $(DOCKER_CONTAINER) -i -t -v `pwd`:/data $(DOCKER_IMAGE) /data/build.sh

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-rm:
	docker rm $(DOCKER_CONTAINER)
