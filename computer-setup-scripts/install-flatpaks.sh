#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub \
	com.discordapp.Discord \
	com.spotify.Client \
	com.slack.Slack 
