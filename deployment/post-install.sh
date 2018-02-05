#!/bin/bash

# Remove lock
# rm /var/lib/dpkg/lock
# dpkg --configure -a

# Update
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install xRDP
sudo apt-get install xrdp -y

# Install XFCE
sudo apt-get install xfce4 xfce4-terminal build-essential -y

# Configure XFCE
echo xfce4-session >~/.xsession
sudo sed -i.bak '/fi/a startxfce4\n' /etc/xrdp/startwm.sh
sudo /etc/init.d/xrdp start
sudo service xrdp restart

# Install CUDA Drivers
# CUDA_REPO_PKG=cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
# wget -O /tmp/${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 
# sudo dpkg -i /tmp/${CUDA_REPO_PKG}
# sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub 
# rm -f /tmp/${CUDA_REPO_PKG}
# sudo apt-get update -y
# sudo apt-get install cuda-drivers -y

# # Install CUDA toolkit
# sudo apt-get install cuda-8-0 cuda-toolkit-8-0 -y

# Install Blender
sudo apt-get install blender -y

sudo reboot