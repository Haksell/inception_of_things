#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y curl git zsh

su -l vagrant -s "/bin/sh" -c "curl -fsSO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh; chmod 755 install.sh; ./install.sh --unattended"
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="superjarin"/g' /home/vagrant/.zshrc
chsh -s /bin/zsh vagrant
echo "cd /vagrant" >>/home/vagrant/.zshrc
