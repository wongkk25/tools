#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

# add a bunch of repos
sudo add-apt-repository -y ppa:ubuntuhandbook1/audacity
sudo add-apt-repository -y ppa:alexlarsson/flatpak

# vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

sudo apt-get update
sudo apt-get install -y \
	adb \
	audacity \
	codium \
	compton \
	fcitx-bin \
	fcitx-googlepinyin \
	fcitx-mozc \
	feh \
  	flatpak \
  	git \
	gimp \
	gparted \
	gnupg2 \
	htop \
	i3-wm \
	i3status \
	neovim \
	nodejs \
	octave \
	playerctl \
	rclone \
	rofi \
	tmux \
	virtualbox \
	zsh

chsh -s $(which zsh)

./install-pyenv-dependencies-ubuntu.sh
../install-pyenv.sh
sudo ../install-rvm.sh
sudo ../flatpak/add-flathub-repo.sh
../flatpak/install-flatpaks.sh

sudo apt upgrade -y

echo "Installation complete, restart computer"
