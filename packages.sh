#!/usr/bin/env bash

sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get update -y
sudo apt-get upgrade -y

echo 'remove unneeded packages'
sudo apt-get remove aisleriot brasero cheese deja-dup gnome-mahjongg gnome-sudoku gnomine libreoffice-calc libreoffice-gnome libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-human libreoffice-writer rhythmbox rhythmbox-plugin-magnatune shotwell simple-scan thunderbird thunderbird-gnome-support totem totem-mozilla unity-webapps-common -y

sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo 'install kept-back packages'
kept_back_packages=$(sudo apt-get upgrade -s | sed -n '/back:/,/upgraded./p' | sed '1d;$d')
sudo apt-get install $kept_back_packages -y

sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo 'install git, vim, tree, and virtualbox guest'
sudo apt-get install git vim tree -y
sudo apt-get install virtualbox-guest-dkms -y
