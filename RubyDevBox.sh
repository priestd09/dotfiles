#!/bin/bash 
echo "NodeJS kurulumundan gecildikten sonra kahvenizi alip 30-40dk mola verseniz yerinde olacaktir."
echo "Lutfen git email adresinizi giriniz (orn hakanersu@cimeyl.com)[ENTER]:"
read email
echo "Lutfen git kullanici adinizi giriniz (orn Hakan ERSU) [ENTER]:"
read kullanici

sudo apt-get update
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

echo "###################### GIT HESABINIZ YAPILANDIRILIYOR ########################"
git config --global color.ui true
git config --global user.name "$kullanici"
git config --global user.email "$email"
ssh-keygen -t rsa -C "$email"

echo "######################SSH KEY ##############################################"
cat ~/.ssh/id_rsa.pub
echo "#######################NODEJS YAPILANDIRILIYOR ####################################"
echo "Bu islem biraz zaman alabilir.Bastan derlemek en iyisidir."
wget http://nodejs.org/dist/v0.10.24/node-v0.10.24.tar.gz
tar -xvf node-v0.10.24.tar.gz
cd node-v0.10.24 && ./configure && make && sudo make install

# echo "RVM KURULUMUNA GECELIM"
# sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
# curl -L https://get.rvm.io | bash -s stable
# echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile 
# source ~/.rvm/scripts/rvm
# type rvm | head -n 1
# rvm install 2.1.2 && rvm use 2.1.2 --default && ruby -v && gem install rails --pre
# ruby -v
echo "RUBY'I DERLEYELIM RVM ILE ILGILI SIKINTILAR BULUNMAKTA"
cd
wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
tar -xzvf ruby-2.1.2.tar.gz
cd ruby-2.1.2/
./configure
make
sudo make install
ruby -v

echo "RAILS KURULUMU"
sudo gem install rails

echo "POSTGRESQL KURULUMU"
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.3 libpq-dev

echo "MYSQL KURULUMU"
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev


echo "QT YUKLENIYOR"
sudo apt-get install -y qt4-qmake
sudo apt-get install -y libqtwebkit-dev

git clone https://github.com/bulutfon/bulutfon.git

cd bulutfon
bundle