#!/usr/bin/env bash

# Run this script if data.sh or web.sh was unsuccessful. This script will remove the files that were added so we can try again with a fresh install.

# remove everything
sudo apt remove apache2 mysql-server php libapache2-mod-php php-mcrypt php-mysql php5-gd libssh2-php -y

# Remove dependencies
sudo apt autoremove -y
