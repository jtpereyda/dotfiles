#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################



########## Variables

dotfiles_dir=~/dotfiles/dotfiles
backup_dir=~/dotfiles_old             # old dotfiles backup directory
ubuntu_wsl_dir=~/dotfiles/os-specific/ubuntu-wsl/dotfiles
os_x_dir=~/dotfiles/os-specific/os-x/dotfiles

##########

mkdir -p $backup_dir

deploy_dotfiles() {
    local dotfiles_dir=$1

    echo "Deploying dotfile symlinks from $dotfiles_dir. Moving existing files to $backup_dir. ..."
    cd $dotfiles_dir
    for file in $dotfiles_dir/*; do
        local file_basename=$(basename $file)
        local dotfile_dest=~/.$file_basename
        echo "    $file_basename"
        if [ -e $dotfile_dest ]; then
            mv --backup=numbered $dotfile_dest $backup_dir
        fi
        ln -s $file $dotfile_dest
    done
    echo "done"
}

deploy_dotfiles $dotfiles_dir

while [ $# -gt 0 ]; do
    case "$1" in
        --ubuntu-wsl)
            deploy_dotfiles $ubuntu_wsl_dir
            shift
        ;;
        --os-x)
            deploy_dotfiles $os_x_dir
            shift
        ;;
    esac
done
