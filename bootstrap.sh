#!/usr/bin/env bash

# X -version sends to stderr rather than stdout, so |& is necessary to pipe it
current_xserver_version=$(X -version |& grep 'X Server' | grep --only-matching --extended-regexp '([0-9]+(\.)?)+')
supported_xserver_version='1.15.1'

if [[ "${current_xserver_version}" != "${supported_xserver_version}" ]]
then
	echo "Unless you have taken special action, the HOST Ubuntu system is likely running the default Ubuntu repository version of Virtualbox."
	echo "Currently, this version of Virtualbox on the HOST only supports X Server version $supported_xserver_version on GUEST systems."
	echo "This system (the GUEST) has X Server version $current_xserver_version."
	echo "This matters because the script will configure Virtualbox on the GUEST to allow full-screen. This fails due to X Server incompatability."
	echo "Ubuntu 14.04.1 comes with the supported version of X Server; Ubuntu 14.04.2 and later do not."
	echo "Please run this script on a clean Ubuntu 14.04.1 version."
	exit 1
fi

./bash-machine-setup/packages.sh | ./bash-machine-setup/tee packages.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'packages.sh failed. Please check packages.log'
	exit 1
fi

./bash-machine-setup/settings.sh | tee ./bash-machine-setup/settings.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'settings.sh failed. Please check settings.log'
	exit 1
fi

./bash-machine-setup/clojure.sh | tee ./bash-machine-setup/clojure.log
if [[ ${PIPESTATUS[0]} != 0 ]]
then
	echo 'clojure.sh failed. Please check clojure.log'
	exit 1
fi

exit 0
