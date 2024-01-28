#!/bin/bash

backups="$HOME/.configBackups"
# files
for file in .vimrc .bashrc .bash_aliases
do
  rm $HOME/$file
  mv $backups/$file $HOME
done

# dirs
configs="$HOME/.config"
rm $configs/ranger
mv $backups/ranger $configs

rmdir $backups
