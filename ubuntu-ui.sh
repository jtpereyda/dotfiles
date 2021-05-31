#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

# scrot is for i3 screenshots
# vim-gtk3 enables vim clipboard features
# volumeicon-alsa for i3 volume icon
sudo apt install --assume-yes scrot vim-gtk3 volumeicon-alsa
