#!/bin/sh
# this script installs the necessary packages for a secure RHEL/CentOS Jamf Pro server
# This mostly follows the Jamf Pro installation guide, but I also add EPEL
# packages for some software I enjoy having on servers. 
yum update -y

echo "Installing essential packages"
# Enables EPEL and installs important tools
yum install epel-release -y && yum groupinstall 'Development Tools' -y

# These are important linux packages that I always include on any server build
# These tend to be mostly automatically installed, but I like to double check
yum install microcode_ctl linux-firmware -y && yum install kernel-devel kernel-debug-devel dkms -y

# This will enable DNF and SSH, and supply network troubleshooting tools
yum install dnf fail2ban openssh-server bind-utils net-tools -y
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload
echo "Ensure to configure SSH and Fail2ban!"
sleep 4

# These packages below are useful, but not always required. 
yum install vim check git tar gzip wget curl rsync nmon htop tmux zsh -y

# This will install Java and MySQL for Jamf Pro, then enable firewall rules
yum install java-11-openjdk-devel -y
cd /tmp
curl -OL https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum install mysql80-community-release-el7-*noarch.rpm -y
yum install mysql-community-server -y
/sbin/chkconfig --levels 345 mysqld on
systemctl start mysqld.service
echo "Grab the temporary password from here for the MySQL Secure Installation next:"
grep 'temporary password' /var/log/mysqld.log
sleep 4
mysql_secure_installation

# To do: add auto-download and auto-run for JSS from SMB distribution
firewall-cmd --permanent --add-port=8443/tcp
firewall-cmd --reload


echo "Install complete. Thanks for using this simple script!"
sleep 2

exit 0