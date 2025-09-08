#!/usr/bin/sh

WALLID1="2858592399"

if [[ "$(hostnamectl hostname)" == "archlinux-laptop" ]]; then
  DISPLAY="eDP-1"
else
  DISPLAY="DP-1"  
fi

linux-wallpaperengine --volume 100 --screen-root $DISPLAY --bg $WALLID1
