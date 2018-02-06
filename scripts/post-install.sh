#!/bin/bash

echo "starting install on pid $$"
date

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Install xRDP
sudo apt-get install xrdp -y

# Install XFCE
sudo apt-get install xfce4 -y

# Configure XFCE
echo xfce4-session >~/.xsession
sudo sed -i.bak '/fi/a startxfce4\n' /etc/xrdp/startwm.sh
sudo /etc/init.d/xrdp start
sudo service xrdp restart

# Install Blender
sudo apt-get install blender -y

# Install UnZip
sudo apt-get install unzip -y

# Download Blender example
wget https://download.blender.org/demo/test/BMW27_2.blend.zip
bldPath="/opt/blender-example"
sudo mkdir $bldPath
unzip ./BMW27_2.blend.zip
sudo cp ./bmw27/* $bldPath
sudo chmod -R 777 $bldPath
sudo chown -R :users $bldPath

date
echo "completed install on pid $$"
