#!/usr/bin/env bash

echo "--- Lets start to setup your computer. ---"

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- MySQL ---"
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "--- Installiing some requirments ---"
sudo apt-get install -y vim curl python-software-properties

echo "--- Lets install latest php version ---"
sudo add-apt-repository -y ppa:ondrej/php5

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Installing PHP-specific packages ---"
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core

echo "--- Installing and configuring Xdebug ---"
sudo apt-get install -y php5-xdebug

cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

echo "--- Enabling mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Lets setup php error ---"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

echo "--- Restarting Apache ---"
sudo service apache2 restart

echo "--- Lets install composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Lets install laravel too! ---"
wget http://laravel.com/laravel.phar
sudo mv laravel.phar /usr/local/bin/laravel

echo "--- Lets install NodeJS ---"
wget http://nodejs.org/dist/v0.10.24/node-v0.10.24.tar.gz
tar -xvf node-v0.10.24.tar.gz
cd node-v0.10.24 && ./configure && make && sudo make install

echo "--- Lets install RVM & RAILS ---"
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core \
zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev \
libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison && curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled 
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile 
source ~/.rvm/scripts/rvm
type rvm | head -n 1
rvm install 2.0.0-p353 && rvm use --default 2.0.0-p353 && ruby -v && gem install rails --pre

echo "--- Installing GulpJS and some dependencies ---"
sudo gem install sass
sudo npm install -g coffee-script
sudo npm install gulp
sudo npm install gulp-minify-css
sudo npm install gulp-autoprefixer
sudo npm install gulp-notify
sudo npm install gulp-ruby-sass 
sudo npm install gulp-coffee
sudo npm install gulp-concat
sudo npm install gulp-uglify
sudo npm install gulp-imagemin

echo "--- Lets install SublimeText ---"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer

echo "--- Lets install VirtualBox ---"
wget http://download.virtualbox.org/virtualbox/4.3.10/virtualbox-4.3_4.3.10-93012~Ubuntu~precise_amd64.deb
sudo dpkg -i virtualbox-4.3_4.3.10-93012~Ubuntu~precise_amd64.deb
										
echo "--- Lets install Vagrant ---"
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.2_x86_64.deb
sudo dpkg -i vagrant_1.5.2_x86_64.deb

echo "--- Lets install Dropbox ---"
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb
sudo dpkg -i dropbox_1.6.0_amd64.deb

echo "--- Lets install VLC Player ---"
sudo apt-get install -y vlc browser-plugin-vlc

echo "--- All done folks! ---"
