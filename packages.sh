#!/usr/bin/env bash

function earlyexit {
	echo "an problem occurred during ${1}"
	exit 1
}

logfile='./bash-machine-setup/packages.log'
rm --force $logfile

echo 'begin pre-installation package maintenance'

if [ ! $(sudo apt-get autoremove --assume-yes &>> $logfile) ]; then earlyexit 'autoremove'; fi
if [ ! $(sudo apt-get autoclean --assume-yes &>> $logfile) ]; then earlyexiti 'autoclean'; fi
if [ ! $(sudo apt-get update --assume-yes &>> $logfile) ]; then earlyexit 'update'; fi
if [ ! $(sudo apt-get upgrade --assume-yes &>> $logfile) ]; then earlyexit 'upgrade'; fi

#necessary because apt-get may emit a problem to stdout or stderr but still return 0
preinstall_log_problem_count=$(grep --count --extended-regexp '(Err )|(W: )|(E: )' $logfile)

if [[ $preinstall_log_problem_count != 0 ]]; then earlyexit 'pre-installation package maintenance'; fi

echo 'pre-installation package maintenance succeeded'

echo 'remove unneeded packages'
sudo apt-get remove aisleriot brasero cheese deja-dup gnome-mahjongg gnome-sudoku gnomine libreoffice-calc libreoffice-gnome libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-human libreoffice-writer rhythmbox rhythmbox-plugin-magnatune shotwell simple-scan thunderbird thunderbird-gnome-support totem totem-mozilla unity-webapps-common -y

sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo 'install kept-back packages'
kept_back_packages=$(sudo apt-get upgrade -s | sed -n '/back:/,/upgraded./p' | sed '1d;$d')
sudo apt-get install $kept_back_packages -y

sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo 'install git, vim, tree, screen, and virtualbox guest'
sudo apt-get install git vim tree screen -y
sudo apt-get install virtualbox-guest-dkms -y
