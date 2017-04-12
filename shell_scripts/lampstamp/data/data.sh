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
sed -i 's/bind-address/bind-address = 10.154.31.192/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Create usernames and passwords
 
# Install PHP and its dependencies
sudo apt -y install php libapache2-mod-php php-mcrypt php-mysql
 
# Edit dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" >> /etc/apache2/mods-enabled/dir.conf
 
# Restart the Apache2 server
sudo systemctl restart apache2
 
# Creating a file to test PHP on the server
echo "<?php
phpinfo();
?>" >> /var/www/html/info.php
                                  
