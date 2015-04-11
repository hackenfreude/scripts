#!/bin/bash

echo "turn off online search results"
gsettings set com.canonical.Unity.Lenses remote-content-search none

echo "turn on firewall"
sudo ufw enable
