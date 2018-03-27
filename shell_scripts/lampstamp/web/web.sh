!/usr/bin/env bash

set -e
set -u

# Update APT cache
sudo apt update

# Upgrade
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Install PHP and its dependencies
sudo apt install php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-mysql php7.0-gd php-ssh2 -y

# Install MySQL
sudo apt install mysql-client -y

# Adding ServerName and IP
echo "ServerName localhost" | sudo tee --append /etc/apache2/apache2.conf

# Edit dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" | sudo tee /etc/apache2/mods-enabled/dir.conf

# Download Wordpress
wget http://wordpress.org/latest.tar.gz -O ~/latest.tar.gz

# Unzip WordPress file
sudo tar xzvf ~/latest.tar.gz -C /

# Copy wp-config-sample.php to wp-config.php
sudo cp /wordpress/wp-config-sample.php /wordpress/wp-config.php

# Edit the wp-config file to include user, database, and password
sudo sed -i "/DB_NAME/c\define('DB_NAME', 'wordpress');/" /wordpress/wp-config.php

sudo sed -i "/DB_USER/c\define('DB_USER', 'wordpressuser');" /wordpress/wp-config.php

sudo sed -i "/DB_PASSWORD/c\define('DB_PASSWORD', 'password');/" /wordpress/wp-config.php

sudo sed -i "/DB_HOST/c\define('DB_HOST', 'localhost');" /wordpress/wp-config.php

# Copy Wordpress folder into document root
sudo rsync -avP /wordpress/ /var/www/html/

# Creating uploads folder
sudo mkdir -p /var/www/html/wp-content/uploads

# Giving permissions to user and group
sudo chown -R ubuntu:www-data /var/www/html

# Restarting apache2
sudo systemctl restart apache2

# end of script
echo "successfully completed"
