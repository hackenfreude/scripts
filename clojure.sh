#!/usr/bin/env bash

mkdir ~/bin --parents
rm ~/bin/lein --force
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein --directory-prefix ~/bin --no-verbose
chmod +x ~/bin/lein
./~/bin/lein
lein_return=$?
echo $lein_return
