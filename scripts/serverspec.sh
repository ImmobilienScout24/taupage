#!/bin/bash
echo "Preparing Serverspec and running system tests..."
# sudo apt-get update &&
#<<<<<<< HEAD
#apt-get install -y ruby1.9.1
#gem install net-ssh -v 2.9.2 --no-ri --no-rdoc

#=======
# apt-get install -y ruby1.9.1
# Install ruby
add-apt-repository ppa:brightbox/ruby-ng-experimental
apt-get update
apt-get install -y ruby2.1
#>>>>>>> b7bee14886a6c3a159322f7aeaacfbb2e84cb67a
gem install bundler rake serverspec --no-ri --no-rdoc
chmod +x /tmp/scripts/serverspec.sh
cd /tmp/tests
rake
