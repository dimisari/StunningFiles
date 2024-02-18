
# scripts directory
scripts_dir=$(cd $(dirname $0) && pwd)

# to execute
terminal=i3-sensible-terminal
brave="brave-browser --password-store=basic"

# give it time to build every workspace, it's very calming
wait_time=6

# you shall begin
i3-msg "workspace 1; exec $terminal;"
sleep $(($wait_time/2))
i3-msg "exec $terminal"
sleep $(($wait_time/2))

i3-msg "workspace 4; exec $brave --new-window gmail.com"
sleep $wait_time

i3-msg "workspace 6; exec signal-desktop"
sleep $wait_time

i3-msg "workspace 9; exec /usr/local/bin/bitcoin-qt"
sleep $wait_time

i3-msg "workspace 1"
