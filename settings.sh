#!/usr/bin/env bash

#turn off online search results
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

#show user name in menu bar
gsettings set com.canonical.indicator.session show-real-name-on-panel 'true'

#turn off update popup
gsettings set com.ubuntu.update-notifier no-show-notifications 'true'

#show menus in title bar
gsettings set com.canonical.Unity integrated-menus 'true'

#turn on firewall
sudo ufw enable

vbox_group='vboxsf'

if cat /etc/group | grep ${vbox_group} --only-matching --silent
then
	current_user=$(id --user --name)
	sudo adduser ${current_user} ${vbox_group}
fi
