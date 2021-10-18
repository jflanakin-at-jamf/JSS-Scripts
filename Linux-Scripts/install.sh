#!/bin/sh
echo "Starting update"
sleep 2

yum update -y
echo "Update complete"
sleep 2

echo "Installing essential packages"
yum install epel-release -y && yum groupinstall 'Development Tools' -y
yum install microcode_ctl linux-firmware -y && yum install kernel-devel kernel-debug-devel dkms -y
yum install fail2ban openssh-server bind-utils net-tools -y
yum install gcc make vim check git tar gzip wget curl rsync nmon htop tmux zsh -y
yum install java-11-openjdk-devel -y
cd /tmp
curl -OL https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum install mysql80-community-release-el7-*noarch.rpm -y
yum install mysql-community-server -y
/sbin/chkconfig --levels 345 mysqld on
mysql_secure_installation

echo "Install complete. Thanks for using this simple script!"
sleep 2

exit 0