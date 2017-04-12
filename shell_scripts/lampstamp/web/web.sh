#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update

# Upgrade
sudo apt -y upgrade

# Install Apache2
sudo apt -y install apache2

# Adding ServerName and IP
echo "ServerName 10.154.31.45" >> /etc/apache2/apache2.conf

# Restarting apache2
sudo systemctl restart apache2
