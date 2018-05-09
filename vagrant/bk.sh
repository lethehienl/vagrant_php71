
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6
sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
sudo apt-get install php5.6-gd
sudo apt-get install php5.6-soap

sudo /etc/init.d/apache2 restart

sudo apt-get install mysql-server -y
sudo add-apt-repository ppa:nijel/phpmyadmin
sudo apt-get update
sudo apt-get install php5-mysqlnd

sudo apt-get install phpmyadmin

sudo /etc/init.d/apache2 restart
sudo phpenmod mbstring
sudo phpenmod mcrypt
sudo a2enmod rewrite
sudo apt-get install curl libcurl3 libcurl3-dev php5.6-curl
sudo apt-get install php-mbstring php7.0-mbstring php-gettext
sudo /etc/init.d/apache2 restart


#sass
apt-get install ruby
apt-get install software-properties-common
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install python-software-properties python g++ make nodejs
apt install npm
npm install -g bower grunt-cli
gem install foundation
gem install compass
gem install sass

#drush
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

apt install drush
#To install Drush 6.x (stable):
composer global require drush/drush:6.*
#To install Drush 7.x (dev) which is required for Drupal 8:
composer global require drush/drush:dev-master
#composer global require drush/drush:7.*

method2:
$ cd /usr/share
$ sudo git clone https://github.com/drush-ops/drush.git drush7
$ sudo ln -sf /usr/share/drush7/drush /usr/bin/etc


sudo ln -sf /usr/local/bin/drush6/drush /usr/bin/etc


drush @none dl registry_rebuild
drush rr
