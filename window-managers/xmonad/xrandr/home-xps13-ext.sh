#! /bin/bash

# DP2  = external Dell monitor
# eDP1 = laptop screen

xrandr \
  --output DP2  --primary --mode 2560x1440 --pos 1920x0 \
  --output eDP1           --mode 1920x1080 --pos 0x360  \
