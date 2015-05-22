#!/usr/bin/env bash

if [ -f ${HOME}/.vimrc ]
then
	rm --force ${HOME}/.vimrc.OLD
	mv ${HOME}/.vimrc ${HOME}/vimrc.OLD
	echo 'the existing version of .vimrc has been backed up as vimrc.OLD. '
fi

touch ${HOME}/.vimrc

echo -e 'set nocompatible\t"ignore vi compatibility' >> ${HOME}/.vimrc
echo -e 'set number\t"show line numbers' >> ${HOME}/.vimrc
echo -e 'set showcmd\t"show last command' >> ${HOME}/.vimrc
echo -e 'set wildmenu\t"show possible command completion' >> ${HOME}/.vimrc
echo -e 'set hlsearch\t"highlight all matching results of search' >> ${HOME}/.vimrc
