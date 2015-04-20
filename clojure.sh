#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install default-jdk -y

mkdir ~/bin --parents
rm ~/bin/lein --force
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein --directory-prefix ~/bin --no-verbose
chmod +x ~/bin/lein
~/bin/lein
lein_return=$?
#if [[ $lein_return == 0 ]]
#then
#	export PATH=$PATH:$HOME/bin
#fi
exit $lein_return
