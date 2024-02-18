#!/bin/bash

# directory where we're going to make backups of the existing files
config_backups_dir=$HOME/.configBackups
mkdir -p $config_backups_dir

# directory where all the new stunning configuration files are located
stunning_configs_dir="$(cd $(dirname $0)/../../Configs && pwd)"

for file in .bashrc .bash_aliases .vimrc
do
  # move the existing files from the home directory to the backup directory
  echo "Moving the file '$HOME/$file' to '$config_backups_dir'"
  mv -f $HOME/$file $config_backups_dir

  # link to the stunning home directory config file from the home directory
  echo "Linking"
  ln -sv $stunning_configs_dir/$file $HOME
done

# path of standard configuration files directory
config_dir=$HOME/.config

for dir in i3 polybar ranger picom
do
  # move existing directories into $config_backups_dir 
  echo "Moving '$config_dir/$dir' to '$config_backups_dir'"
  mv -f $config_dir/$dir $config_backups_dir

  # link to stunning directories from $config_dir 
  echo "Linking"
  ln -sv $stunning_configs_dir/$dir $config_dir
done
