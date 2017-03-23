#!/bin/bash


cd /var/www/html/devpro
sudo npm install --no-bin-links
ng serve --host 0.0.0.0 --poll=2000
