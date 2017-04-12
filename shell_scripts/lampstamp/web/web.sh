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

# Edit dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf

# Restarting apache2
sudo systemctl restart apache2

# Creating a file to test php
echo "<?php
phpinfo();
?>" >> /var/www/html/info.php
