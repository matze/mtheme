#!/bin/bash

## cf from http://programster.blogspot.com/2014/05/ubuntu-14-desktop-install-fira-sans-and.html

cd /tmp

# install unzip just in case the user doesn't already have it.
apt-get install unzip -y

# Fonts also available at: https://github.com/bBoxType/FiraSans
wget "https://bboxtype.com/downloads/Fira/Download_Folder_FiraSans_4301.zip"
wget "https://bboxtype.com/downloads/Fira/Fira_Mono_3_2.zip"

unzip Download_Folder_FiraSans_4301.zip
unzip Fira_Mono_3_2.zip

sudo mkdir -p /usr/share/fonts/truetype/FiraSans
sudo mkdir -p /usr/share/fonts/opentype/FiraSans

cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_TTF_4301/*/*/*.ttf \
	/usr/share/fonts/truetype/FiraSans/
cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_OTF_4301/*/*/*.otf \
	/usr/share/fonts/opentype/FiraSans/
cp Fira_Mono_3_2/Fonts/FiraMono_WEB_32/*.ttf /usr/share/fonts/truetype/FiraSans
cp Fira_Mono_3_2/Fonts/FiraMono_OTF_32/*.otf /usr/share/fonts/truetype/FiraSans

rm Download_Folder_FiraSans_4301.zip Fira_Mono_3_2.zip
rm -rf Download_Folder_FiraSans_4301 Fira_Mono_3_2

fc-cache -fv
