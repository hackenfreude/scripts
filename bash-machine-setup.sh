#!/bin/env bash

if [[ $(id --user) == 0 ]]
then
	echo 'You are running as root. Run this as your normal user; the script will prompt for a password only when necessary.'
	exit 1
fi

rm --force bootstrap.sh

wget --no-verbose https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/bootstrap.sh

chmod +x bootstrap.sh

./bootstrap.sh

