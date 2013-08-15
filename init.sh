#!/bin/sh
# Update the image
sudo apt-get update
sudo apt-get install -y software-properties-common

# Install necessary packages
sudo apt-get install -y zsh make vim tmux curl wget sqlite3 libsqlite3-dev libssl-dev openssl zlib1g zlib1g-dev zlibc libxslt-dev libxml2-dev g++ build-essential libreadline6-dev texinfo git python-software-properties python g++ make

# Install nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install postgresql
sudo add-apt-repository ppa:pitti/postgresql
sudo apt-get update
sudo apt-get install -y libpq-dev
sudo apt-get install -y postgresql-9.2
sudo apt-get install -y postgresql-client-9.2
sudo apt-get install -y postgresql-server-dev-9.2
sudo apt-get install -y postgresql-contrib-9.2

# Change setting for vagrant user
cd /home/vagrant
# Install oh-my-zsh
chsh -s /bin/zsh vagrant
sudo -u vagrant -H curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sudo -u vagrant -H sh

# Install rbenv
sudo -u vagrant -H git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
sudo -u vagrant -H echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.zshrc
sudo -u vagrant -H echo 'eval "$(rbenv init -)"' >> /home/vagrant/.zshrc

# Install ruby-build
sudo -u vagrant -H git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
sudo -u vagrant -H git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash
# Install ruby 2.0
sudo -u vagrant -H /home/vagrant/.rbenv/bin/rbenv install 2.0.0-p247
sudo -u vagrant -H /home/vagrant/.rbenv/bin/rbenv global 2.0.0-p247
sudo -u vagrant -H /home/vagrant/.rbenv/shims/gem install bundle pry awesome_print
