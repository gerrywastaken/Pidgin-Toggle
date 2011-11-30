#!/bin/sh
                                                                                                                                                                                                                                                                                                                                                                                                                             
trim() { echo $1; }                                                                                                                                                                                                                                
target=$(trim `wmctrl -lx | grep 'Pidgin' | grep -v 'Buddy' | grep -Eo '\-(.*)$' | grep -o '\s.*$'`)

# Unshade and bring to front
if [ -f /tmp/.quake.shaded ]; then
    wmctrl -r $target -b remove,below
    wmctrl -r $target -b remove,shaded
    rm /tmp/.quake.shaded
    # Shade and send to back
else
    wmctrl -r $target -b add,shaded
    sleep 1
    wmctrl -r $target -b add,below
    touch /tmp/.quake.shaded
fi
