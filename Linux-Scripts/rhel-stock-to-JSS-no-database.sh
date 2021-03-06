#!/bin/sh
# this script installs the necessary packages for a secure RHEL/CentOS Jamf Pro server
# This mostly follows the Jamf Pro installation guide, but I also add EPEL
# packages for some software I enjoy having on servers. 
dnf update -y
sleep 2

# Enables EPEL, Extra Packages for Enterprise Linux. This is a well known package stream
# that most people agree is safe to use. 
dnf install epel-release -y
dnf update -y
sleep 2

# These are important linux packages that I always include on any server build
# These tend to be mostly automatically installed, but I like to double check
dnf install microcode_ctl linux-firmware -y
dnf install kernel-devel kernel-debug-devel dkms -y
sleep 2

# This will enable DNF and SSH, and supply network troubleshooting tools
dnf install gcc fail2ban openssl openssl-devel openssh-server bind-utils net-tools -y
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload
sleep 2

# These packages below are useful, but not always required. 
dnf install vim bpytop python3 python3-psutil check git tar gzip wget curl rsync nmon htop tmux zsh -y

# This will install Java and MySQL for Jamf Pro, then enable firewall rules
yum install java-11-openjdk-devel -y
cd /tmp
curl -OL https://dev.mysql.com/get/mysql80-community-release-el8-3.noarch.rpm
yum install mysql80-community-release-el8-*noarch.rpm -y
yum update -y
yum install mysql -y
sleep 2

# To do: add auto-download and auto-run for JSS from SMB distribution
firewall-cmd --permanent --add-port=8443/tcp
firewall-cmd --reload

echo "Install complete. You should reboot now and configure SSH and Fail2Ban afterwards."
echo "Thanks for using this simple script!"
sleep 2

exit 0