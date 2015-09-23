
## Contributed by Walter Schulze (@awalterschulze)
## Simplified by Dirk Eddelbuettel (@eddelbuettel)

FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy texlive-full
RUN apt-get install -qy \
            gnuplot \
            wget \
            build-essential

ADD ./getFiraFont.sh ./getFiraFont.sh
RUN ./getFiraFont.sh

WORKDIR /data
VOLUME ["/data"]
