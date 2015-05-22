#!/usr/bin/env bash

if [ -f ${HOME}/.vimrc ]
then
	rm --force ${HOME}/.vimrc.OLD
	mv ${HOME}/.vimrc ${HOME}/vimrc.OLD
	echo 'the existing version of .vimrc has been backed up as vimrc.OLD. '
fi

touch ${HOME}/.vimrc

echo -e 'set nocompatible\t"ignore vi compatibility' >> ${HOME}/.vimrc

