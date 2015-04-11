#!/bin/bash

SUPPORTED_VER="Ubuntu 14.04.1 LTS"
WANTED_VBOX_PKG="virtualbox-guest-*"
EXPECTED_VBOX_COUNT=3

#read the current version
CURRENT_VER=$(lsb_release -ds)

#check installed virtualbox packages
INSTALLED_VBOX_COUNT=$(dpkg --get-selections $WANTED_VBOX_PKG | grep -c -e '\binstall')

if [[ $CURRENT_VER == $SUPPORTED_VER || $INSTALLED_VBOX_COUNT == $EXPECTED_VBOX_COUNT ]]; then
		
	#remove scripts from prior runs if it exists
	rm -rf scripts/
	
	#use list of download targets to get all the scripts
	wget -i https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt -P scripts
	
	#give execute permissions
	chmod -R +x scripts/
	
	#run each component and log output	
	./scripts/packages.sh | tee packages.log
	./scripts/settings.sh | tee settings.log

else
	echo "You are on $CURRENT_VER. This script only works with $SUPPORTED_VER due to Virtualbox compatability issues."
fi
