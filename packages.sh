#!/usr/bin/env bash

function earlyexit {
	echo "a problem occurred during ${1}"
	exit 1
}

function preinstall {
	stepname='pre-installation package maintenance'
	echo "begin ${stepname}"
	
	sudo apt-get autoremove --assume-yes &>> $logfile || earlyexit "${stepname}: autoremove"
	sudo apt-get autoclean --assume-yes &>> $logfile || earlyexit "${stepname}: autoclean"
	sudo apt-get update --assume-yes &>> $logfile || earlyexit "${stepname}: update"
	sudo apt-get upgrade --assume-yes &>> $logfile || earlyexit "${stepname}: upgrade"

	checklog || earlyexit "${stepname}"
	
	echo "${stepname} succeeded"
}

#necessary because apt-get may emit a problem to stdout or stderr but still return 0
function checklog {
	problem_count=$(grep --count --extended-regexp '(Err )|(W: )|(E: )' $logfile)
	
	if [[ $problem_count != 0 ]]
	then
		return 1
	else
		return 0
	fi
}

logfile='./bash-machine-setup/packages.log'
rm --force $logfile

preinstall

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
