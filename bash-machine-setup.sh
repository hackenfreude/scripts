#!/bin/bash

if [ $(id -u) == 0 ]; then
	echo "You are running as root. Run this as your normal user; the script will prompt for a password only when necessary."
	exit 1
fi

rm -f bootstrap.sh

wget -nv https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/bootstrap.sh

