#!/bin/bash

LEVEL=$(cat /sys/class/backlight/intel_backlight/brightness)

if [ $LEVEL -le 7500 ]; then
    LEVEL=$(($LEVEL+750))
    echo $LEVEL > /sys/class/backlight/intel_backlight/brightness
fi

exit 0