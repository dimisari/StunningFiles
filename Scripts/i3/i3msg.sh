
# give it time to build every workspace, it's very calming
wait_time=4
btc_wait_time=10

# scripts directory
scripts_dir=$(cd $(dirname $0) && pwd)

# to execute
terminal=i3-sensible-terminal
brave="brave-browser --password-store=basic"

# you shall begin
i3-msg "workspace 1; exec $terminal;"
sleep 1

i3-msg "workspace 4; exec $brave"
sleep $wait_time

i3-msg "workspace 6; exec signal-desktop"
sleep $wait_time

i3-msg "workspace 9; exec /usr/local/bin/bitcoin-qt"
sleep $btc_wait_time

i3-msg "workspace 1"
