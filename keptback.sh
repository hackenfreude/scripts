#!/usr/bin/env bash

kept_back_packages=$(sudo apt-get upgrade -s | sed -n '\back:\,\upgraded.\p' | sed '1d;$d')

echo $kept_back_packages


