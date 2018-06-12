#!/bin/sh

# Get out of town if something errors
set -e

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )
DP_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

if [ "connected" == "$HDMI_STATUS" ]; then
    /usr/bin/xrandr --output HDMI-1 --right-of DP-1 --auto
    /usr/bin/xrandr --output DP-1 --off
    #/usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "HDMI plugged in"
elif [ "connected" == "$DP_STAUTS" ]; then
    /usr/bin/xrandr --output HDMI-1 --off
    /usr/bin/xrandr --output DP-1 --left-of eDP-1 --auto
    #/usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "VGA plugged in"
else
    /usr/bin/xrandr --output HDMI-1 --off
    /usr/bin/xrandr --output DP-1 --off

    exit
fi
