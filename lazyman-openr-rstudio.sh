#!/usr/bin/env bash

### Install Revolution R Open #####
sudo apt-get update
sudo apt-get install gcc gfortran g++ -y

cd ~
mkdir R
cd R
wget http://mran.revolutionanalytics.com/install/RRO-8.0.1-Beta3-Ubuntu-14.04.x86_64.tar.gz
tar -xzf RRO-8.0.1-Beta3-Ubuntu-14.04.x86_64.tar.gz
sudo ./install.sh

# add CRAN mirror
echo "deb http://cran.revolutionanalytics.com/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

# install RStudio
sudo apt-get install gdebi libapparmor1 -y

# Go get the latest from http://www.rstudio.com/products/rstudio/download-server/ if you don't like my hard-coding
wget http://download2.rstudio.org/rstudio-server-0.98.1091-amd64.deb
sudo gdebi --non-interactive rstudio-server-0.98.1091-amd64.deb

echo "######################################################"
echo ""
echo "Creating user for RStudio"
echo "Choose your password for rstudiouser"
echo ""
echo "######################################################"

sudo adduser rstudiouser


# get your AWS instance public hostname
pubdns=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

echo "######################################################"
echo ""
echo "Your RStudio Server login is accessible from:"
echo "http://$pubdns:8787"
echo ""
echo "This is based on your Public DNS name and can change if you shutdown and bootup again"
echo ""
echo "######################################################"
