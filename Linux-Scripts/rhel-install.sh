#!/bin/sh
# This script installs the necessary packages for a secure RHEL/CentOS server
# This adds simple but powerful cli tools, security updates, and more. 
# Several things should be installed by default, but I include them here to be safe.

yum update -y
sleep 2

# Enables EPEL, Extra Packages for Enterprise Linux. This is a well known package stream
# that most people agree is safe to use. 
yum install epel-release -y
sleep 2

# These are important linux packages that I always include on any server build
# These tend to be mostly automatically installed, but I like to double check
yum install microcode_ctl linux-firmware -y
yum install kernel-devel kernel-debug-devel dkms -y
sleep 2

# This will enable DNF and SSH, and supply network troubleshooting tools
yum groupinstall 'Development Tools' -y
yum install dnf gcc fail2ban openssl openssl-devel openssh-server bind-utils net-tools -y
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload
sleep 2

# These packages below are useful, but not always required. 
yum install vim python3 python3-psutil check git tar gzip wget curl rsync nmon htop tmux zsh -y

curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
yum install neofetch -y

cd /tmp
git clone https://github.com/aristocratos/bpytop.git
cd /tmp/bpytop
make install
sleep 2

echo "Install complete. You should reboot now and configure SSH and Fail2Ban afterwards."
echo "Thanks for using this simple script!"

exit 0