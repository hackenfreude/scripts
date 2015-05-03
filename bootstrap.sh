#!/usr/bin/env bash

#supported_clean_ubuntu_version='Ubuntu 14.04.1 LTS'
#virtualbox_guest_package_search_term='virtualbox-guest-*'
#expected_virtualbox_guest_installed_package_count=3

#current_ubuntu_version=$(lsb_release --short --description)
#installed_virtualbox_guest_package_count=$(dpkg --get-selections "${virtualbox_guest_package_search_term}" | grep --count --word-regexp 'install')

#virtualbox and xorg compatibility are handled with this kludge: if guest additions are already installed, assume all is well. Otherwise, only work with 14.04.1
#if [[ "${current_ubuntu_version}" != "${supported_clean_ubuntu_version}" && $installed_virtualbox_guest_package_count != $expected_virtualbox_guest_installed_package_count ]]
#then
#	echo "You are on $current_ubuntu_version. This script only works with $supported_clean_ubuntu_version due to Virtualbox compatability issues."
#	exit 1
#fi

#X -version sends to stderr rather than stdout, so |& is necessary to pipe it
current_xserver_version=$(X -version |& grep 'X Server' | grep --only-matching --extended-regexp '([0-9]+(\.)?)+')
supported_xserver_version='1.15.1'

if [[ "${current_xserver_version}" != "${supported_xserver_version}" ]]
then
	echo "Unless you have taken special action, the HOST Ubuntu system is likely running the default Ubuntu repository version of Virtualbox. Currently, this version on the HOST only supports X Server version $supported_xserver_version on GUEST systems. This system (the GUEST) has X Server version $current_xserver_version. Ubuntu 14.04.1 has the supported version; Ubuntu 14.04.2 and later does not. Please run this script on a clean Ubuntu 14.04.1 version."
fi

rm --recursive --force scripts/
wget --input-file https://raw.githubusercontent.com/hackenfreude/bash-machine-setup/master/downloadtargets.txt --directory-prefix scripts --no-verbose
chmod --recursive +x scripts/

./scripts/packages.sh | tee packages.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'packages.sh failed. Please check packages.log'
	exit 1
fi

./scripts/settings.sh | tee settings.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'settings.sh failed. Please check settings.log'
	exit 1
fi

./scripts/clojure.sh | tee clojure.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'clojure.sh failed. Please check clojure.log'
	exit 1
fi

exit 0
