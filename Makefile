INS = mtheme.ins
DTX = $(wildcard *.dtx)
STY = $(patsubst %.dtx,%.sty,$(wildcard beamer*.dtx))
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme

SRC = demo.tex
PDF = demo.pdf
AUX = demo.aux
TEXC := xelatex
TEXC_OPTS += -shell-escape
DOCKER_IMAGE = latex-image
DOCKER_CONTAINER = latex-container

.PHONY: clean install docker-run docker-rm

all: $(PDF)

$(AUX):
	$(TEXC) $(TEXC_OPTS) $(SRC)

$(PDF): beamerthemem.sty $(AUX) $(SRC)
	$(TEXC) $(TEXC_OPTS) $(SRC)

sty: $(DTX) $(INS)
	@latex $(INS)

manual:
	@mkdir -p .temptex
	@xelatex -shell-escape -output-directory .temptex mtheme.dtx
	@xelatex -shell-escape -output-directory .temptex mtheme.dtx
	@cp .temptex/mtheme.pdf .

clean:
	@rm -f $(PDF)
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
