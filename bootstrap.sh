#!/bin/bash

#use list of download targets to get all the scripts
wget -i https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt -P scripts

#give execute permissions
chmod -R +x scripts/

#./scripts/packages.sh | tee packages.log
./scripts/user.sh $1 | tee user.log
