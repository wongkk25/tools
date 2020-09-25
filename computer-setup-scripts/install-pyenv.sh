#!/bin/sh

curl https://pyenv.run | bash

eval "$(pyenv init -)"

# install latest version
pyenv install $(pyenv install -l | grep -v "[a-z]" | tail -1)

# install python 2
pyenv install 2.7.18

exit
