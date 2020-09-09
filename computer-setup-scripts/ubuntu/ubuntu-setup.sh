#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

# add a bunch of repos
sudo add-apt-repository -y ppa:ubuntuhandbook1/audacity
sudo add-apt-repository -y ppa:alexlarsson/flatpak

# darktable
echo 'deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/graphics:darktable.list
curl -fsSL https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/graphics:darktable.gpg > /dev/null

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

sudo apt-get update
sudo apt-get install -y \
	adb \
	audacity \
	codium \
	darktable \
	docker.io \
	fcitx-bin \
	fcitx-googlepinyin \
	fcitx-mozc \
  	flatpak \
  	git \
	gimp \
	gparted \
	gnupg2 \
	htop \
	nodejs \
	octave \
	rclone \
	signal-desktop \
	tmux \
	vim-gtk \
	virtualbox \
	zsh

chsh -s /bin/zsh

./install-pyenv.sh
sudo ../install-rvm.sh
sudo ../install-flatpaks.sh

sudo apt upgrade

echo "Installation complete, restart computer"
