#!/usr/bin/env bash

polybar-msg cmd quit
killall polybar

config_file=$HOME/.config/polybar/config.ini
up_log_file=/tmp/up.log
down_log_file=/tmp/down.log

# Launch bars
echo "---" | tee -a $up_log_file $down_log_file
polybar --config=$config_file up 2>&1 | tee -a $up_log_file & disown
polybar --config=$config_file down 2>&1 | tee -a $down_log_file & disown

echo "Bars launched..."
