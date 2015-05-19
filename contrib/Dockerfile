
## Contributed by Walter Schulze (@awalterschulze)
## Simpliefied by Dirk Eddelbuettel (@eddelbuettel)

FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
	&& apt-get install -qy \
                gnuplot \
                python-pygments \
        	texlive-full \
                wget

RUN cd /tmp \
    	&& mkdir -p /usr/share/fonts/truetype/FiraSans \
	&& mkdir -p /usr/share/fonts/opentype/FiraSans \
        && wget "dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraMono3106.zip" \
        && wget "dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraSans3106.zip" \
        && unzip FiraSans3106.zip \
        && unzip FiraMono3106.zip \
        && cp Fira*/WEB/*.ttf /usr/share/fonts/truetype/FiraSans/ \
        && cp Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/ \
        && fc-cache -f -v \
        && rm -rf Fira*

WORKDIR /data
VOLUME ["/data"]
