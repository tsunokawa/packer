#!/bin/sh

set -ex

# Vagrant用の公開鍵を登録
mkdir ~/.ssh
chmod 0700 ~/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

echo 'vagrant' | sudo -S sh -c "echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant"
echo 'vagrant' | sudo -S chmod 0440 /etc/sudoers.d/vagrant

#setenforce 0
#sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
#sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

sudo apt-get -y upgrade
sudo apt-get -y install binutils cpp cpp-6 fakeroot gcc gcc-6 libasan3 libatomic1 libc-dev-bin libc6 libc6-dev libcc1-0 libcilkrts5 libfakeroot libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx2 libquadmath0 libtsan0 libubsan0 linux-libc-dev make manpages-dev patch dkms

sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt

sudo apt-get -y dist-upgrade
sudo apt-get clean

