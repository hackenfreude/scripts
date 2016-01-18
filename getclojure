#!/usr/bin/env bash

logfile="${HOME}/${0}.log"

function checksudo {
	if [[ $(id --user) != 0 ]]
	then
		echo 'You are not running as root. Re-run with sudo.'
		exit 1
	fi
}

function preplogs {
	sudo rm --force $logfile
}

function getjava {
	stepname='getting java'
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	sudo apt-get update --assume-yes &>> $logfile || earlyexit "${stepname}: update"
	sudo apt-get install default-jdk --assume-yes &>> $logfile || earlyexit "${stepname}: install java"
	
	checklog || earlyexit "${stepname}"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function getleiningen {
	stepname='installing leiningen'
	echo "----------begin ${stepname}----------" | tee --append $logfile
	
	mkdir ~/bin --parents
	rm ~/bin/lein --force

	wget --directory-prefix ~/bin --no-verbose https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein &>> $logfile || earlyexit "${stepname}: downloading"

	chmod +x ~/bin/lein
	~/bin/lein &>> $logfile || earlyexit "${stepname}: executing"
	
	echo "----------${stepname} succeeded----------" | tee --append $logfile
}

function checklog {
	#necessary because apt-get may emit a problem to stdout or stderr but still return 0
	problem_count=$(grep --count --extended-regexp '(Err )|(W: )|(E: )' $logfile)
	
	if [[ $problem_count != 0 ]]
	then
		return 1
	else
		return 0
	fi
}

function earlyexit {
	echo "----------a problem occurred during ${1}----------" | tee --append $logfile
	exit 1
}

##### end utility functions #####


checksudo
preplogs
getjava
getleiningen

exit 0

