#!/bin/bash

AC=$(acpi -a | awk '{ print $3 }')
BAT=$(acpi -b | awk '{ print $4 }')
BAT=${BAT//%}; BAT=${BAT//,}

if [ $AC = "on-line" ]; then
    printf "{"
else
    printf "{"
fi

[ $BAT -eq 100 ] && printf " $BAT "
[ $BAT -ge 90 ] && [ $BAT -lt 100 ] && printf " 0$BAT "
[ $BAT -ge 60 ] && [ $BAT -lt 90 ] && printf " 0$BAT "
[ $BAT -lt 60 ] && [ $BAT -ge 25 ] && printf " 0$BAT "
[ $BAT -lt 25 ] && [ $BAT -ge 10 ] && printf " 0$BAT "
[ $BAT -lt 10 ] && printf " 00$BAT "

printf \\n
exit 0