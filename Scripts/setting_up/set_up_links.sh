#!/bin/bash

backups="$HOME/.configBackups"
config="$HOME/.config"

mkdir $backups
for file in $HOME/.vimrc $HOME/.bashrc $HOME/.bash_aliases $config/i3/config \
            $config/picom/picom.conf
do
  mv -f $HOME/$file $backups
done

stunningConfigs="$(cd $(dirname $0)/../../Configs && pwd)"

for file in .vimrc bash/.bashrc bash/.bash_aliases
do
  ln -s $stunningConfigs/$file $HOME
done

source "$HOME/.bashrc"

configs="$HOME/.config"
mv -f $configs/ranger $backups
ln -s $stunningConfigs/ranger $configs/ranger
