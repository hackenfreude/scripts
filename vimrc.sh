#!/usr/bin/env bash

if [ -f ${HOME}/.vimrc ]
then
	rm --force ${HOME}/.vimrc.OLD
	mv ${HOME}/.vimrc ${HOME}/vimrc.OLD
	echo 'the existing version of .vimrc has been backed up as vimrc.OLD. '
fi

wget --directory-prefix ${HOME} --no-verbose --output-document vimrc https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/vimrc
