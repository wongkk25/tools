#!/bin/bash

# script to install a bunch of random apps I use sometimes, after OS clean install
# for Ubuntu based distros

#sudo add-apt-repository ppa:alexlarsson/flatpak

# vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

sudo apt-get update
sudo apt-get install \
	adb \
	codium \
	docker.io \
	fcitx-bin \
	fcitx-googlepinyin \
	fcitx-mozc \
  	flatpak \
  	git \
	gparted \
	gnupg2 \
	htop \
	nodejs \
	tmux \
	virtualbox \
	zsh

sudo ./setup-darktable-ubuntu.sh

#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#flatpak install flathub \
#	com.discordapp.Discord \
#	com.slack.Slack \
#	com.spotify.Client \
 #	org.audacityteam.Audacity \
#	org.gimp.GIMP \
#	org.libreoffice.LibreOffice \
#	org.mozilla.Thunderbird \
#	org.octave.Octave \
#	org.signal.Signal

curl https://rclone.org/install.sh | sudo bash

# lastly, upgrade existing binaries
sudo apt-get upgrade

sudo ./setup-pyenv-ubuntu.sh
sudo ./setup-rvm.sh

chsh -s /bin/zsh

echo "Installation complete, restart computer"
