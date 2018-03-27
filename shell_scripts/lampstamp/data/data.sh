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
sudo sed -i "/bind-address/c\bind-address = localhost" /etc/mysql/mysql.conf.d/mysqld.cnf

# Create database. user, password, and grant privileges in MySQL
mysql -uroot -ppassword -e "CREATE DATABASE wordpress;"
mysql -uroot -ppassword -e "CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';"
mysql -uroot -ppassword -e "FLUSH PRIVILEGES;"

# Restart MySQL
sudo systemctl restart mysql.service
 
# End of script message
echo "completed successfully!"
