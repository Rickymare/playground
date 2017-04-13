#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update -y

# Upgrade
sudo apt upgrade
 
# Pre-seed debconf with MySQL server answers
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
 
# Install mySql server
sudo apt -y install mysql-server
 
# Edit the bind address with ip address
sed -i 's/bind-address/bind-address = 10.154.31.45/' /etc/mysql/mysql.conf.d/mysqld.cnf
