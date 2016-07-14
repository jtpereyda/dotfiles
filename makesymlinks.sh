#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles_dir=~/dotfiles
backup_dir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc hgrc gitconfig vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir

##########

echo -n "Creating \"$backup_dir\" for backup of any existing dotfiles in ~ ..."
mkdir -p $backup_dir
echo "done"

echo -n "Changing directory to \"$dotfiles_dir\"..."
cd $dotfiles_dir
echo "done"

echo "Deploying dotfile symlinks. Moving existing files to $backup_dir. ..."
for file in $files; do
    if [ -f $dotfiles_dir/$file ]; then
        echo "$file"
        if [ -f ~/.$file ]; then
            mv -b ~/.$file ~/dotfiles_old/
        fi
        ln -s $dotfiles_dir/$file ~/.$file
    fi
done
echo "done"
