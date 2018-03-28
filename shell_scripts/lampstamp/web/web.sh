#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update -y

# Upgrade the apt repos to ensure we install the LTS
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Install PHP and the dependencies
sudo apt install php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-mysql php7.0-gd php-ssh2 -y

# Install MySQL client
sudo apt install mysql-client -y

# Adding ServerName and IP
echo "ServerName localhost" | sudo tee --append /etc/apache2/apache2.conf

# Edit the dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" | sudo tee /etc/apache2/mods-enabled/dir.conf

# Download Wordpress into /tmp directory
wget http://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz

# Unzip the WordPress
sudo tar xzvf /tmp/latest.tar.gz -C /

# Copy the wp-config-sample.php to wp-config-php
sudo cp /wordpress/wp-config-sample.php /wordpress/wp-config.php

# Edit the wp-config file to include databse, user, password, and data IP
sudo sed -i "/DB_NAME/c\define('DB_NAME', 'wordpress');" /wordpress/wp-config.php

sudo sed -i "/DB_USER/c\define('DB_USER', 'wordpressuser');" /wordpress/wp-config.php

sudo sed -i "/DB_PASSWORD/c\define('DB_PASSWORD', 'password');" /wordpress/wp-config.php

sudo sed -i "/DB_HOST/c\define('DB_HOST', 'localhost');" /wordpress/wp-config.php

# Copy WordPress folder into document root
sudo rsync -avP /wordpress/ /var/www/html/

# Creating an uploads folder
sudo mkdir /var/www/html/wp-content/uploads

# Giving permissions to user and group(apache2) 
sudo chown -R ubuntu:www-data /var/www/html

# Restarting apache2
sudo systemctl restart apache2

# Confirming script is comple
echo "Successfully completed"
