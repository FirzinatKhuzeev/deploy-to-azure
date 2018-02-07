#!/bin/bash

echo "Starting install on pid $$"
date

ps axf | grep apt | grep -v grep | grep -v waitForApt | awk '{print "sudo kill -9 " $1}' | sh
sudo rm /var/lib/apt/lists/lock -f
sudo rm /var/cache/apt/archives/lock -f
sudo rm /var/lib/dpkg/lock -f
sudo dpkg --configure -a
sudo apt-get update -y
sudo apt-get -f install

# if (fuser /var/lib/dpkg/lock > /dev/null 2>&1)
#     then echo "/var/lib/dpkg/lock is locked"
# fi

# i=0
# while (fuser /var/lib/dpkg/lock > /dev/null 2>&1); do
#     sleep 30
#     ((i=i+1))
#     if ((i > 60))
#     then
#         echo "Waiting failed after 30m."
#         ps axf | grep apt | grep -v grep | grep -v waitForApt | awk '{print "sudo kill -9 " $1}' | sh
#         echo "Cleaning up..."
#         sudo rm /var/lib/apt/lists/lock -f
#         sudo rm /var/cache/apt/archives/lock -f
#         sudo rm /var/lib/dpkg/lock -f
#         break
#     fi
# done

echo "Updating..."
date

# Update
sudo apt-get update -y
# sudo apt-get upgrade -y

# Install xRDP
sudo apt-get install xrdp -y
sudo ufw allow 3389/tcp

# Install XFCE
# sudo apt-get install xfce4 -y

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

# Restart services
sudo service xrdp restart
sudo service ssh restart

date
echo "Completed install on pid $$"
