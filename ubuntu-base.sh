#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

#sudo apt update --assume-yes && sudo apt upgrade --assume-yes

# dev tools
sudo apt install --assume-yes curl tmux vim git python3 python-is-python3
#sudo apt install --assume-yes wireshark

# bc is needed for a workaround in dotfiles/tmux.conf
sudo apt install --assume-yes bc
