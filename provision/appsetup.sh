#!/bin/bash

sudo npm install -g typescript --no-bin-links
sudo npm install -g concurrently --no-bin-links
sudo npm install -g lite-server --no-bin-links
cd /var/www/html/dev
echo "before npm install"
npm install --no-sys-links
