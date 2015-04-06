#!/bin/bash

echo 'update package sources'
sudo apt-get update -y

read -p 'press [Enter] to continue...'

echo 'upgrade packages'
sudo apt-get upgrade -y

read -p 'press [Enter] to continue...'

echo 'install kept-back linux packages'
sudo apt-get install linux-generic-lts-utopic linux-headers-generic-lts-utopic linux-image-generic-lts-utopic -y

read -p 'press [Enter] to continue...'

echo 'remove unneeded packages'
sudo apt-get remove aisleriot -y
read -p 'press [Enter] to continue...'
sudo apt-get remove brasero -y
read -p 'press [Enter] to continue...'
sudo apt-get remove cheese -y
read -p 'press [Enter] to continue...'
sudo apt-get remove deja-dup -y
read -p 'press [Enter] to continue...'
sudo apt-get remove gnome-mahjongg -y
read -p 'press [Enter] to continue...'
sudo apt-get remove gnome-sudoku -y
read -p 'press [Enter] to continue...'
sudo apt-get remove gnomine -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-calc -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-gnome -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-impress -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-math -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-ogltrans -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-pdfimport -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-presentation-minimizer -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-style-human -y
read -p 'press [Enter] to continue...'
sudo apt-get remove libreoffice-writer -y
read -p 'press [Enter] to continue...'
sudo apt-get remove rhythmbox -y
read -p 'press [Enter] to continue...'
sudo apt-get remove rhythmbox-plugin-magnatune -y
read -p 'press [Enter] to continue...'
sudo apt-get remove shotwell -y
read -p 'press [Enter] to continue...'
sudo apt-get remove simplescan -y
read -p 'press [Enter] to continue...'
sudo apt-get remove thunderbird -y
read -p 'press [Enter] to continue...'
sudo apt-get remove thunderbird-gnome-support -y
read -p 'press [Enter] to continue...'
sudo apt-get remove totem -y
read -p 'press [Enter] to continue...'
sudo apt-get remove totem-mozilla -y
read -p 'press [Enter] to continue...'
sudo apt-get remove unity-webapps-common -y
read -p 'press [Enter] to continue...'

echo 'autoremove'
sudo apt-get autoremove -y

echo 'autoclean'
sudo apt-get autoclean -y

echo 'check for anything else kept back'
sudo apt-get update -y
sudo apt-get upgrade -y
