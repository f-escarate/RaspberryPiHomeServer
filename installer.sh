sudo apt update
sudo apt install qrencode feh -y
sudo apt install steamlink
sudo apt install snapd -y
sudo snap install snapd
sudo snap install visualboyadvance-m
sudo snap install --edge visualboyadvance-m

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# Add crontab entry to run the script on startup
chmod +x $SCRIPT_DIR/addcron.sh
./addcron.sh