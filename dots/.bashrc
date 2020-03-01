#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
tput bold
#xrdb .Xdefaults
export EDITOR=nvim

# Bold
BOLD="\[$(tput bold)\]"
# Reset
RESET="\[$(tput sgr0)\]"
# Red
RED="\[$(tput setaf 1)\]"
# Green
GRE="\[$(tput setaf 2)\]"
# Yellow
YEL="\[$(tput setaf 3)\]"
# Blue
BLU="\[$(tput setaf 4)\]"
# Pink
MAG="\[$(tput setaf 5)\]"
# Cian
CYA="\[$(tput setaf 6)\]"
# White
WHI="\[$(tput setaf 7)\]"
# Time
TIME="\t"
# Username
USER="\u"
# Machine name
PC="\h"
# Full dir
DIR="\w"
# Actual dir
MDIR="\W"

# Short command line
#PS1="$BOLD$CYA$TIME $RED[ $YEL$USER$RESET$CYA using $BOLD$BLU$PC$RESET$CYA at $BOLD$MAG$DIR $RED]\n$WHI\$ $RESET"
# Larger command line
PS1="$BOLD$CYA$TIME $RED[$YEL$USER$GRE@$BLU$PC$RESET$CYA at $BOLD$MAG$DIR$RED]\n $WHI$ $RESET"

alias ls='ls --color=auto'

alias _keyget="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias _upmirror="sudo reflector --verbose --country Brazil --latest 5 --sort rate --save /etc/pacman.d/mirorlist"
alias _editswap="rm ~/.local/share/nvim/swap/*"

alias vim="nvim"
alias py="python3"
alias audio="pavucontrol"
alias see="w3m"
alias logout="i3-msg exit"
