#!/bin/bash

# darktable
sudo zypper --non-interactive --gpg-auto-import-keys addrepo https://download.opensuse.org/repositories/graphics:darktable/openSUSE_Tumbleweed/graphics:darktable.repo
# experimental hardware repo (for android tools)
sudo zypper --non-interactive --gpg-auto-import-keys addrepo https://download.opensuse.org/repositories/hardware/openSUSE_Tumbleweed/hardware.repo
# signal
#zypper --non-interactive --gpg-auto-import-keys addrepo https://download.opensuse.org/repositories/network:im:signal/openSUSE_Tumbleweed/network:im:signal.repo
# vscodium
# sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
# todo add check if vscodium.repo already exists
# printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/zypp/repos.d/vscodium.repo

sudo zypper --non-interactive --gpg-auto-import-keys refresh

sudo zypper --non-interactive --gpg-auto-import-keys in \
	       android-tools \
	       codium \
	       darktable \
	       fcitx \
	       fcitx-qt5 \
	       fcitx-googlepinyin \
	       fcitx-mozc \
	       feh \
	       flatpak \
	       git \
	       gparted \
	       gpg2 \
	       htop \
	       i3 \
	       nodejs \
	       tmux \
	       tumbleweed-cli \
	       virtualbox \
	       zsh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak --noninteractive install flathub \
	com.discordapp.Discord \
	com.jetbrains.IntelliJ-IDEA-Community \
	com.slack.Slack \
	com.spotify.Client \
 	org.audacityteam.Audacity \
	org.gimp.GIMP \
	org.libreoffice.LibreOffice \
	org.mozilla.Thunderbird \
	org.octave.Octave \
	org.signal.Signal

chsh -s /bin/zsh
