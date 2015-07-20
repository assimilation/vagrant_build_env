#!/usr/bin/env bash

file="/etc/apt/sources.list.d/docker.list"

if [ -f "$file" ]
then
  sudo rm /etc/apt/sources.list.d/docker.list
fi
