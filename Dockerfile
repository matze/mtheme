FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy texlive-full 
RUN apt-get install -qy python-pygments 
RUN apt-get install -qy gnuplot

RUN apt-get install wget

RUN mkdir -p /usr/share/fonts/truetype/FiraSans
RUN mkdir -p /usr/share/fonts/opentype/FiraSans
RUN wget "dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraMono3106.zip"
RUN wget "dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraSans3106.zip"
RUN unzip FiraSans3106.zip
RUN unzip FiraMono3106.zip
RUN sudo cp /Fira*/WEB/*.ttf /usr/share/fonts/truetype/FiraSans/
RUN sudo cp /Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/
RUN sudo fc-cache -f -v

WORKDIR /data
VOLUME ["/data"]
