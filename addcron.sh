SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Add crontab entry to run the script on startup
chmod +x $SCRIPT_DIR/start_all.sh
chmod +x $SCRIPT_DIR/run_server.sh
chmod +x $SCRIPT_DIR/qr_background.sh


echo "@reboot $SCRIPT_DIR/start_all.sh" > mycron
sudo crontab mycron
rm mycron