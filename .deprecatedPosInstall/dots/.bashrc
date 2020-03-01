#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Already here I don't move :p
tput bold
xrdb .Xdefaults

# Exports
export ANDROID_HOME=~/box/Softwares/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export EDITOR=nvim

# Negrito
BOLD="\[$(tput bold)\]"
# Reseta p/ padrão
RESET="\[$(tput sgr0)\]"
# Vermelho
RED="\[$(tput setaf 1)\]"
# Verde
GRE="\[$(tput setaf 2)\]"
# Amarelo
YEL="\[$(tput setaf 3)\]"
# Azul
BLU="\[$(tput setaf 4)\]"
# Rosa
MAG="\[$(tput setaf 5)\]"
# Ciano
CYA="\[$(tput setaf 6)\]"
# Branco
WHI="\[$(tput setaf 7)\]"
# Hora
TIME="\t"
# Usuário
USER="\u"
# Nome da máquina
PC="\h"
# Diretório completo
DIR="\w"
# Diretório atual
MDIR="\W"

# Alternativa maior
#PS1="$BOLD$CYA$TIME $RED[ $YEL$USER$RESET$CYA using $BOLD$BLU$PC$RESET$CYA at $BOLD$MAG$DIR $RED]\n$WHI\$ $RESET"
# Linha principal
PS1="$BOLD$CYA$TIME $RED[$YEL$USER$GRE@$BLU$PC$RESET$CYA at $BOLD$MAG$DIR$RED]\n $WHI$ $RESET"

# Comando c/ ls cores automáticas
alias ls='ls --color=auto'

alias java13="sudo archlinux-java set java-13-openjdk"
alias java11="sudo archlinux-java set java-11-openjdk"
alias java8="sudo archlinux-java set java-8-openjdk"
alias dels="shutdown now"
alias keyget="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias yEd="java -jar ~/sft/yEd_Graph_Editor/yed.jar"
alias UML="./sft/Visual_Paradigm/Visual_Paradigm"
alias edit="nvim"
alias vim="nvim"
alias net="systemctl start dhcpcd@enp3s0"
alias py="python"
alias notServer="ssh -p 49776 mine@192.168.0.11"
alias notFiles="sshfs -p 49776 mine@192.168.0.11:/home/mine/Shared /home/me/box/Servidores"
alias mars="java -jar ~/box/Softwares/MARS_MIPS_Simulator/Mars4_5.jar"
alias upmirror="sudo reflector --verbose --country Brazil --latest 5 --sort rate --save /etc/pacman.d/mirorlist"
