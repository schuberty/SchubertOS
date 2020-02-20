#!/bin/bash
#=- Extended globbing
shopt -s extglob

#=- Variables
repository="https://github.com/schuberty/SchubertOS/raw/master/pos-install"
deskEnv="xorg xorg-xinit xorg-server lightdm lightdm-gtk-greeter i3-gaps"


#=- Update mirror with reflector package
setMirror(){
	if hash yay 2>/dev/null; then
		echo "Yay AUR Helper already installer."
	else
		sudo pacman -S git --noconfirm --needed
		git clone https://aur.archlinux.org/yay.git
		cd yay && makepkg -si --noconfirm
		cd .. && rm -fr yay
	fi
	
	yay -S reflector --needed --noconfirm
	
	sudo reflector --verbose --country Brazil --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
}

setDeskEnv(){
	yay -S $deskEnv --noconfirm --needed
	
	sudo systemctl enable lightdm
	sed -i 's/^#greeter-session.*/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf
	sed -i '/^#greeter-hider-user=/s/#//' /etc/lightdm/lightdm.conf
	wget "$repository/back.jpg" -O /usr/share/pixmaps/back.jpg 2>/dev/null
	wget "$repository/key" -O /etc/X11/xorg.conf.d/10-evdev.conf 2>/dev/null
	echo -e "[greeter]\nbackground=/usr/share/pixmaps/back.jpg" > /etc/lightdm/lightdm-gtk-greeter.conf
}

#=- Usage

usageHelp(){
	cat <<EOF
Usage: ${0##*/} [options]
    Options:
		--mirror	-m		# Update mirrors
		--desktop	-de		# Install desktop environment
EOF
}

case "$1" in
	"--mirror"|"-m") setMirror ;;
	"--desktop"|"-de") deskEnv ;;
	*) echo "Invalid option." && usageHelp ;;
esac

exit 0


