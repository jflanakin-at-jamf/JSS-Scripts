#!/bin/bash

apt update -y
apt install intel-microcode build-essential dkms linux-headers-$(uname -r) -y
apt install sudo vim open-vm-tools openssh-server ufw molly-guard fail2ban dnsutils net-tools -y
apt install gcc make check git tar gzip wget curl rsync nmon htop tmux neofetch zsh bpytop -y
apt install default-jdk -y

