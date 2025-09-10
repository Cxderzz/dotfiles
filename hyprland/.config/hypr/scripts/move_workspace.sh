#!/bin/bash
MAINMONITORNAME=$(hyprctl monitors | grep 'ID 0' | cut -d ' ' -f2)
SIDEMONITORNAME=$(hyprctl monitors | grep 'ID 1' | cut -d ' ' -f2)
if (( $1 > 10 )) | (( $1 < 1 )) ; then 
  exit
fi


echo "Moving focus to Main Monitor"
# first monitor
hyprctl dispatch focusmonitor $MAINMONITORNAME
echo 'Side calculated'
SIDE=$(($1+10))
echo $SIDE
# change workspace on first monitor
echo "Moving main monitor to side calculated"
hyprctl dispatch workspace $SIDE
# swap workspaces between monitors
echo "Swapping workspaces between monitors"
hyprctl dispatch swapactiveworkspaces "$MAINMONITORNAME $SIDEMONITORNAME"
# change workspace on first monitor
echo "Changing workspace on first monitor to "
echo $1
hyprctl dispatch workspace $1

hyprctl dispatch moveworkspacetomonitor $SIDE l
