#!/bin/bash
ufw allow ssh
ufw enable
ufw reload
apt update && apt upgrade -y
apt install intel-microcode build-essential dkms linux-headers-$(uname -r)
apt install sudo vim open-vm-tools openssh-server ufw molly-guard fail2ban dnsutils net-tools
apt install gcc make check git tar gzip wget curl rsync nmon htop tmux neofetch zsh bpytop
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

exit 0