#!/usr/bin/env bash

if [[ $(id --user) == 0 ]]
then
	echo 'You are running as root. Run this as your normal user; the script will prompt for a password only when necessary.'
	exit 1
fi

rm --recursive --force bash-machine-setup/

wget --directory-prefix bash-machine-setup --no-verbose --input-file https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt

if [[ $? != 0 ]]
then
	echo 'There was a problem downloading the scripts. Try again later.'
	exit 1
fi

rm bash-machine-setup/downloadtargets.txt
chmod --recursive +x bash-machine-setup/

./bash-machine-setup/bootstrap.sh
ret_code=$?

sudo -k

if [[ $ret_code == 0 ]]
then
	echo '***************************************************************************'
	echo 'Machine setup ran successfully.'
	echo 'Note that a full reboot is needed to make any new $PATH changes permanent'
	echo 'Until then, force bash to reload to pick up $PATH changes by invoking \"exec -l bash"'
	echo '***************************************************************************'
fi

