#!/bin/bash

function check_online
{
    netcat -z -w 5 8.8.8.8 53 && echo 1 || echo 0
}

# Initial check to see if we are online
IS_ONLINE=check_online
# How many times we should check if we're online - this prevents infinite looping
MAX_CHECKS=50
# Initial starting value for checks
CHECKS=0

# Loop while we're not online.
while [ $IS_ONLINE -eq 0 ]; do
    # We're offline. Sleep for a bit, then check again
    echo "waiting for internet connection ..."
    sleep 10;
    IS_ONLINE=check_online

    CHECKS=$[ $CHECKS + 1 ]
    if [ $CHECKS -gt $MAX_CHECKS ]; then
        break
    fi
done

if [ $IS_ONLINE -eq 0 ]; then
    # We never were able to get online. Kill script.
    exit 1
fi

export DISPLAY=:0
export XAUTHORITY="/home/$USER/.Xauthority"
export XDG_RUNTIME_DIR="/run/user/$(id -u $USER)"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LOCAL_IP=$(hostname -I | awk '{print $1}')

qrencode -o $SCRIPT_DIR/qr_background.png -s 10 -m 2 "http://$LOCAL_IP:8000"
pcmanfm --set-wallpaper="$SCRIPT_DIR/qr_background.png" --wallpaper-mode=fit
feh --bg-scale "$SCRIPT_DIR/qr_background.png"

cd $SCRIPT_DIR
source .venv/bin/activate
nohup python3 "$SCRIPT_DIR/main.py" > logs 2>&1 &