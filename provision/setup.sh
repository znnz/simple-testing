#!/bin/bash

echo "Provision VM DevOps"
sudo apt-get update
echo "installing git"
apt-get install git -y

echo "installing nodejs"
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install npm
node -v

echo "installing pip"
cd /tmp
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

echo "installing aws cli"
sudo pip install awscli
sudo pip install --upgrade awscli

echo "installing serverless"
sudo npm install serverless -g

echo "update time zone"
sudo ntpdate time.nist.gov

sudo npm install typescript -g
sudo npm install concurrently -g
sudo npm install lite-server -g
sudo npm config set bin-links false
cd /var/www/html/dev
sudo npm install --no-optional
sudo npm start
