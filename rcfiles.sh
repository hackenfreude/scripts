#!/usr/bin/env bash

function earlyexit {
	echo "----------a problem occurred during ${1}----------" | tee --append $logfile
	exit 1
}

logfile='./bash-machine-setup/vimrc.log'
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

