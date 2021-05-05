#!/bin/sh/
#######################################
# Bash script to install apps on a new system (Ubuntu)
# Written by @AamnahAkram from http://aamnah.com
#######################################

## Update packages and Upgrade system
sudo apt-get update -y

## Filebeat ##
echo '###Installing Filebeat..'
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install apt-transport-https

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update && sudo apt-get install filebeat

#echo Do you want to start filebeat at startup [y/n] ?;
#read ENABLE;

#if ["$ENABLE" != "y"]
#then
#	echo 'The installation of filebeat is finished'
	
#else 
#	sudo systemctl enable filebeat
#fi

# Filebeat Configuration
echo '###Configure Filebeat..'

echo "Downloading the new filebeat.yml file..";
wget 'https://raw.githubusercontent.com/m-b79/filebeat/master/filebeat.yml'

echo "Copying the new file in '/etc/filebeat'.."
sudo cp filebeat.yml /etc/filebeat



