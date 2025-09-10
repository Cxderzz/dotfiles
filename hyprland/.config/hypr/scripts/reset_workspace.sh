#!/bin/bash
MAINMONITORNAME=$(hyprctl monitors | grep 'ID 0' | cut -d ' ' -f2)
SIDEMONITORNAME=$(hyprctl monitors | grep 'ID 1' | cut -d ' ' -f2)
# first monitor
hyprctl dispatch focusmonitor $MAINMONITORNAME
hyprctl dispatch workspace 11
hyprctl dispatch swapactiveworkspaces "$MAINMONITORNAME $SIDEMONITORNAME"
hyprctl dispatch workspace 1
