#!/bin/sh

set -ex

# password-less login
mkdir ~/.ssh
chmod 0700 ~/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# password-less sudo
echo 'vagrant' | sudo -S sh -c "echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant"
echo 'vagrant' | sudo -S chmod 0440 /etc/sudoers.d/vagrant

#apt-get -y install sudo
#apt-get -y upgrade
#groupadd vagrant
#useradd vagrant -g vagrant -G wheel
#echo "vagrant"|passwd --stdin vagrant
#echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
#chmod 0440 /etc/sudoers.d/vagrant

#/usr/sbin/setenforce 0
#sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
#sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

#apt-get -y install gcc make automake autoconf libtool gcc-c++ kernel-headers-`uname -r` kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget nfs-utils bind-utils bzip2 git

#apt-get -y install dkms

# Vagrant用の公開鍵を登録
#mkdir -pm 700 /home/vagrant/.ssh
#wget --no-check-certificate 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
#chmod 0600 /home/vagrant/.ssh/authorized_keys
#chown -R vagrant /home/vagrant/.ssh

#cd /tmp
#mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
#sh /mnt/VBoxLinuxAdditions.run
#umount /mnt

#/etc/rc.d/init.d/vboxadd setup
#/sbin/rcvboxadd setup

