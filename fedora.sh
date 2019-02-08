#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

#sudo apt update --assume-yes && sudo apt upgrade --assume-yes

# dev tools
sudo yum install --assumeyes curl tmux vim git
#sudo yum install --assumeyes wireshark

# bc is needed for a workaround in dotfiles/tmux.conf
sudo yum install --assumeyes bc

$DIR/makesymlinks.sh

$DIR/install-vim-plugins.sh

$DIR/install-plugins.sh
