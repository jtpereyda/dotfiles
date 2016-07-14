#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc hgrc gitconfig vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Replacing existing dotfiles with symlinks. Moving existing files to $olddir. ..."
for file in $files; do
    if [ -f ~/.$file ]; then
        mv -b ~/.$file ~/dotfiles_old/
        echo "$file"
        ln -s $dir/$file ~/.$file
    fi
done
echo "done"
