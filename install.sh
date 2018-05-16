#!/bin/bash

# Update the system
echo Updating the system...
sudo apt-get update
sudo apt-get dist-upgrade

# Own the installer files I copied from my Mac
sudo chown -R $(whoami) ~/installers


###########################################################################
# create folders
###########################################################################

# Relocate bash_profile
cp ~/installers/bash_profile/.bash_profile ~/
source ~/.bash_profile

# Relocate projects
mkdir ~/projects
cp -r ~/installers/projects/* ~/projects
chmod 755 ~/projects/bash_things/*


###########################################################################
# install things
###########################################################################

# Screen
echo Installing screen...
sudo apt-get install screen

# Python
echo Installing python...
sudo apt-get install python3-pip python3-dev python-virtualenv
cd ~
mkdir toolbox
cd toolbox
mkdir python
cd python
echo Creating virtual environment...
virtualenv --system-site-packages -p python3 vp3
cp ~/installers/vp3_activate/activate ~/toolbox/python/vp3/bin
source ~/toolbox/python/vp3/bin/activate

sudo apt-get install python3-pandas
pip install numpy
pip install matplotlib
pip install seaborn

# Jupyter
echo Installing Jupyter...
pip install jupyter
jupyter notebook --generate-config
mv ~/installers/jupyter/jupyter_notebook_config.py ~/.jupyter/

# Node
cd ~/installers/node
tar xf node*
rm node*.xz
f=$(ls)
mv $f node
cp -R node ~/toolbox
npm install -g nodemon

# Postgres
sudo apt install postgresql libpq-dev postgresql-client
postgresql-client-common -y
# sudo su postgres
# createuser fran -P --interactive

# Java
sudo apt-get install oracle-java8-jdk

# Spark
cd ~/toolbox/
wget http://apache.mirror.digitalpacific.com.au/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
tar -xvzf spark*
rm spark*.tgz
f=$(ls -d spark*)
mv $f spark

# Solr
cd ~/toolbox
wget http://apache.mirror.serversaustralia.com.au/lucene/solr/7.1.0/solr-7.1.0.tgz
tar -xvzf solr*
rm solr*.tgz
f=$(ls -d solr*)
mv $f solr
sudo apt-get install lsof

# openCV
# sudo apt-get install build-essential cmake pkg-config
# sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
# sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
# sudo apt-get install libxvidcore-dev libx264-dev
# sudo apt-get install libgtk2.0-dev libgtk-3-dev
# sudo apt-get install libatlas-base-dev gfortran
#
# cd ~/toolbox
# wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.3.0.zip
# unzip opencv.zip
# wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip
# unzip opencv_contrib.zip
#
# cd ~/toolbox/python/
# virtualenv cv -p python3
# source ~/toolbox/python/cv/bin/activate
# pip install numpy
#
# cd ~/toolbox/opencv-3.3.0/
# mkdir build
# cd build
# cmake -D CMAKE_BUILD_TYPE=RELEASE \
#     -D CMAKE_INSTALL_PREFIX=/usr/local \
#     -D INSTALL_PYTHON_EXAMPLES=ON \
#     -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules \
#     -D BUILD_EXAMPLES=ON ..
#
# make -j2 # you can use the 4 cores if you increase the swap memory to 1024, but then you may burn the SD card.

###########################################################################
# remove installers
###########################################################################

rm -r ~/installers
