#!/bin/bash

sudo apt update -y
sudo apt install intel-microcode build-essential dkms linux-headers-$(uname -r) -y
sudo apt install sudo vim open-vm-tools openssh-server ufw molly-guard fail2ban dnsutils net-tools -y
sudo apt install gcc make check git tar gzip wget curl rsync nmon htop tmux neofetch zsh bpytop -y
sudo apt install default-jdk -y

cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.19-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.19-1_all.deb
sudo apt update
sudo apt install mysql-client -y

wget -qO - https://archive.services.jamfcloud.com/gpg-public-key.asc | sudo apt-key add -
sudo apt install software-properties-common -y
sudo add-apt-repository 'deb https://archive.services.jamfcloud.com/deb stable main'
sudo apt update
sudo apt install jamf-pro-server-tools


sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

exit 0