#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update
sudo apt-get install \
	adb \
	docker.io \
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

# zsh has some issues with detecting snap packages; below line should fix them
emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

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

chmod 755 *
sudo ./setup-pyenv-ubuntu.sh
sudo ./setup-rvm.sh

# todo nvidia-graphics-drivers is broken
# nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-graphics-drivers-450

./setup-rvm.sh

echo "Installation complete, restart computer"
