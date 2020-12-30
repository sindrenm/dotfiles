#! /bin/bash

# More info : https://github.com/jaagr/polybar/wiki

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch polybar for the main screen only
MONITOR=DP2 polybar --reload xmonad-main -c ~/.config/polybar/config &
