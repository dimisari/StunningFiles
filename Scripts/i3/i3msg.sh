
# give it time to build every workspace, it's very calming
signal_wait_time=5
btc_wait_time=13

# scripts directory
scripts_dir=$(cd $(dirname $0) && pwd)

# you shall begin
i3-msg "workspace 1; workspace 6; exec signal-desktop"
sleep $signal_wait_time

i3-msg "workspace 9; exec /usr/local/bin/bitcoin-qt"
