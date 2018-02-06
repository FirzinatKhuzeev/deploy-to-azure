#!/bin/bash

echo "starting install on pid $$"
date

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Run other scripts
sudo ./app-install.sh
sudo ./dependencies-install.sh

date
echo "completed install on pid $$"
