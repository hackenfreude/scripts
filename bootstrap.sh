#!/usr/bin/env bash

supported_clean_ubuntu_version='Ubuntu 14.04.1 LTS'
virtualbox_guest_package_search_term='virtualbox-guest-*'
expected_virtualbox_guest_installed_package_count=3

current_ubuntu_version=$(lsb_release --short --description)
installed_virtualbox_guest_package_count=$(dpkg --get-selections "${virtualbox_guest_package_search_term}" | grep --count --word-regexp 'install')

#virtualbox and xorg compatibility are handled with this kludge: if guest additions are already installed, assume all is well. Otherwise, only work with 14.04.1
if [[ "${current_ubuntu_version}" != "${supported_clean_ubuntu_version}" && $installed_virtualbox_guest_package_count != $expected_virtualbox_guest_installed_package_count ]]
then
	echo "You are on $current_ubuntu_version. This script only works with $supported_clean_ubuntu_version due to Virtualbox compatability issues."
	exit 1
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
