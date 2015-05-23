#!/usr/bin/env bash

echo 'turn off online search results'
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

echo 'show user name in menu bar'
gsettings set com.canonical.indicator.session show-real-name-on-panel 'true'

echo 'turn off update popup'
gsettings set com.ubuntu.update-notifier no-show-notifications 'true'

echo 'turn on firewall'
sudo ufw enable

echo 'adding user to virtualbox shared folder group'

vbox_group='vboxsf'

if cat /etc/group | grep ${vbox_group} --only-matching --silent
then
	current_user=$(id --user --name)
	sudo adduser ${current_user} ${vbox_group}
fi
