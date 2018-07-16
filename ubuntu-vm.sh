#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

$DIR/ubuntu.sh

gsettings set org.gnome.desktop.session idle-delay 0  # don't lock VMs on idle
