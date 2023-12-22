#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybarexample /config.ini
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload sophobar &
done
#polybar sophobar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
