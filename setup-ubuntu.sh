#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update
sudo apt-get install \
	adb \
  	flatpak \
  	git \
	gparted \
	gnupg2 \
	htop \
	nodejs \
	tmux \
	virtualbox \
	zsh

chsh -s /bin/zsh

sudo snap install code

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub \
	com.discordapp.Discord \
	com.jetbrains.IntelliJ-IDEA-Community \
	com.slack.Slack \
	com.spotify.Client \
 	org.audacityteam.Audacity \
	org.darktable.Darktable \
	org.gimp.GIMP \
	org.libreoffice.LibreOffice \
	org.mozilla.Thunderbird \
	org.octave.Octave \
	org.signal.Signal

curl https://rclone.org/install.sh | sudo bash

# lastly, upgrade existing binaries
sudo apt-get upgrade

# todo nvidia-graphics-drivers is broken
# nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-graphics-drivers-450

# todo move to separate setup file, fix broken installation of this + needs dependencies
# pyenv
curl https://pyenv.run | bash
source ./
pyenv install 3.8

# todo move to separate setup file
# rvm
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest

echo "Installation complete, restart computer"
