#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update
sudo apt-get install \
	adb \
  flatpak \
	gparted \
	htop \
	nodejs \
	virtualbox \
	zsh

chsh -s /bin/zsh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub \
	com.discordapp.Discord \
	com.jetbrains.IntelliJ-IDEA-Community \
	com.slack.Slack \
	com.spotify.Client \
	com.visualstudio.code \
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

# nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-graphics-drivers-450

# pyenv
curl https://pyenv.run | bash
reset
pyenv latest install
pyenv latest install 2.7

# rvm
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
reset
rvm install ruby --latest

# hosts
sudo zsh -c ' wget https://someonewhocares.org/hosts/zero/hosts > /etc/hosts'

sudo reboot
