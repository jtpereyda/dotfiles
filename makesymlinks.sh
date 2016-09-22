#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles_dir=~/dotfiles/dotfiles
backup_dir=~/dotfiles_old             # old dotfiles backup directory

##########

echo -n "Creating \"$backup_dir\" for backup of any existing dotfiles in ~ ..."
mkdir -p $backup_dir
echo "done"

cd $dotfiles_dir

echo "Deploying dotfile symlinks. Moving existing files to $backup_dir. ..."
for file in $dotfiles_dir/*; do
    file_basename=$(basename $file)
    dotfile_dest=~/.$file_basename
    echo "    $file_basename"
    if [ -f $dotfile_dest ]; then
        mv -b $dotfile_dest ~/dotfiles_old/
    fi
    ln -s $file $dotfile_dest
done
echo "done"
