#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

tput bold
xrdb .Xdefaults

# Not my main console write line out
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

alias ls='ls --color=auto'

alias minecraft="DRI_PRIME=1 minecraft-launcher"

alias java12="sudo archlinux-java set java-12-openjdk"
alias java8="sudo archlinux-java set java-8-openjdk/jre"
alias dels="shutdown now"
alias r="i3-msg restart"
alias keyget="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias mars="java -jar /home/me/doc/Mars4_5.jar"

