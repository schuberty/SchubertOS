#! /bin/bash

Xorg_packages="nvidia nvidia-utils nvidia-settings xorg-server xorg-apps xorg-xinit i3-gaps numlockx"
display_mang="lightdm lightdm-gtk-greeter"
fonts="noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome"
sound_drivers="alsa-utils alsa-plugins alsa-lib pavucontrol"
productivity="rxvt-unicode ranger urxvt-font-size-git"

all="$Xorg_packages $display_mang $fonts $sound_drivers $productivity"

yay -S $all --needed

