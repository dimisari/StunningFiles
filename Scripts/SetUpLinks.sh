#!/bin/bash

backups="$HOME/.configBackups"
mkdir $backups

for file in .vimrc .bashrc .bash_aliases
do
  mv -f $HOME/$file $backups
done

cd ../Configs
stunningConfigs="$(pwd)"

for file in .vimrc bash/.bashrc bash/.bash_aliases
do
  ln -s $stunningConfigs/$file $HOME
done

source "$HOME/.bashrc"

configs="$HOME/.config"
mv -f $configs/ranger $backups
ln -s $stunningConfigs/ranger $configs/ranger
