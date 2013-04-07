#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles # dotfiles directory
files="vimrc vim zshrc xinitrc mutt rc.lua xbindkeys xinitrc Xresources"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any desired dotfiles in homedir to $directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $dir"
    mv ~/.$file $dir/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
