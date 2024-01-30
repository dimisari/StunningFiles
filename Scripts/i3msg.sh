
pdf_script=$HOME/StunningFiles/Scripts/pdf.sh

i3-msg "workspace 1; workspace 1👨‍💻terminal; exec i3-sensible-terminal"
sleep 1
i3-msg "workspace 2🏄browser; exec brave-browser; exec brave-browser --new-window"
sleep 1
i3-msg "workspace 3📖pdf; exec $pdf_script"
sleep 1
i3-msg "workspace 4📹youtube; exec brave-browser --new-window youtube.com"
sleep 1
i3-msg "workspace 5💬signal; exec signal-desktop"
