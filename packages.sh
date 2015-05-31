#!/usr/bin/env bash


##### begin main functions ##### 

function preinstall {
	stepname='pre-installation package maintenance'
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	sudo apt-get autoremove --assume-yes &>> $logfile || earlyexit "${stepname}: autoremove"
	sudo apt-get autoclean --assume-yes &>> $logfile || earlyexit "${stepname}: autoclean"
	sudo apt-get update --assume-yes &>> $logfile || earlyexit "${stepname}: update"
	sudo apt-get upgrade --assume-yes &>> $logfile || earlyexit "${stepname}: upgrade"

	checklog || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function unneeded {
	stepname='removing unneeded packages'
	echo "----------begin ${stepname}----------" | tee --append $logfile

	removal_list='aisleriot brasero cheese deja-dup gnome-mahjongg gnome-sudoku gnomine libreoffice-calc libreoffice-gnome libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-human libreoffice-writer rhythmbox rhythmbox-plugin-magnatune shotwell simple-scan thunderbird thunderbird-gnome-support totem totem-mozilla unity-webapps-common'

	sudo apt-get remove $removal_list --assume-yes &>> $logfile || earlyexit "${stepname}: remove"
	sudo apt-get autoremove --assume-yes &>> $logfile || earlyexit "${stepname}: autoremove"
	sudo apt-get autoclean --assume-yes &>> $logfile || earlyexit "${stepname}: autoclean"

	checklog || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function keptback {
	stepname='installing kept-back packages'
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	kept_back_packages=$(sudo apt-get upgrade -s | sed -n '/back:/,/upgraded./p' | sed '1d;$d')
	
	sudo apt-get install $kept_back_packages --assume-yes &>> $logfile || earlyexit "${stepname}: install"
	sudo apt-get autoremove --assume-yes &>> $logfile || earlyexit "${stepname}: autoremove"
	sudo apt-get autoclean --assume-yes &>> $logfile || earlyexit "${stepname}: autoclean"

	checklog || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function install {
	stepname='installing custom packages'
	packages='git vim tree screen'
	vbox_guest='virtualbox-guest-dkms'
	
	echo "----------begin ${stepname}----------" | tee --append $logfile

	sudo apt-get install $packages --assume-yes &>> $logfile || earlyexit "${stepname}: install ${packages}"
	sudo apt-get install $vbox_guest --assume-yes &>> $logfile || earlyexit "${stepname}: install ${vbox_guest}"
	sudo apt-get autoremove --assume-yes &>> $logfile || earlyexit "${stepname}: autoremove"
	sudo apt-get autoclean --assume-yes &>> $logfile || earlyexit "${stepname}: autoclean"

	checklog || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

##### end main functions #####


##### begin utility functions #####

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

function earlyexit {
	echo "----------a problem occurred during ${1}----------" | tee --append $logfile
	exit 1
}

##### end utility functions #####




logfile='./bash-machine-setup/packages.log'
rm --force $logfile

preinstall
unneeded
keptback
install

