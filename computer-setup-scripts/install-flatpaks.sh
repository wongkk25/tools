#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub \
	com.discordapp.Discord \
	com.jetbrains.IntelliJ-IDEA-Community \
	com.spotify.Client \
	com.slack.Slack 
