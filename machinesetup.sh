#!/bin/bash
echo 'update package sources (assume yes)'
sudo apt-get update -y
echo 'upgrade packages (assume yes)'
sudo apt-get upgrade -y
echo 'autoremove'
sudo apt-get autoremove -y
echo 'done... for now'
