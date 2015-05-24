#!/usr/bin/env bash

#turn off online search results
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

#show user name in menu bar
gsettings set com.canonical.indicator.session show-real-name-on-panel 'true'

#turn off update popup
gsettings set com.ubuntu.update-notifier no-show-notifications 'true'

#show menus in title bar
gsettings set com.canonical.Unity integrated-menus 'true'

#set small icons in launcher
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 20

#turn on firewall
sudo ufw enable

#add user to shared folders
vbox_group='vboxsf'

if cat /etc/group | grep $vbox_group --only-matching --silent
then
	current_user=$(id --user --name)
	sudo adduser $current_user $vbox_group
fi

#put symlinks to any vbox shared folders onto Desktop
mount_path='/media/'
vbox_mount_prefix='sf_'

dirs=($(tree $mount_path -dfgi -L 1 | grep $vbox_group | grep -E "\<${vbox_mount_prefix}" | tr -d '][' | tr -s ' ' | cut -d ' ' -f 2))

for i in ${dirs[*]}
do
	target=$i
	destination=(${HOME}'/Desktop/'$(echo $i | sed "s|${mount_path}||g"))
	ln -s -n -f $target $destination
done

#add terminal to Unity launcher
unity_launcher_schema='com.canonical.Unity.Launcher'
favorites_key='favorites'
existing_unity_favorites=$(gsettings get $unity_launcher_schema $favorites_key)

terminal_launcher='gnome-terminal.desktop'
terminal_launcher_path='/usr/share/applications/'${terminal_launcher}

favorites_application_prefix='application://'
favorites_terminal_launcher=${favorites_application_prefix}${terminal_launcher}

if $([ -f ${terminal_launcher_path} ] && $(!(echo $existing_unity_favorites | grep $favorites_terminal_launcher --silent)))
then
	existing_applications=($(echo $existing_unity_favorites | tr -d '][ ' | tr ',' '\n' | grep $favorites_application_prefix))
	updated_applications=(${existing_applications[*]} "'"${favorites_terminal_launcher}"'")
	
	not_applications=($(echo $existing_unity_favorites | tr -d '][ ' | tr ',' '\n' | grep $favorites_application_prefix --invert-match))
	
	combined=(${updated_applications[*]} ${not_applications[*]})
	combined_text=$(IFS=, ;echo "[${combined[*]}]")
	
	gsettings set $unity_launcher_schema $favorites_key $combined_text
fi
