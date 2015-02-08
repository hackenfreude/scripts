#!/bin/bash

echo 'update package sources'
sudo apt-get update -y

echo 'upgrade packages'
sudo apt-get upgrade -y

echo 'install kept-back linux packages'
sudo apt-get install linux-generic -y
sudo apt-get install linux-headers-generic -y
sudo apt-get install linux-image-generic -y

echo 'autoremove'
sudo apt-get autoremove -y

echo 'remove unneeded packages'
sudo apt-get remove deja-dup -y
sudo apt-get remove gnome-bluetooth -y
sudo apt-get remove gnome-mahjongg -y
sudo apt-get remove gnome-mines -y
sudo apt-get remove aisleriot -y
sudo apt-get remove gnome-sudoku -y
sudo apt-get remove libre-office-draw -y
sudo apt-get remove webbrowser-app -y
sudo apt-get remove thunderbird -y
sudo apt-get remove libre-office-writer -y
sudo apt-get remove libre-office-math -y
sudo apt-get remove libre-office-calc -y
sudo apt-get remove unity-scope-gdrive -y
sudo apt-get remove libre-office-impress -y
sudo apt-get remove brasero -y
sudo apt-get remove cheese -y
sudo apt-get remove rhythmbox -y
sudo apt-get remove unity-webapps-common -y

echo 'autoremove'
sudo apt-get autoremove -y

#TODO:
#get sudo perms at beginning

