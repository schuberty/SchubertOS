#!/bin/bash
########################################################################
#=- Script to install all packages, setup DE and add user after fresh arch install
shopt -s extglob

# Variables
#=- Git repository ones
_git="https://github.com/schuberty"
_repo="SchubertOS/raw/master/pos-install"
#=- Ethernet mode
et_mod="enp3s0"
#=- All others packages
DE="vim wget xorg-server xf86-input-mouse xf86-input-keyboard xf86-video-vesa xorg-xinit i3-wm i3status i3lock dmenu awesome-terminal-fonts terminus-font ttf-dejavu xterm git lightdm lightdm-gtk-greeter firefox firefox-i18n-pt-br bash-completion"
opt_fonts="noto-fonts ttf-ubuntu-font-family ttf-liberation ttf-droid ttf-inconsolata ttf-roboto ttf-font-awesome"
opt_ranger="ranger atool highlight elinks mediainfo w3m ffmpegthumbnailer"
opt_tools="reflector neovim calcurse p7zip unzip docker git wget go vlc urxvt-font-size-git"
opt_audio="alsa-utils alsa-plugins alsa-lib pavucontrol"
bases="compton synapse libreoffice gtop telegram-desktop"
dev="jdk-openjdk maven"

# Functions to install
#=- Update mirror list for Brazil
set_mirror(){
    sudo systemctl enable dhcpcd@$et_mod
    sudo systemctl start dhcpcd@$et_mod

    sudo pacman -S reflector --noconfirm --needed
    sudo reflector --verbose --country Brazil --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
}
#=- Add new user as sudo
set_sudouser(){
    [[ -z "$2" ]] && echo "Type username." && exit 1
    username=$(echo "$2" | tr -d ' _-' | tr 'A-Z' 'a-z')
    
    echo "Username: $username. Type and confirm password:"
    useradd -m -g users -G wheel,storage,power,video,network -s /bin/bash "$username"
    passwd "$username"
    pacman -S sudo --noconfirm
    sed -i "s/^root ALL=(ALL) ALL$/root ALL=(ALL) ALL\n${username} ALL=(ALL) ALL\n/" /etc/sudoers
    wget "$_git/$_repo/xtd" -O /home/${username}/.Xdefaults 2>/dev/null
    echo "exec i3" > /home/${username}/.xinitrc && echo "tput bold" >> /home/${username}/.bashrc
    echo "xrdb .Xdefaults" >> /home/${username}/.bashrc
    echo "Username created and included as sudo group."

    echo "Creating main dirs..."
    mkdir /home/${username}/box
    mkdir /home/${username}/box/Documentos
    mkdir /home/${username}/box/Downloads
    mkdir /home/${username}/box/Imagens
    mkdir /home/${username}/box/Softwares
    mkdir /home/${username}/box/Universidade
    echo "Linking..."
    ln -s /home/${username}/box/Documentos /home/${username}/doc
    ln -s /home/${username}/box/Downloads /home/${username}/dwn
    ln -s /home/${username}/box/Imagens /home/${username}/img
    ln -s /home/${username}/box/Softwares /home/${username}/sft
    ln -s /home/${username}/box/Universidade /home/${username}/uni
    echo "Main dirs created and linked."
}
#=- Set i3 gaps desktop environment
set_de(){
    pacman -S $DE --noconfirm --needed
    
    sudo systemctl enable lightdm
    sed -i 's/^#greeter-session.*/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf
    sed -i '/^#greeter-hider-user=/s/#//' /etc/lightdm/lightdm.conf
    wget "$_git/$_repo/back.jpg" -O /usr/share/pixmaps/back.jpg 2>/dev/null
    wget "$_git/$_repo/key" -O /etc/X11/xorg.conf.d/10-evdev.conf 2>/dev/null
    echo -e "[greeter]\nbackground=/usr/share/pixmaps/back.jpg" > /etc/lightdm/lightdm-gtk-greeter.conf
}
#=- Download and install packages
set_basic(){
    if hash yay 2>/dev/null; then
        echo "Yay AUR Helper already installed, skipping..."
    else
        sudo pacman -S git --noconfirm --needed
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd .. && rm -fr yay
    fi

    yay -Syu
    yay -S $opt_fonts $opt_ranger $opt_tools $opt_audio $bases $dev --noconfirm --needed

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python get-pip.py
}

# Dialog functions (to implement, one day...)

# Main usage

usage_help(){
    cat <<EOF
Usage: ${0##*/} [options]
    Options:

      --mirror,       -m             # Update mirrorlist for Brazil
      --sudouser,     -su  <user>    # Create a user as sudo
      --installde,    -ide           # Install i3 desktop environment
      --installbasic, -ib            # Install basic applications

EOF
}

case "$1" in

    "--mirror"|"-m") set_mirror ;;
    "--sudouser"|"-su") set_sudouser "$@";;
    "--installde"|"-ide") set_de ;;
    "--installbasic"|"-ib") set_basic ;;
    *) echo "Invalid option." && usage_help ;;

esac

exit 0
