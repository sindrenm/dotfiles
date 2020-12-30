#! /bin/bash

# Launch a process, but only if it's not already running
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Set the compose key to Caps Lock
setxkbmap -option compose:caps

# Set up with Dell XPS 13 and external Dell monitor
# TODO: Read config from an env variable or something?
$HOME/.config/xrandr/home-xps13-ext.sh &

# Launch and configure Polybar
$HOME/.config/polybar/launch-single-main.sh &

# Set a proper default cursor
xsetroot -cursor_name left_ptr &

# Turn on NumLock because it's kinda nice
numlockx on &

# Show NetworkManager in the bar
run nm-applet &

# Show Pamac int he bar
run pamac-tray &

# Launch the Xfce power manager
#run xfce4-power-manager &

# Display a volume icon inthe bar
run volumeicon &

# A PolKit is probably a good idea
# TODO: Swap out with lxsession?
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Enable notifications
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Run and configure the Picom compositor
picom --config $HOME/.config/xmonad/scripts/picom.conf &

# Restore wallpaper
nitrogen --restore &
