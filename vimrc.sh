#!/usr/bin/env bash

if [ -f ${HOME}/.vimrc ]
then
	rm --force ${HOME}/.vimrc.OLD
	mv ${HOME}/.vimrc ${HOME}/.vimrc.OLD
	echo '.vimrc alredy exists and has been backed up as .vimrc.OLD. '
fi
