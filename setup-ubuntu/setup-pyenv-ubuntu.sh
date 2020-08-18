#!/bin/bash

curl https://pyenv.run | bash

sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
	libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
	xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

exec zsh

pyenv install 3.8.15
pyenv install 2.7.18

exit
