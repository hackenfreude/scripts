#!/usr/bin/env bash

echo 'turn off online search results'
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

echo 'show user name in menu bar'
gsettings set com.canonical.indicator.session show-real-name-on-panel 'true'

echo 'turn on firewall'
sudo ufw enable
