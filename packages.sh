#!/bin/bash

echo 'update package sources'
sudo apt-get update -y

echo 'upgrade packages'
sudo apt-get upgrade -y

echo 'install kept-back linux packages'
sudo apt-get install linux-generic-lts-utopic -y
sudo apt-get install linux-headers-generic-lts-utopic -y
sudo apt-get install linux-image-generic-lts-utopic -y

echo 'remove unneeded packages'
sudo apt-get remove aisleriot -y
sudo apt-get remove brasero -y
sudo apt-get remove cheese -y
sudo apt-get remove deja-dup -y
sudo apt-get remove gnome-mahjongg -y
sudo apt-get remove gnome-sudoku -y
sudo apt-get remove gnomine -y
sudo apt-get remove libreoffice-calc -y
sudo apt-get remove libreoffice-gnome -y
sudo apt-get remove libreoffice-impress -y
sudo apt-get remove libreoffice-math -y
sudo apt-get remove libreoffice-ogltrans -y
sudo apt-get remove libreoffice-pdfimport -y
sudo apt-get remove libreoffice-presentation-minimizer -y
sudo apt-get remove libreoffice-style-human -y
sudo apt-get remove libreoffice-writer -y
sudo apt-get remove rhythmbox -y
sudo apt-get remove rhythmbox-plugin-magnatune -y
sudo apt-get remove shotwell -y
sudo apt-get remove simplescan -y
sudo apt-get remove thunderbird -y
sudo apt-get remove thunderbird-gnome-support -y
sudo apt-get remove totem -y
sudo apt-get remove totem-mozilla -y
sudo apt-get remove unity-webapps-common -y

echo 'autoremove'
sudo apt-get autoremove -y

echo 'autoclean'
sudo apt-get autoclean -y

echo 'check for anything else kept back'
sudo apt-get update -y
sudo apt-get upgrade -y
