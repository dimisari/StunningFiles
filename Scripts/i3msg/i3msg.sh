
# paths
scripts_dir=$HOME/StunningFiles/Scripts/i3msg
tasks_script=$scripts_dir/open_tasks.sh
pdf_script=$scripts_dir/pdf.sh

# execute
terminal=i3-sensible-terminal
brave="brave-browser --password-store=basic"

# give it time to build every workspace, it's very calming
wait_time=3

# you shall begin
i3-msg "workspace 1; workspace 1👨‍💻; exec $terminal;"; sleep $(($wait_time/2))
i3-msg "exec $terminal"; sleep $(($wait_time/2))

i3-msg "workspace 2👨‍💻; exec $tasks_script;"; sleep $(($wait_time/2))
i3-msg "exec $terminal"; sleep $(($wait_time/2))

i3-msg "workspace 3📖; exec $pdf_script"
sleep $wait_time

i3-msg "workspace 4🏄; exec $brave --new-window gmail.com"
sleep $wait_time

i3-msg "workspace 5📹; exec $brave --new-window youtube.com"
sleep $wait_time

i3-msg "workspace 6💬; exec signal-desktop"
sleep $wait_time

i3-msg "workspace 1👨‍💻"
