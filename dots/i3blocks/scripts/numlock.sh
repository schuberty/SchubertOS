#!/bin/bash

NL=$(xset -q | grep Num | awk '{ print $8 }')

if [ $NL = "on" ]; then
    printf \\n
else
    printf \\n
fi

exit 0