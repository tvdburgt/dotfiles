#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
PS1='\[\e[32m\]\w\[\e[0m\] \[\e[31m\]\$\[\e[0m\] '
#PS1='[\[\033[0;34m\]\u\[\033[0;33m\]@\[\033[0;34m\]\h\[\033[1;31m\] :\w\[\033[1;37m\]\[\033[0m\]] > \[\033[0m\]'

# Enable tab-completion using sudo and man
complete -cf sudo man

# Set up in separate file?
alias pip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias ls='ls -F --color=auto'
alias rm='rm -Iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias less='less -R' # not tested
alias pacman='sudo pacman-color'
alias pacorphans='pacman -Rs $(pacman -Qtdq)'
alias t='echo 1: $1, 2: $2 3: $3'

# Environment variables
export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:~/bin

eval $(dircolors -b ~/.lscolors)

function vpn() {
    [[ ! -f $1 ]] && echo "$1: no such file" && return

    sudo openvpn --daemon --cd $(dirname $1) --config $(basename $1)
}
    

# go to google for anything
google() {
    [[ -z "$BROWSER" ]] && return 1

    local term="${*:-$(xclip -o)}"

    $BROWSER "http://www.google.com/search?q=${term// /+}" &>/dev/null &
}

# go to google for a definition
define() {

    local lang charset

    lang="${LANG%%_*}"
    charset="${LANG##*.}"

    lynx -accept_all_cookies \
         -dump \
         -hiddenlinks=ignore \
         -nonumbers \
         -assume_charset="$charset" \
         -display_charset="$charset" \
         "http://www.google.com/search?hl=$lang&q=define%3A+$1&btnG=Google+Search" \
         | grep -A 100 '^ 1\. ' | egrep '^ (1\.| ) '
}
