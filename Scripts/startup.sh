#!/bin/bash

lcases_dir=$HOME/Desktop/lambda-cases
desc_dir=$lcases_dir/description/description.ltx

# sleep 5
xdotool set_desktop 3
gnome-terminal -- sh -c "cd $desc_dir; vim description.tex" &
sleep 1
xdotool key alt+shift+j
sleep 1
okular $desc_dir/Pdf/description.pdf &
sleep 1
xdotool key alt+shift+m
sleep 1
xdotool set_desktop 2
gnome-terminal -- sh -c "cd $lcases_dir/other; vim current_tasks.txt" &
sleep 1
xdotool key alt+shift+j
