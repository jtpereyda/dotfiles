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
        local file_basename="$(basename $file)"
        local dotfile_dest=~/."$file_basename"
        echo "    $file_basename"
        # if dest is a file, back it up
        if [ -f "$dotfile_dest" ]; then
            mv --backup=numbered "$dotfile_dest" "$backup_dir"
        fi
        # if dotfile is a directory, recurse
        if [ -d "$file" ]; then
            echo "INFO: Recursing into $file $dotfile_dest $backup_dir/$file_basename"
            deploy_files "$file" "$dotfile_dest" "$backup_dir/$file_basename"
        else
            ln -s "$file" "$dotfile_dest"
        fi
    done
    echo "done"
}

deploy_files() {
    local source_dir="$1"
    local dest_dir="$2"
    local back_dir="$3"
    mkdir -p "$dest_dir"
    mkdir -p "$back_dir"

    for file in $source_dir/*; do
        local file_basename="$(basename $file)"
        local dotfile_dest="$dest_dir/$file_basename"
        echo "    $dotfile_dest"
        # if dest is a file, back it up
        if [ -f "$dotfile_dest" ]; then
            mv --backup=numbered "$dotfile_dest" "$back_dir"
        fi
        # if dotfile is a directory, recurse
        if [ -d "$file" ]; then
            echo "INFO: Recursing into $file $dotfile_dest $back_dir/$file_basename"
            deploy_files "$file" "$dotfile_dest" "$back_dir/$file_basename"
        else
            ln -s "$file" "$dotfile_dest"
        fi
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
