
## Contributed by Walter Schulze (@awalterschulze)
## Simplified by Dirk Eddelbuettel (@eddelbuettel)

FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
	&& apt-get install -qy \
            gnuplot \
            python-pygments \
        	texlive-full \
            wget

ADD ./getFiraFont.sh ./getFiraFont.sh
RUN ./getFiraFont.sh

WORKDIR /data
VOLUME ["/data"]
