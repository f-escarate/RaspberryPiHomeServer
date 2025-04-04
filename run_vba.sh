echo $USER

export DISPLAY=:0
export XAUTHORITY="/home/$USER/.Xauthority"
export XDG_RUNTIME_DIR="/run/user/$(id -u $USER)"

snap run visualboyadvance-m &