#!/bin/bash

# Install xRDP
sudo apt-get install xrdp -y

# Install XFCE
sudo apt-get install xfce4 -y

# Configure XFCE
echo xfce4-session >~/.xsession
sudo sed -i.bak '/fi/a startxfce4\n' /etc/xrdp/startwm.sh
sudo /etc/init.d/xrdp start
sudo service xrdp restart
