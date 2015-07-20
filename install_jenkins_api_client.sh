#!/usr/bin/env bash

#fixes dpkg-reconfigure: unable to re-open stdin: No file or directory
export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y install zlib1g-dev
sudo gem install jenkins_api_client
