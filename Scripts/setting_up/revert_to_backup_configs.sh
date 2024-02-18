#!/bin/bash

# backup directory
backups=$HOME/.configBackups

# remove configs from home directory and put the backups instead
for file in .bashrc .bash_aliases .vimrc
do
  rm -fv $HOME/$file

  echo "Moving the file '$backups/$file' to '$HOME'"
  mv -f $backups/$file $HOME
done

# standard configs directory
configs=$HOME/.config

# remove config dirs from configs directory and put the backups instead
for dir in i3 polybar ranger picom
do
  rm -f $configs/$dir

  echo "Moving the file '$backups/$dir' to '$configs'"
  mv -f $backups/$dir $configs
done

rmdir $backups
