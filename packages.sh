#!/bin/bash

echo 'update package sources'
sudo apt-get update -y

echo 'upgrade packages'
sudo apt-get upgrade -y

echo 'install kept-back linux packages'
#this may need periodic updates based on specific install and current package versions
sudo apt-get install linux-generic-lts-utopic linux-headers-generic-lts-utopic linux-image-generic-lts-utopic -y

echo 'remove unneeded packages'
sudo apt-get remove aisleriot brasero cheese deja-dup gnome-mahjongg gnome-sudoku gnomine libreoffice-calc libreoffice-gnome libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-human libreoffice-writer rhythmbox rhythmbox-plugin-magnatune shotwell simple-scan thunderbird thunderbird-gnome-support totem totem-mozilla unity-webapps-common -y

echo 'autoremove'
sudo apt-get autoremove -y

echo 'autoclean'
sudo apt-get autoclean -y

echo 'check for anything else kept back'
sudo apt-get update -y
sudo apt-get upgrade -y

echo 'install additional packages'
sudo apt-get install git vim -y

echo 'install virtualbox guest additions'
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 -y
