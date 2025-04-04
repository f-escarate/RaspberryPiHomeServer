# Below is the QR background generation logic


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LOCAL_IP=$(hostname -I | awk '{print $1}')

qrencode -o $SCRIPT_DIR/qr_background.png -s 10 -m 2 "http://$LOCAL_IP:8000"
pcmanfm --set-wallpaper $SCRIPT_DIR/qr_background.png --wallpaper-mode=fit
feh --bg-scale $SCRIPT_DIR/qr_background.png