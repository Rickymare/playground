#!/usr/bin/env bash

set -e
set -u

# Updating APT cache 
sudo apt update -y

# Upgrading out of date apps
sudo apt upgrade -y
 
# Pre-seed debconf with MySQL server answers
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
 
# Install mySql server
sudo apt install mysql-server -y
 
# Edit the bind address with ip address
sudo sed -i 's/bind-address/bind-address = localhost/' /etc/mysql/mysql.conf.d/mysqld.cnf
