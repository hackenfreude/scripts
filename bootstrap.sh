!#/bin/bash

#use list of download targets to get all the scripts and grant permissions
wget https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt -P scripts
chmod -R +x scripts/
