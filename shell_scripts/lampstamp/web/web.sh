#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update

# Upgrade
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Adding ServerName and IP
echo "ServerName 10.154.31.45" >> /etc/apache2/apache2.conf

# Edit dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf

# Restarting apache2
sudo systemctl restart apache2

# Install PHP and its dependencies
sudo apt install php libapache2-mod-php php-mcrypt php-mysql php-ssh2 -y
  
# Creating a file to test PHP on the server
echo "<?php
phpinfo();
?>" >> /var/www/html/info.php

# Download Wordpress
wget http://wordpress.org/latest.tar.gz -O ~/latest.tar.gz

# Unzip the WordPress file
tar xzvf ~/latest.tar.gz

# Copy file
cp ~/wordpress/wp-config-sample.php wp-config.php

# Edit the wp-config file to include user, database, and password
sed -i 's/define('DB_NAME'/define('DB_NAME', 'wordpress');/'
sed -i 'define('DB_USER'/define('DB_USER', 'wordpressuser');'
sed -i 'define('DB_PASSWORD'/define('DB_PASSWORD', 'password');/' /~/wordpress/wp-config.php
