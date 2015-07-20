#!/usr/bin/env bash

echo "Setup saltstack PPA"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install software-properties-common python-software-properties -y >> /dev/null
sudo add-apt-repository ppa:saltstack/salt -y >> /dev/null
sudo apt-get update >> /dev/null

echo "Installing salt-minion"
sudo apt-get install salt-minion -y >> /dev/null
sudo cp /vagrant/salt/minion /etc/salt/minion

echo "Restart salt-minion"
sudo salt-minion -d
sudo service salt-minion restart
