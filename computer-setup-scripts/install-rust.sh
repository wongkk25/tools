#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "# rust\nsource $HOME/.cargo/env" >> ~/.zshrc
