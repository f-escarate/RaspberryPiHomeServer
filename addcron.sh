SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Add crontab entry to run the script on startup
chmod +x $SCRIPT_DIR/start_all.sh

echo "@reboot sudo -u $USER $SCRIPT_DIR/start_all.sh > $SCRIPT_DIR/cron_logs" > mycron
sudo crontab mycron
rm mycron