

















#ubuntu16.04
# Step 1 Intall PHP and MYSQL
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mariadb-server mariadb-client

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

sudo apt install  php7.2
sudo apt-get install  libpcre3 libssl1.1 php-common 
sudo apt-get install php7.2-common php7.2-json php7.2-opcache php-apcu php7.2-readline php7.2-cli libapache2-mod-php7.2  

sudo apt-get install  php7.2-common libjbig0 libwebp6 libgd3 libzip5 
sudo apt-get install php7.2-gd php7.2-intl php7.2-mbstring php7.2-mcrypt php7.2-mysql php7.2-soap php7.2-xml php7.2-xmlrpc php7.2-zip

sudo apt-get  install php-pear php-imagick php7.2-imap php-memcache  php7.2-pspell php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-xsl php-gettext
sudo apt-get install  php7.2-curl php7.2-mysql  php7.2-mbstring php7.2-zip

sudo phpenmod mbstring
sudo phpenmod mcrypt
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart


sudo mysql_secure_installation
# Enter current password for root (enter for none):  enter
# Set root password? [Y/n] Y
# New password: root
# Re-enter new password:root 
# Remove anonymous users? [Y/n] Y
# Disallow root login remotely? [Y/n] n
# Remove test database and access to it? [Y/n] y
# Reload privilege tables now? [Y/n] Y

sudo vim /etc/mysql/my.cnf
# after  group: [mysqld]
# input: sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

sudo nano /etc/php/7.1/apache2/php.ini

# file_uploads = On
# allow_url_fopen = On
# memory_limit = 256M
# upload_max_filesize = 100M
# max_execution_time = 360
# date.timezone = Asia/Bangkok

sudo /etc/init.d/apache2 restart
# Output: http://10.9.1.3

# Step 2: Install phpmyadmin 

# phpmyadmin acc admin | admin 
sudo apt-get install phpmyadmin
sudo mysql -u root -p
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

sudo /etc/init.d/apache2 restart





# step 3 install composer => 5p
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"


#step 4 => install virualhost. => 5p

# follow virtualhost file





