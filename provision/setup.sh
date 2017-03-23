#!/bin/bash

echo "Provision VM DevOps"
apt-get update
echo "installing git"
apt-get install git -y

echo "installing nodejs"
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs
apt-get install npm
node -v

echo "installing pip"
cd /tmp
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py

echo "installing aws cli"
pip install awscli
pip install --upgrade awscli


echo "update time zone"
ntpdate time.nist.gov


printf "Making sure ownership rights are correct in vagrant user directory..."
# make sure everything in the vagrant directory is owned by vagrant
chown -R vagrant:vagrant /home/vagrant --quiet

cd /var/www/html/dev
echo "before npm install"
sudo chown -R $(whoami) ~/.npm
sudo chown -R $(whoami) /usr/lib/node_modules
sudo chown -R $(whoami) /usr/local/lib/node_modules
sudo npm install npm
sudo npm install -g serverless
sudo npm install -g typescript
sudo npm install -g concurrently
sudo npm install -g lite-server
sudo npm install -g @angular/cli
