#!/bin/sh
# Update the image
sudo apt-get update
sudo apt-get install -y software-properties-common

# Install necessary packages
sudo apt-get install -y zsh make vim tmux curl wget sqlite3 libsqlite3-dev libssl-dev openssl zlib1g zlib1g-dev zlibc libxslt-dev libxml2-dev g++ build-essential libreadline6-dev texinfo git python-software-properties python

# Install nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install postgresql
echo "Writing /etc/apt/sources.list.d/pgdg.list ..."
sudo cat > /etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
EOF
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql


# Change setting for vagrant user
cd /home/vagrant
# Install oh-my-zsh
chsh -s /bin/zsh vagrant
sudo -u vagrant -H curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sudo -u vagrant -H sh

# Install rbenv
sudo -u vagrant -H git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv

# Install ruby-build
sudo -u vagrant -H git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
sudo -u vagrant -H git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash
# Install ruby 2.0
sudo -u vagrant -H /home/vagrant/.rbenv/bin/rbenv install 2.0.0-p247
sudo -u vagrant -H /home/vagrant/.rbenv/bin/rbenv global 2.0.0-p247
sudo -u vagrant -H /home/vagrant/.rbenv/shims/gem install bundle pry awesome_print

# Add dotfiles
sudo -u vagrant -H git clone https://github.com/linhmtran168/rails_vagrant_dotfiles.git /home/vagrant/dotfiles
sudo -u vagrant -H ln -sf /home/vagrant/dotfiles/.zshrc /home/vagrant/.zshrc
sudo -u vagrant -H ln -sf /home/vagrant/dotfiles/.tmux.conf /home/vagrant/.tmux.conf
