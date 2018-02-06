#!/bin/bash

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
