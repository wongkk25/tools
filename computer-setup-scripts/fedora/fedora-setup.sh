#!/bin/sh

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Fedora based distros

FEDORA_VERSION = $(rpm -E %fedora)

# enable rpmfusion
sudo dnf install -y http://mirrors.lug.mtu.edu/rpmfusion/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm http://mirrors.lug.mtu.edu/rpmfusion/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm

# vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf install -y \
	adb \
	audacity \
	codium \
	compton \
	darktable \
	docker \
	fcitx \
	fcitx-googlepinyin \
	fcitx-mozc \
	feh \
  	flatpak \
  	git \
	gimp \
	gparted \
	gnupg2 \
	htop \
	i3-gaps \
	nodejs \
	octave \
	playerctl \
	rclone \
	signal-desktop \
	neovim \
	virtualbox \
	zsh

chsh -s /bin/zsh

./install-pyenv.sh
sudo ../install-rvm.sh
sudo ../install-flatpaks.sh

echo "Installation complete, restart computer"
