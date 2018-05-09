#ubuntu16.04
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mariadb-server mariadb-client

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

sudo apt install  php7.1
sudo apt-get install  libpcre3 libssl1.1 php-common php7.1-common php7.1-json php7.1-opcache php-apcu php7.1-readline php7.1-cli libapache2-mod-php7.1 php7.1

sudo apt-get install  php7.1-common libjbig0 libwebp6 libgd3 libzip5 php7.1-curl php7.1-gd php7.1-intl php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-soap php7.1-xml php7.1-xmlrpc php7.1-zip

sudo apt-get  install php-pear php-imagick php7.1-imap php-memcache  php7.1-pspell php7.1-recode php7.1-sqlite3 php7.1-tidy php7.1-xsl php-gettext




sudo mysql_secure_installation
# Enter current password for root (enter for none):  enter
# Set root password? [Y/n] Y
# New password: root
# Re-enter new password:root 
# Remove anonymous users? [Y/n] Y
# Disallow root login remotely? [Y/n] n
# Remove test database and access to it? [Y/n] y
# Reload privilege tables now? [Y/n] Y

sudo nano /etc/php/7.1/apache2/php.ini

# file_uploads = On
# allow_url_fopen = On
# memory_limit = 256M
# upload_max_filesize = 100M
# max_execution_time = 360
# date.timezone = Asia/Bangkok

sudo /etc/init.d/apache2 restart
# Output: http://10.9.1.3

 
# phpmyadmin acc admin | admin 
sudo apt-get install phpmyadmin
sudo mysql -u root -p
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

sudo /etc/init.d/apache2 restart



sudo phpenmod mbstring
sudo phpenmod mcrypt
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart

# step 3 install composer => 5p
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"


#step 4 => install virualhost. => 5p

<VirtualHost *:80>
	DocumentRoot "/var/www/html/projects/sym/web"
	ServerName sym.local
	<Directory "/var/www/html/projects/sym/web">
		Options Indexes MultiViews FollowSymLinks
		allow from all
		AllowOverride All
		Options +Indexes
	</Directory>
</VirtualHost>
=> /etc/hosts => es.local
<VirtualHost *:80>
	DocumentRoot "/var/www/html/projects/es"
	ServerName es.local
	<Directory "/var/www/html/projects/es">
		Options Indexes MultiViews FollowSymLinks
		allow from all
		AllowOverride All
		Options +Indexes
	</Directory>
</VirtualHost>





