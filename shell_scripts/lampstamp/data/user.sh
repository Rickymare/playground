# Login to mysql
mysql -u root -p

# Create database
CREATE DATABASE wordpress;

# Create user and password
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';

# Grant privileges
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@10.154.31.45;

# Flushing dawgs
FLUSH PRIVILEGES;

# Lets go!
exit

# Downloading the latest WordPress
cd ~
wget http://wordpress.org/latest.tar.gz

# Unzip!
tar xzvf latest.tar.gz

