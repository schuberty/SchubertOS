#!/bin/bash

_USER=$(whoami)
lastNum=0

while true; do
    workspaceNum=$(i3-msg -t get_workspaces | jq ".[] | select(.focused==true) | .num")
    if [ $lastNum -ne $workspaceNum ]; then
      feh --bg-fill "/home/$_USER/box/Images/.workspacesBackground/${workspaceNum}.png"
      lastNum=$workspaceNum
    fi
done
