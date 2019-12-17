#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

#unlink default values for nginx
sudo unlink /etc/nginx/sites-enabled/default

# change reverse-proxy file
sudo rm /etc/nginx/sites-available/reverse-proxy.conf
sudo ln -s /home/ubuntu/app/reverse-proxy.conf /etc/nginx/sites-available/reverse-proxy.conf

# links sites-available to sites-enabled
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# restarts nginx to refresh config
sudo service nginx restart
