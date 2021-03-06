#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Fedora based distros

FEDORA_VERSION=$(rpm -E %fedora)

# enable rpmfusion
sudo dnf install -y http://mirrors.lug.mtu.edu/rpmfusion/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm
sudo dnf install -y http://mirrors.lug.mtu.edu/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$FEDORA_VERSION.noarch.rpm

# vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf upgrade -y

sudo dnf install -y \
	adb \
	audacity \
	codium \
	compton \
	darktable \
	docker \
	feh \
  	flatpak \
  	git \
	gimp \
	gparted \
	gnupg2 \
	htop \
	i3 \
	octave \
	playerctl \
	rclone \
	neovim \
	VirtualBox \
	zsh

# pyenv dependencies
sudo dnf install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils

chsh -s $(which zsh)

../install-pyenv.sh
sudo ../install-rvm.sh
sudo ../flatpak/add-flathub-repo.sh
../flatpak/install-flatpaks.sh

echo "Installation complete, restart computer"
