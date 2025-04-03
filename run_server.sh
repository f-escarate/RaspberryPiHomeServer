SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

source .venv/bin/activate

nohup python3 "$SCRIPT_DIR/main.py" > logs 2>&1 &