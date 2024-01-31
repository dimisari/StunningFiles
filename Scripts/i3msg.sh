
pdf_script=$HOME/StunningFiles/Scripts/pdf.sh
wait_time=2

i3-msg "workspace 1; workspace 1👨‍💻; exec i3-sensible-terminal"
sleep $wait_time
i3-msg "workspace 2👨‍💻; exec i3-sensible-terminal"
sleep $wait_time
i3-msg "workspace 3📖; exec $pdf_script"
sleep $wait_time
i3-msg "workspace 4🏄; exec brave-browser --password-store=basic"
sleep $wait_time
i3-msg "workspace 5📹; exec brave-browser --new-window youtube.com --password-store=basic"
sleep $wait_time
i3-msg "workspace 6💬; exec signal-desktop"
