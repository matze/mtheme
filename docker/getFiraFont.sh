#!/bin/bash

## cf from http://programster.blogspot.com/2014/05/ubuntu-14-desktop-install-fira-sans-and.html

cd /tmp

# install unzip just in case the user doesn't already have it.
sudo apt-get install unzip -y
wget "http://dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraSans3106.zip"
wget "http://dev.carrois.com/wordpress/wp-content/uploads/downloads/fira_3_1/FiraMono3106.zip"

unzip FiraMono3106.zip
unzip FiraSans3106.zip

sudo mkdir -p /usr/share/fonts/truetype/FiraSans
sudo mkdir -p /usr/share/fonts/opentype/FiraSans
sudo cp Fira*/WEB/*.ttf /usr/share/fonts/truetype/FiraSans/
sudo cp Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/

sudo fc-cache -fv
