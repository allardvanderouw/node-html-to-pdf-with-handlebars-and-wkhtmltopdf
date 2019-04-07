#!/usr/bin/env bash

# Add apt sources
# - Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# - Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# Update apt
apt-get update

# Upgrade installed packages
apt-get upgrade -y

# Install development packages
apt-get install -y ntp
apt-get install -y git
apt-get install -y yarn

# Install tool packages
apt-get install -y nodejs
# - wkhtmltopdf & xvfb (xvfb is required to run wkhtmltopdf on Debian)
apt-get install -y xvfb
apt-get install -y wkhtmltopdf

# Cleanup
apt-get autoremove -y
apt-get autoclean -y

# Update npm
sudo npm install -g npm npm-check-updates

# Install node-gyp globally to prevent Yarn issues
sudo npm install -g node-gyp

# Export environment variables in a new .bash_profile
sudo rm /home/vagrant/.bash_profile
sudo touch /home/vagrant/.bash_profile
sudo echo "export PORT=${PORT}" >> /home/vagrant/.bash_profile
sudo echo "export PDF_COMMAND=\"${PDF_COMMAND}\"" >> /home/vagrant/.bash_profile

# Initialize database
cd /vagrant && rm -rf node_modules/ && yarn install
