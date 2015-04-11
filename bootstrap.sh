#!/bin/bash

#first check the version
CURRENT=$(lsb_release -ds)
SUPPORTED="Ubuntu 14.04.1 LTS"

if [[ $CURRENT == $SUPPORTED ]]; then
	
	#use list of download targets to get all the scripts
	wget -i https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt -P scripts
	
	#give execute permissions
	chmod -R +x scripts/
	
	#run each component and log output	
	./scripts/packages.sh | tee packages.log
	./scripts/settings.sh | tee settings.log

else
	echo "You are on $CURRENT. This script only works with $SUPPORTED due to Virtualbox compatability issues."
fi
