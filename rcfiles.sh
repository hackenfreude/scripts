#!/usr/bin/env bash

##### begin main functions ##### 

function vimsettings {
	stepname='downloading vimrc'
	
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	if [ -f ${HOME}/.vimrc ]
	then
		rm --force ${HOME}/.vimrc.OLD
		mv ${HOME}/.vimrc ${HOME}/vimrc.OLD
		echo 'the existing version of .vimrc has been backed up as vimrc.OLD. '
	fi
	
	wget --no-verbose --output-document ${HOME}/.vimrc https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/vimrc &>> $logfile || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function screensettings {
	stepname='downloading screenrc'
	
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	if [ -f ${HOME}/.screenrc ]
	then
		rm --force ${HOME}/.screenrc.OLD
		mv ${HOME}/.screenrc ${HOME}/screenrc.OLD
		echo 'the existing version of .screenrc has been backed up as screenrc.OLD. '
	fi
	
	wget --no-verbose --output-document ${HOME}/.screenrc https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/screenrc &>> $logfile || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

##### end main functions #####


##### begin utility functions #####

function earlyexit {
	echo "----------a problem occurred during ${1}----------" | tee --append $logfile
	exit 1
}

##### end utility functions #####

logfile='./bash-machine-setup/rcfiles.log'
rm --force $logfile

vimsettings
screensettings

